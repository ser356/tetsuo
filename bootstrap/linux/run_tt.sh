#!/usr/bin/env bash
# Compiles a .tt file (already combined with its runtimes) using the stage1
# bootstrapped from the committed seed, translates it to aarch64 ELF through
# macho2elf.sh + the syscall shim, and runs it under qemu-aarch64.
# Usage: run_tt.sh <combined.tt> [args...]   -> exits with the program's rc.
# Requiere: qemu-aarch64, binutils-aarch64-linux-gnu.
set -uo pipefail
cd "$(dirname "$0")/../.."
export ASAN_OPTIONS=detect_leaks=0
BUILD=build
HARNESS=bootstrap/linux
mkdir -p "$BUILD/linux"

for tool in qemu-aarch64 aarch64-linux-gnu-as aarch64-linux-gnu-ld; do
    command -v "$tool" >/dev/null || { echo "falta dependencia: $tool" >&2; exit 127; }
done

[[ -f "$BUILD/linux/shim.o" ]] || \
    aarch64-linux-gnu-as "$HARNESS/shim.s" -o "$BUILD/linux/shim.o"

mk_elf() { # $1=input.s $2=output_bin
    "$HARNESS/macho2elf.sh" "$1" > "$2.elf.s"
    aarch64-linux-gnu-as "$2.elf.s" -o "$2.o"
    aarch64-linux-gnu-ld -e _linux_start -o "$2" "$2.o" "$BUILD/linux/shim.o"
}

# stage1 from the committed seed (it already understands everything the seed
# supports).
if [[ ! -x "$BUILD/linux/stage1" ]]; then
    mk_elf bootstrap/tetsuoc.s "$BUILD/linux/stage1"
fi

IN="$1"; shift || true
NAME=$(basename "${IN%.*}")
qemu-aarch64 "$BUILD/linux/stage1" "$IN" -o "$BUILD/$NAME.s" || { echo "COMPILE FAIL rc=$?" >&2; exit 90; }
mk_elf "$BUILD/$NAME.s" "$BUILD/linux/$NAME" || { echo "ASM/LD FAIL" >&2; exit 91; }
qemu-aarch64 "$BUILD/linux/$NAME" "$@"
