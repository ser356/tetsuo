#!/usr/bin/env python3
"""Ejecuta bajo qemu-aarch64 un Mach-O emitido por el codegen de bytes (24.e).

El binario usa la convencion de syscalls de macOS (x16 + svc #0x80), que qemu en
modo Linux-user no entiende. Para validar el RESULTADO de un programa que solo
computa y retorna (sin syscalls en el cuerpo), este harness:
  - localiza __text y el entryoff (_tt_start) en el Mach-O,
  - decodifica el primer 'bl' de _tt_start para hallar el offset de 'main',
  - genera un ELF que copia __text tal cual y salta a main (blr), tomando su
    valor de retorno como codigo de salida Linux.
Asi se ejercita el codigo generado (prologos, llamadas bl relativas, aritmetica,
control de flujo) realmente en la CPU, sin depender de macOS.

Uso: macho_run.py <macho_bin>   -> sale con el rc que devuelve main().
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
    # Cargamos la pagina __TEXT completa (que incluye header, codigo y cstrings)
    # en un blob alineado a pagina, para que la aritmetica adrp/add —calculada
    # para el layout Mach-O con base alineada a pagina— coincida bit a bit.
    page = 0x4000
    blob = data[0:page]
    w = struct.unpack_from("<I", data, entryoff)[0]
    if (w & 0xfc000000) != 0x94000000:
        die("primer instr de _tt_start no es bl (%#x)" % w)
    imm26 = w & 0x03ffffff
    if imm26 & 0x02000000: imm26 -= 0x04000000
    main_off = entryoff + imm26 * 4   # file offset de main() dentro del blob
    if main_off < 0 or main_off >= len(blob):
        die("main_off fuera de rango: %d" % main_off)

    # ELF: code_blob alineado a pagina; _start salta a main y hace exit(x0) Linux
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
