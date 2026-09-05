#!/usr/bin/env bash
# Translates the macOS (Mach-O) asm emitted by tetsuo into aarch64-linux ELF asm.
set -euo pipefail
sed -e 's/^    \.section __TEXT,__text$/    .text/' \
    -e 's/^    \.section __TEXT,__cstring$/    .section .rodata/' \
    -e 's/^    \.zerofill __DATA,__bss,\([A-Za-z0-9_]*\),\([0-9]*\),3$/    .comm \1,\2,8/' \
    -e 's/, \([A-Za-z0-9_.]*\)@PAGEOFF$/, :lo12:\1/' \
    -e 's/@PAGE$//' \
    -e 's/^    svc     #0x80$/    bl      _tt_sys/' \
    "$1"
