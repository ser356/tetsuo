#!/usr/bin/env python3
"""Runs a Mach-O emitted by the byte codegen (24.e) under qemu-aarch64.

The binary uses the macOS syscall convention (x16 + svc #0x80), which qemu in
Linux-user mode does not understand. To validate the RESULT of a program that
only computes and returns (with no syscalls in its body), this harness:
  - locates __text and the entryoff (_tt_start) in the Mach-O,
  - decodes the first 'bl' of _tt_start to find the offset of 'main',
  - generates an ELF that copies __text verbatim and jumps to main (blr), taking
    its return value as the Linux exit code.
This exercises the generated code (prologues, relative bl calls, arithmetic,
control flow) for real on the CPU, without depending on macOS.

Usage: macho_run.py <macho_bin>   -> exits with the rc main() returns.
"""
import sys, struct, subprocess, tempfile, os

def die(m):
    print("MACHO-RUN FAIL:", m, file=sys.stderr); sys.exit(97)

def main():
    if len(sys.argv) < 2:
        die("uso: macho_run.py <bin>")
    data = open(sys.argv[1], "rb").read()
    magic, cputype = struct.unpack_from("<II", data, 0)
    if magic != 0xfeedfacf: die("no es Mach-O 64")
    ncmds = struct.unpack_from("<I", data, 16)[0]
    off = 32; text_off = text_size = entryoff = None
    for _ in range(ncmds):
        cmd, cmdsize = struct.unpack_from("<II", data, off)
        if cmd == 0x19:
            segname = data[off+8:off+24].split(b"\0")[0]
            nsects = struct.unpack_from("<I", data, off+64)[0]
            so = off + 72
            for _s in range(nsects):
                sect = data[so:so+16].split(b"\0")[0]
                addr, size = struct.unpack_from("<QQ", data, so+32)
                foff = struct.unpack_from("<I", data, so+48)[0]
                if sect == b"__text":
                    text_off, text_size = foff, size
                so += 80
        elif cmd == 0x80000028:
            entryoff = struct.unpack_from("<Q", data, off+8)[0]
        off += cmdsize
    if text_off is None or entryoff is None:
        die("sin __text o LC_MAIN")
    # We load the complete __TEXT page (which includes header, code and
    # cstrings) into a page-aligned blob, so that the adrp/add arithmetic
    # -computed for the Mach-O layout with a page-aligned base- matches bit for
    # bit.
    page = 0x4000
    blob = data[0:page]
    w = struct.unpack_from("<I", data, entryoff)[0]
    if (w & 0xfc000000) != 0x94000000:
        die("primer instr de _tt_start no es bl (%#x)" % w)
    imm26 = w & 0x03ffffff
    if imm26 & 0x02000000: imm26 -= 0x04000000
    main_off = entryoff + imm26 * 4   # file offset of main() inside the blob
    if main_off < 0 or main_off >= len(blob):
        die("main_off fuera de rango: %d" % main_off)

    # ELF: page-aligned code_blob; _start jumps to main and does a Linux exit(x0)
    byts = ",".join(str(b) for b in blob)
    asm = f"""
    .text
    .globl _start
_start:
    adrp x9, code_blob
    add x9, x9, :lo12:code_blob
    add x9, x9, #{main_off}
    blr x9
    mov x8, #93
    svc #0
    .balign 4096
code_blob:
    .byte {byts}
"""
    with tempfile.TemporaryDirectory() as d:
        s = os.path.join(d, "h.s"); o = os.path.join(d, "h.o"); e = os.path.join(d, "h")
        open(s, "w").write(asm)
        subprocess.check_call(["aarch64-linux-gnu-as", s, "-o", o])
        subprocess.check_call(["aarch64-linux-gnu-ld", "-e", "_start", "-o", e, o])
        r = subprocess.run(["qemu-aarch64", e])
        sys.exit(r.returncode)

if __name__ == "__main__":
    main()
