#!/usr/bin/env bash
# Verificacion del fixpoint en Linux x86_64 sin macOS:
# La seed committeada (bootstrap/tetsuoc.s, salida arm64 macho de stage1) se
# traduce a ELF via macho2elf.sh + shim de syscalls BSD->Linux (shim.s) y se
# ejecuta bajo qemu-aarch64.
# Requiere: qemu-user (qemu-aarch64), binutils-aarch64-linux-gnu.
set -euo pipefail
cd "$(dirname "$0")/../.."

export ASAN_OPTIONS=detect_leaks=0
BUILD=build
HARNESS=bootstrap/linux
SEED=bootstrap/tetsuoc.s
mkdir -p "$BUILD/linux"

fail() { echo "VERIFY-LINUX FAIL: $1" >&2; exit 1; }

aarch64-linux-gnu-as "$HARNESS/shim.s" -o "$BUILD/linux/shim.o"

# ensambla+enlaza un .s macOS y lo deja ejecutable via qemu
mk_elf() { # $1=input.s $2=output_bin
    "$HARNESS/macho2elf.sh" "$1" > "$2.elf.s"
    aarch64-linux-gnu-as "$2.elf.s" -o "$2.o"
    aarch64-linux-gnu-ld -e _linux_start -o "$2" "$2.o" "$BUILD/linux/shim.o"
}

COMBINED=$BUILD/fixpoint_combined.tt
cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt src/lexer.tt \
    src/parser.tt src/ir.tt src/codegen.tt src/main.tt > "$COMBINED"

# s0 = seed committeada
cp "$SEED" "$BUILD/fixpoint_s0.s"
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

# --- smokes de los hitos Mach-O (24.a..24.f) bajo qemu ---
smoke() { # $1=combined.tt $2=rc_esperado $3=nombre
    local rc=0
    bash "$HARNESS/run_tt.sh" "$1" > /tmp/tt_smoke.log 2>&1 || rc=$?
    [[ $rc -eq $2 ]] || fail "$3 rc=$rc esperado $2; log:\n$(cat /tmp/tt_smoke.log)"
}

# 24.a shifts: << y >> binarios (inmediato y registro)
if [[ -f tests/shifts_test.tt ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt tests/shifts_test.tt > "$BUILD/shifts_combined.tt"
    smoke "$BUILD/shifts_combined.tt" 0 "shifts_test"
fi

# 24.b encoder AArch64
if [[ -f src/asm.tt && -f tests/asm_test.tt ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt src/asm.tt tests/asm_test.tt > "$BUILD/asm_combined.tt"
    smoke "$BUILD/asm_combined.tt" 0 "asm_test"
fi

# 24.c SHA-256
if [[ -f lib/sha256.tt && -f tests/sha256_test.tt ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/sha256.tt tests/sha256_test.tt > "$BUILD/sha256_combined.tt"
    smoke "$BUILD/sha256_combined.tt" 0 "sha256_test"
fi

# 24.d/24.e/24.f Mach-O writer + firma ad-hoc: emite binario y lo valida el checker
if [[ -f src/macho.tt && -f tests/macho42_test.tt && -f "$HARNESS/check_macho.py" ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/sha256.tt src/asm.tt src/macho.tt tests/macho42_test.tt > "$BUILD/macho42_combined.tt"
    smoke "$BUILD/macho42_combined.tt" 0 "macho42_test"
    python3 "$HARNESS/check_macho.py" /tmp/tt_macho42 42 || fail "check_macho.py rechazo /tmp/tt_macho42"
fi

echo "VERIFY-LINUX OK (fixpoint bit a bit + smokes disponibles)"
