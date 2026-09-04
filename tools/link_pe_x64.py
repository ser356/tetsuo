#!/usr/bin/env python3
import struct
import sys
from pathlib import Path


def align(value, boundary):
    return (value + boundary - 1) // boundary * boundary


def coff_name(raw, data, string_base):
    if raw[:4] == b"\0\0\0\0":
        offset = struct.unpack_from("<L", raw, 4)[0]
        start = string_base + offset
    elif raw.startswith(b"/"):
        start = string_base + int(raw[1:].rstrip(b"\0"))
    else:
        return raw.rstrip(b"\0").decode()
    end = data.index(0, start)
    return data[start:end].decode()


def section_header(name, virtual_size, rva, raw_size, raw_offset, flags):
    return struct.pack(
        "<8sLLLLLLHHL",
        name.encode().ljust(8, b"\0"),
        virtual_size,
        rva,
        raw_size,
        raw_offset,
        0,
        0,
        0,
        0,
        flags,
    )


def main():
    if len(sys.argv) != 3:
        raise SystemExit("usage: link_pe_x64.py INPUT.obj OUTPUT.exe")
    source = Path(sys.argv[1]).read_bytes()
    machine, section_count, _, symbol_offset, symbol_count, optional_size, _ = struct.unpack_from(
        "<HHLLLHH", source, 0
    )
    if machine != 0x8664 or optional_size != 0:
        raise SystemExit("expected AMD64 COFF object")
    string_base = symbol_offset + symbol_count * 18
    sections = []
    for index in range(section_count):
        offset = 20 + index * 40
        raw_name = source[offset : offset + 8]
        _, _, size, raw_offset, reloc_offset, _, reloc_count, _, flags = struct.unpack_from(
            "<LLLLLLHHL", source, offset + 8
        )
        sections.append(
            {
                "name": coff_name(raw_name, source, string_base),
                "size": size,
                "raw": raw_offset,
                "reloc": reloc_offset,
                "nreloc": reloc_count,
                "flags": flags,
            }
        )
    symbols = {}
    symbol_names = {}
    index = 0
    while index < symbol_count:
        offset = symbol_offset + index * 18
        raw_name, value, section_number, _, storage, aux = struct.unpack_from(
            "<8sLhHBB", source, offset
        )
        name = coff_name(raw_name, source, string_base)
        symbols[index] = (name, value, section_number, storage)
        symbol_names[name] = symbols[index]
        index += 1 + aux
    buffers = {"text": bytearray(), "rdata": bytearray()}
    bss_size = 0
    for section in sections:
        name = section["name"]
        if name.startswith(".text"):
            group = "text"
        elif name.startswith(".rdata"):
            group = "rdata"
        elif name.startswith(".bss"):
            group = "bss"
        elif section["size"] == 0 or name.startswith(".llvm") or name.startswith(".data"):
            section["group"] = None
            section["base"] = 0
            continue
        else:
            raise SystemExit(f"unsupported COFF section: {name}")
        power = (section["flags"] >> 20) & 15
        boundary = 1 << (power - 1) if power else 1
        if group == "bss":
            bss_size = align(bss_size, boundary)
            section["base"] = bss_size
            bss_size += section["size"]
        else:
            buffer = buffers[group]
            padding = align(len(buffer), boundary) - len(buffer)
            buffer.extend(b"\0" * padding)
            section["base"] = len(buffer)
            if section["size"]:
                buffer.extend(source[section["raw"] : section["raw"] + section["size"]])
        section["group"] = group
    referenced = set()
    for section in sections:
        if section.get("group") is None:
            continue
        for reloc_index in range(section["nreloc"]):
            offset = section["reloc"] + reloc_index * 10
            _, symbol_index, reloc_type = struct.unpack_from("<LLH", source, offset)
            if reloc_type != 4:
                raise SystemExit(f"unsupported AMD64 relocation: {reloc_type}")
            name, _, section_number, _ = symbols[symbol_index]
            if section_number == 0:
                referenced.add(name)
    import_order = [
        "exit",
        "_read",
        "_write",
        "_open",
        "_close",
        "_getpid",
        "_unlink",
        "_chdir",
        "_mkdir",
        "__p___argc",
        "__p___argv",
    ]
    unknown = referenced.difference(import_order)
    if unknown:
        raise SystemExit("unresolved symbols: " + ", ".join(sorted(unknown)))
    imports = [name for name in import_order if name in referenced]
    text = buffers["text"]
    thunk_offsets = {}
    for name in imports:
        thunk_offsets[name] = len(text)
        text.extend(b"\xff\x25\0\0\0\0")
    headers_size = 1024
    text_rva = 0x1000
    rdata_rva = align(text_rva + len(text), 0x1000)
    rdata = buffers["rdata"]
    idata_rva = align(rdata_rva + len(rdata), 0x1000)
    ilt_offset = 40
    iat_offset = align(ilt_offset + (len(imports) + 1) * 8, 8)
    dll_offset = iat_offset + (len(imports) + 1) * 8
    idata = bytearray(dll_offset)
    idata.extend(b"msvcrt.dll\0")
    if len(idata) & 1:
        idata.append(0)
    hint_offsets = {}
    for name in imports:
        hint_offsets[name] = len(idata)
        idata.extend(b"\0\0" + name.encode() + b"\0")
        if len(idata) & 1:
            idata.append(0)
    struct.pack_into(
        "<LLLLL", idata, 0, idata_rva + ilt_offset, 0, 0, idata_rva + dll_offset, idata_rva + iat_offset
    )
    for import_index, name in enumerate(imports):
        hint_rva = idata_rva + hint_offsets[name]
        struct.pack_into("<Q", idata, ilt_offset + import_index * 8, hint_rva)
        struct.pack_into("<Q", idata, iat_offset + import_index * 8, hint_rva)
        thunk_rva = text_rva + thunk_offsets[name]
        displacement = idata_rva + iat_offset + import_index * 8 - (thunk_rva + 6)
        struct.pack_into("<l", text, thunk_offsets[name] + 2, displacement)
    bss_rva = align(idata_rva + len(idata), 0x1000)
    group_rvas = {"text": text_rva, "rdata": rdata_rva, "bss": bss_rva}
    for section in sections:
        group = section.get("group")
        if group is None:
            continue
        if group == "bss":
            if section["nreloc"]:
                raise SystemExit("relocations in BSS are unsupported")
            continue
        buffer = buffers[group] if group != "text" else text
        for reloc_index in range(section["nreloc"]):
            offset = section["reloc"] + reloc_index * 10
            virtual_address, symbol_index, _ = struct.unpack_from("<LLH", source, offset)
            name, value, section_number, _ = symbols[symbol_index]
            if section_number == 0:
                target_rva = text_rva + thunk_offsets[name]
            else:
                target_section = sections[section_number - 1]
                target_rva = group_rvas[target_section["group"]] + target_section["base"] + value
            patch = section["base"] + virtual_address
            place_rva = group_rvas[group] + patch
            addend = struct.unpack_from("<l", buffer, patch)[0]
            struct.pack_into("<l", buffer, patch, addend + target_rva - place_rva - 4)
    if "tt_start" not in symbol_names:
        raise SystemExit("missing tt_start entry")
    _, entry_value, entry_section_number, _ = symbol_names["tt_start"]
    entry_section = sections[entry_section_number - 1]
    entry_rva = group_rvas[entry_section["group"]] + entry_section["base"] + entry_value
    text_raw_size = align(len(text), 512)
    rdata_raw_size = align(len(rdata), 512)
    idata_raw_size = align(len(idata), 512)
    text_raw = headers_size
    rdata_raw = text_raw + text_raw_size
    idata_raw = rdata_raw + rdata_raw_size
    image_size = align(bss_rva + bss_size, 0x1000)
    optional = bytearray(240)
    struct.pack_into("<HBBLLLLLQ", optional, 0, 0x20B, 0, 0, text_raw_size, rdata_raw_size + idata_raw_size, bss_size, entry_rva, text_rva, 0x140000000)
    struct.pack_into("<LLHHHHHHLLLLHHQQQQLL", optional, 32, 0x1000, 512, 6, 0, 0, 0, 6, 0, 0, image_size, headers_size, 0, 3, 0x8100, 0x100000, 0x1000, 0x100000, 0x1000, 0, 16)
    struct.pack_into("<LL", optional, 112 + 8, idata_rva, len(idata))
    struct.pack_into("<LL", optional, 112 + 12 * 8, idata_rva + iat_offset, (len(imports) + 1) * 8)
    image = bytearray(headers_size)
    image[0:2] = b"MZ"
    struct.pack_into("<L", image, 60, 128)
    image[128:132] = b"PE\0\0"
    struct.pack_into("<HHLLLHH", image, 132, 0x8664, 4, 0, 0, 0, 240, 0x22)
    image[152:392] = optional
    section_table = b"".join(
        [
            section_header(".text", len(text), text_rva, text_raw_size, text_raw, 0x60000020),
            section_header(".rdata", len(rdata), rdata_rva, rdata_raw_size, rdata_raw, 0x40000040),
            section_header(".idata", len(idata), idata_rva, idata_raw_size, idata_raw, 0xC0000040),
            section_header(".bss", bss_size, bss_rva, 0, 0, 0xC0000080),
        ]
    )
    image[392 : 392 + len(section_table)] = section_table
    image.extend(text)
    image.extend(b"\0" * (text_raw_size - len(text)))
    image.extend(rdata)
    image.extend(b"\0" * (rdata_raw_size - len(rdata)))
    image.extend(idata)
    image.extend(b"\0" * (idata_raw_size - len(idata)))
    Path(sys.argv[2]).write_bytes(image)


if __name__ == "__main__":
    main()
