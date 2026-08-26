#!/usr/bin/env python3
"""Ejecuta bajo qemu-aarch64 un Mach-O arm64 emitido por `tetsuoc --emit=macho`,
reproduciendo EXACTAMENTE su layout de memoria.

A diferencia de macho_run.py (que solo salta a main dentro de una copia de la
primera pagina), este harness construye un ELF estatico cuyos PT_LOAD calcan los
LC_SEGMENT_64 del Mach-O:

  - __TEXT se mapea r-x en su vmaddr real (0x100000000) desde el fichero, con la
    cabecera Mach-O y los cstrings incluidos, para que los adrp/add PC-relativos
    den exactamente las mismas direcciones que en macOS;
  - __DATA/__bss se mapea rw- anonimo (cero) en su vmaddr real, con su vmsize
    completo, para que los fixups FX_ADRPB/FX_PGOFB apunten a memoria valida;
  - los `svc #0x80` del cuerpo se reescriben a `bl` a un shim que traduce las
    syscalls BSD (x16) a Linux (x8).

Asi se ejercita el binario emitido de verdad (multi-pagina, bss lejano, cadenas,
llamadas, entry por LC_MAIN) sin necesidad de macOS, y se separa un fallo de
codegen/fixups de un fallo del contenedor Mach-O o de la firma.

Uso: macho_exec.py <macho> <elf_salida>   y luego: qemu-aarch64 <elf_salida>
"""
import os
import struct
import subprocess
import sys
import tempfile

PAGE = 0x10000          # alineacion de fichero/vaddr para los PT_LOAD
SHIM_BASE = 0xFFF00000  # justo debajo de __TEXT: alcanzable con un `bl` (+-128MB)

SHIM_ASM = """
    .text
    .globl _start
_start:
    ldr x0, [sp]                // argc
    add x1, sp, #8              // argv
    add x2, x1, x0, lsl #3
    add x2, x2, #8              // envp
    mov x3, #0                  // apple[]
    ldr x9, =0x%x
    br x9
    .globl _tt_sys
_tt_sys:
    cmp x16, #1
    b.eq .Lsys_exit
    cmp x16, #3
    b.eq .Lsys_read
    cmp x16, #4
    b.eq .Lsys_write
    cmp x16, #5
    b.eq .Lsys_open
    cmp x16, #6
    b.eq .Lsys_close
    mov x0, #86
    mov x8, #93
    svc #0
.Lsys_exit:
    mov x8, #93
    svc #0
    ret
.Lsys_read:
    mov x8, #63
    svc #0
    ret
.Lsys_write:
    mov x8, #64
    svc #0
    ret
.Lsys_open:
    cmp x1, #0
    b.eq .Lsys_open2
    mov x1, #0x241
.Lsys_open2:
    mov x3, x2
    mov x2, x1
    mov x1, x0
    mov x0, #-100
    mov x8, #56
    svc #0
    ret
.Lsys_close:
    mov x8, #57
    svc #0
    ret
"""


def die(msg):
    print("MACHO-EXEC FAIL:", msg, file=sys.stderr)
    sys.exit(97)


def parse_macho(data):
    magic, cputype = struct.unpack_from("<II", data, 0)
    if magic != 0xFEEDFACF:
        die("magic %#x no es MH_MAGIC_64" % magic)
    if cputype != 0x0100000C:
        die("cputype %#x no es ARM64" % cputype)
    ncmds = struct.unpack_from("<I", data, 16)[0]
    off = 32
    segs = []
    sects = []
    entryoff = None
    for _ in range(ncmds):
        cmd, cmdsize = struct.unpack_from("<II", data, off)
        if cmd == 0x19:  # LC_SEGMENT_64
            name = data[off + 8:off + 24].split(b"\0")[0].decode()
            vmaddr, vmsize, fileoff, filesize = struct.unpack_from("<QQQQ", data, off + 24)
            segs.append((name, vmaddr, vmsize, fileoff, filesize))
            nsects = struct.unpack_from("<I", data, off + 64)[0]
            so = off + 72
            for _s in range(nsects):
                sname = data[so:so + 16].split(b"\0")[0].decode()
                addr, size = struct.unpack_from("<QQ", data, so + 32)
                foff = struct.unpack_from("<I", data, so + 48)[0]
                sects.append((name, sname, addr, size, foff))
                so += 80
        elif cmd == 0x80000028:  # LC_MAIN
            entryoff = struct.unpack_from("<Q", data, off + 8)[0]
        off += cmdsize
    if entryoff is None:
        die("sin LC_MAIN")
    return segs, sects, entryoff


