#!/usr/bin/env bash
# Verificacion del fixpoint en Linux x86_64 sin macOS:
# stage0 (C) se compila nativo, y los binarios arm64 emitidos se ejecutan
# bajo qemu-aarch64 tras traducir el asm Mach-O a ELF (macho2elf.sh) y
# enlazar el shim de syscalls BSD->Linux (shim.s).
# Requiere: gcc, qemu-user (qemu-aarch64), binutils-aarch64-linux-gnu.
set -euo pipefail
cd "$(dirname "$0")/../.."

export ASAN_OPTIONS=detect_leaks=0
BUILD=build
HARNESS=bootstrap/linux
mkdir -p "$BUILD/linux"

fail() { echo "VERIFY-LINUX FAIL: $1" >&2; exit 1; }

gcc -std=c11 -O0 -g -fsanitize=address,undefined -o "$BUILD/tetsuoc" src/*.c

aarch64-linux-gnu-as "$HARNESS/shim.s" -o "$BUILD/linux/shim.o"

# ensambla+enlaza un .s macOS emitido por tetsuo y lo deja ejecutable via qemu
mk_elf() { # $1=input.s $2=output_bin
    "$HARNESS/macho2elf.sh" "$1" > "$2.elf.s"
    aarch64-linux-gnu-as "$2.elf.s" -o "$2.o"
    aarch64-linux-gnu-ld -e _linux_start -o "$2" "$2.o" "$BUILD/linux/shim.o"
}

COMBINED=$BUILD/fixpoint_combined.tt
cat tests/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt tests/lexer.tt \
    src/parser.tt src/ir.tt src/codegen.tt src/main.tt > "$COMBINED"

"$BUILD/tetsuoc" --target=macos "$COMBINED" -o "$BUILD/fixpoint_s0.s"
mk_elf "$BUILD/fixpoint_s0.s" "$BUILD/linux/stage1"

qemu-aarch64 "$BUILD/linux/stage1" "$COMBINED" -o "$BUILD/fixpoint_s1.s" \
    || fail "stage1 no compilo el combined"
cmp "$BUILD/fixpoint_s0.s" "$BUILD/fixpoint_s1.s" || fail "s0 != s1"

mk_elf "$BUILD/fixpoint_s1.s" "$BUILD/linux/stage2"
qemu-aarch64 "$BUILD/linux/stage2" "$COMBINED" -o "$BUILD/fixpoint_s2.s" \
    || fail "stage2 no compilo el combined"
cmp "$BUILD/fixpoint_s1.s" "$BUILD/fixpoint_s2.s" || fail "s1 != s2"

qemu-aarch64 "$BUILD/linux/stage1" tests/macos_hello.tt -o "$BUILD/hello_s1.s" \
    || fail "stage1 no compilo macos_hello.tt"
mk_elf "$BUILD/hello_s1.s" "$BUILD/linux/hello"
out=$(qemu-aarch64 "$BUILD/linux/hello")
echo "$out" | grep -q "hola desde macOS" || fail "hello stage1 no imprime"

echo "VERIFY-LINUX OK (fixpoint bit a bit)"
