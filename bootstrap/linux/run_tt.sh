#!/usr/bin/env bash
# Compila un fichero .tt (ya combinado con sus runtimes) usando el stage1
# bootstrappeado desde la seed committeada, lo traduce a ELF aarch64 via
# macho2elf.sh + shim de syscalls, y lo ejecuta bajo qemu-aarch64.
# Uso: run_tt.sh <combined.tt> [args...]   -> sale con el rc del programa.
# Requiere: qemu-aarch64, binutils-aarch64-linux-gnu.
set -uo pipefail
cd "$(dirname "$0")/../.."
export ASAN_OPTIONS=detect_leaks=0
BUILD=build
HARNESS=bootstrap/linux
mkdir -p "$BUILD/linux"

[[ -f "$BUILD/linux/shim.o" ]] || \
    aarch64-linux-gnu-as "$HARNESS/shim.s" -o "$BUILD/linux/shim.o"

mk_elf() { # $1=input.s $2=output_bin
    "$HARNESS/macho2elf.sh" "$1" > "$2.elf.s"
    aarch64-linux-gnu-as "$2.elf.s" -o "$2.o"
    aarch64-linux-gnu-ld -e _linux_start -o "$2" "$2.o" "$BUILD/linux/shim.o"
}

# stage1 desde la seed committeada (entiende ya todo lo que la seed soporta).
if [[ ! -x "$BUILD/linux/stage1" ]]; then
    mk_elf bootstrap/tetsuoc.s "$BUILD/linux/stage1"
fi

IN="$1"; shift || true
NAME=$(basename "${IN%.*}")
qemu-aarch64 "$BUILD/linux/stage1" "$IN" -o "$BUILD/$NAME.s" || { echo "COMPILE FAIL rc=$?" >&2; exit 90; }
mk_elf "$BUILD/$NAME.s" "$BUILD/linux/$NAME" || { echo "ASM/LD FAIL" >&2; exit 91; }
qemu-aarch64 "$BUILD/linux/$NAME" "$@"
