#!/usr/bin/env python3
"""Validates an ad-hoc signed AArch64 Mach-O emitted by tetsuo, without macOS.

It checks what codesign/dyld would require:
 - a consistent header and load commands (magic, cputype, ncmds, sizeofcmds),
 - the presence of the required LCs (SEGMENT __PAGEZERO/__TEXT/__LINKEDIT,
   LOAD_DYLINKER, SYMTAB, DYSYMTAB, UUID, BUILD_VERSION, MAIN, CODE_SIGNATURE),
 - a well formed CS_SuperBlob and CS_CodeDirectory,
 - that the SHA-256 hashes of every 4KB page up to codeLimit match the ones
   stored in the CodeDirectory (this is exactly what codesign -v verifies),
 - that the body at entryoff is the expected exit(code) sequence.

Usage: check_macho.py <binary> <expected_exit_code>
Exits 0 if everything matches; prints the failure and exits !=0 otherwise.
"""
import sys, struct, hashlib

def die(m):
    print("CHECK-MACHO FAIL:", m); sys.exit(1)

def main():
    if len(sys.argv) < 3:
        die("uso: check_macho.py <bin> <exit_code>")
    path = sys.argv[1]
    want_exit = None if sys.argv[2] == "-" else int(sys.argv[2])
    data = open(path, "rb").read()
    if len(data) < 32:
        die("fichero demasiado corto")
    magic, cputype, cpusub, ftype, ncmds, sizeofcmds, flags, resv = struct.unpack_from("<IIIIIIII", data, 0)
    if magic != 0xfeedfacf: die("magic %#x != MH_MAGIC_64" % magic)
    if cputype != 0x0100000c: die("cputype %#x != ARM64" % cputype)
    if ftype != 2: die("filetype %d != MH_EXECUTE" % ftype)

    off = 32; seen = {}; entryoff = None; sig = None; text_seg = None
    for _ in range(ncmds):
        cmd, cmdsize = struct.unpack_from("<II", data, off)
        seen[cmd] = seen.get(cmd, 0) + 1
        if cmd == 0x19:  # LC_SEGMENT_64
            segname = data[off+8:off+24].split(b"\0")[0].decode()
            vmaddr, vmsize, fileoff, filesize = struct.unpack_from("<QQQQ", data, off+24)
            seen.setdefault("segs", []).append(segname)
            if segname == "__TEXT":
                text_seg = (vmaddr, vmsize, fileoff, filesize)
        elif cmd == 0x80000028:  # LC_MAIN
            entryoff, stacksize = struct.unpack_from("<QQ", data, off+8)
        elif cmd == 0x1d:  # LC_CODE_SIGNATURE
            dataoff, datasize = struct.unpack_from("<II", data, off+8)
            sig = (dataoff, datasize)
        off += cmdsize
    if off != 32 + sizeofcmds:
        die("sizeofcmds inconsistente: recorrido %d, declarado %d" % (off-32, sizeofcmds))

    segs = seen.get("segs", [])
    for req in ("__PAGEZERO", "__TEXT", "__LINKEDIT"):
        if req not in segs: die("falta segmento %s" % req)
    for cmd, name in ((0xe, "LC_LOAD_DYLINKER"), (0x2, "LC_SYMTAB"),
                      (0xb, "LC_DYSYMTAB"), (0x1b, "LC_UUID"),
                      (0x32, "LC_BUILD_VERSION"), (0x80000028, "LC_MAIN"),
                      (0x1d, "LC_CODE_SIGNATURE")):
        if cmd not in seen: die("falta %s" % name)
    if entryoff is None: die("sin entryoff (LC_MAIN)")
    if sig is None: die("sin LC_CODE_SIGNATURE")

    # cuerpo exit(code): movz x0,#code ; movz x16,#1 ; svc #0x80
    if want_exit is None:
        _check_signature(data, sig, entryoff, path)
        return
    body = struct.unpack_from("<III", data, entryoff)
    exp0 = 0xd2800000 | ((want_exit & 0xffff) << 5) | 0   # movz x0,#code
    exp1 = 0xd2800000 | ((1 & 0xffff) << 5) | 16          # movz x16,#1
    exp2 = 0xd4000001 | (0x80 << 5)                       # svc #0x80
    if body[0] != exp0: die("body[0]=%#x != movz x0,#%d (%#x)" % (body[0], want_exit, exp0))
    if body[1] != exp1: die("body[1]=%#x != movz x16,#1 (%#x)" % (body[1], exp1))
    if body[2] != exp2: die("body[2]=%#x != svc #0x80 (%#x)" % (body[2], exp2))

    _check_signature(data, sig, entryoff, path)

def _check_signature(data, sig, entryoff, path):
    # signature
    dataoff, datasize = sig
    if dataoff + datasize > len(data): die("firma fuera del fichero")
    sb = data[dataoff:dataoff+datasize]
    sbmagic, sblen, count = struct.unpack_from(">III", sb, 0)
    if sbmagic != 0xfade0cc0: die("SuperBlob magic %#x" % sbmagic)
    if sblen > len(sb): die("SuperBlob length %d > datasize %d" % (sblen, len(sb)))
    # indices
    cd_off = None
    for i in range(count):
        typ, blob_off = struct.unpack_from(">II", sb, 12 + i*8)
        if typ == 0:  # CSSLOT_CODEDIRECTORY
            cd_off = blob_off
    if cd_off is None: die("SuperBlob sin CodeDirectory")
    cd = sb[cd_off:]
    (cdmagic, cdlen, version, cdflags, hashOffset, identOffset,
     nSpecial, nCode, codeLimit) = struct.unpack_from(">IIIIIIIII", cd, 0)
    hashSize, hashType, platform, pageShift = struct.unpack_from(">BBBB", cd, 36)
    if cdmagic != 0xfade0c02: die("CodeDirectory magic %#x" % cdmagic)
    if hashType != 2: die("hashType %d != SHA-256" % hashType)
    if hashSize != 32: die("hashSize %d != 32" % hashSize)
    if pageShift != 12: die("hashPageShift %d != 12" % pageShift)
    pagesize = 1 << pageShift
    exp_slots = (codeLimit + pagesize - 1) // pagesize
    if nCode != exp_slots: die("nCodeSlots %d != ceil(codeLimit/page)=%d" % (nCode, exp_slots))
    ident = cd[identOffset:cd.index(b"\0", identOffset)].decode(errors="replace")

    # recompute the page hashes and compare them (what codesign -v does)
    for slot in range(nCode):
        start = slot * pagesize
        end = min(start + pagesize, codeLimit)
        h = hashlib.sha256(data[start:end]).digest()
        stored = cd[hashOffset + slot*32: hashOffset + slot*32 + 32]
        if h != stored:
            die("hash de pagina %d no coincide\n  calc=%s\n  cd  =%s" %
                (slot, h.hex(), stored.hex()))

    print("CHECK-MACHO OK: %s, %d slots, ident=%r, codeLimit=%#x, %d bytes" %
          (path, nCode, ident, codeLimit, len(data)))
    sys.exit(0)

if __name__ == "__main__":
    main()