def build_shim(entry_va, shim_va, tmpdir):
    s = os.path.join(tmpdir, "shim.s")
    o = os.path.join(tmpdir, "shim.o")
    e = os.path.join(tmpdir, "shim.elf")
    b = os.path.join(tmpdir, "shim.bin")
    open(s, "w").write(SHIM_ASM % entry_va)
    subprocess.check_call(["aarch64-linux-gnu-as", s, "-o", o])
    subprocess.check_call(["aarch64-linux-gnu-ld", "-Ttext=0x%x" % shim_va, "-e", "_start", "-o", e, o])
    subprocess.check_call(["aarch64-linux-gnu-objcopy", "-O", "binary", "-j", ".text", e, b])
    syms = {}
    for line in subprocess.check_output(["aarch64-linux-gnu-nm", e]).decode().splitlines():
        parts = line.split()
        if len(parts) == 3:
            syms[parts[2]] = int(parts[0], 16)
    return open(b, "rb").read(), syms


def main():
    if len(sys.argv) < 3:
        die("uso: macho_exec.py <macho> <elf_salida>")
    src, dst = sys.argv[1], sys.argv[2]
    data = bytearray(open(src, "rb").read())
    segs, sects, entryoff = parse_macho(data)

    text = [s for s in segs if s[0] == "__TEXT"]
    if not text:
        die("sin segmento __TEXT")
    text_va, text_vmsize = text[0][1], text[0][2]
    entry_va = text_va + entryoff
    zerofill = [s for s in segs if s[0] not in ("__TEXT", "__PAGEZERO", "__LINKEDIT")]

    tmpdir = tempfile.mkdtemp()
    phnum = 2 + len(zerofill)
    hdrsz = 64 + phnum * 56
    shim_va = SHIM_BASE + hdrsz
    shim, syms = build_shim(entry_va, shim_va, tmpdir)
    sys_va = syms["_tt_sys"]

    # svc #0x80 -> bl _tt_sys, solo dentro de la seccion __text
    tsec = [s for s in sects if s[1] == "__text"]
    if not tsec:
        die("sin seccion __text")
    _, _, _, tsize, tfoff = tsec[0]
    npatch = 0
    for p in range(tfoff, tfoff + tsize - 3, 4):
        if struct.unpack_from("<I", data, p)[0] == 0xD4001001:
            delta = (sys_va - (text_va + p)) // 4
            if not -(1 << 25) <= delta < (1 << 25):
                die("shim fuera de alcance de bl (%d)" % delta)
            struct.pack_into("<I", data, p, 0x94000000 | (delta & 0x03FFFFFF))
            npatch += 1

    macho_foff = ((hdrsz + len(shim) + PAGE - 1) // PAGE) * PAGE
    phdrs = [(1, 5, 0, SHIM_BASE, hdrsz + len(shim), hdrsz + len(shim), PAGE),
             (1, 5, macho_foff, text_va, text_vmsize, text_vmsize, PAGE)]
    for (_nm, vmaddr, vmsize, _fo, _fs) in zerofill:
        phdrs.append((1, 6, 0, vmaddr, 0, vmsize, PAGE))

    ehdr = bytearray(64)
    ehdr[0:4] = b"\x7fELF"
    ehdr[4], ehdr[5], ehdr[6] = 2, 1, 1
    struct.pack_into("<HHI", ehdr, 16, 2, 183, 1)               # ET_EXEC, EM_AARCH64
    struct.pack_into("<QQQ", ehdr, 24, shim_va, 64, 0)          # entry, phoff, shoff
    struct.pack_into("<IHHHHHH", ehdr, 48, 0, 64, 56, len(phdrs), 64, 0, 0)

    out = bytearray(ehdr)
    for (typ, flags, foff, va, filesz, memsz, align) in phdrs:
        out += struct.pack("<IIQQQQQQ", typ, flags, foff, va, va, filesz, memsz, align)
    out += shim
    out += b"\0" * (macho_foff - len(out))
    out += data
    open(dst, "wb").write(bytes(out))
    os.chmod(dst, 0o755)
    sys.stderr.write("macho_exec: %s -> %s (entry=%#x, %d svc reescritos, %d PT_LOAD)\n"
                     % (src, dst, entry_va, npatch, len(phdrs)))


if __name__ == "__main__":
    main()
