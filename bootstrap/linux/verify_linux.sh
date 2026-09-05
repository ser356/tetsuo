#!/usr/bin/env bash
# Fixpoint verification on Linux x86_64 without macOS:
# The committed seed (bootstrap/tetsuoc.s, the arm64 macho output of stage1) is
# translated to ELF through macho2elf.sh + the BSD->Linux syscall shim (shim.s)
# and run under qemu-aarch64.
# Requires: qemu-user (qemu-aarch64), binutils-aarch64-linux-gnu.
set -euo pipefail
cd "$(dirname "$0")/../.."

export ASAN_OPTIONS=detect_leaks=0
BUILD=build
HARNESS=bootstrap/linux
SEED=bootstrap/tetsuoc.s
mkdir -p "$BUILD/linux"

fail() { echo "VERIFY-LINUX FAIL: $1" >&2; exit 1; }

aarch64-linux-gnu-as "$HARNESS/shim.s" -o "$BUILD/linux/shim.o"

# assembles+links a macOS .s and leaves it runnable through qemu
mk_elf() { # $1=input.s $2=output_bin
    "$HARNESS/macho2elf.sh" "$1" > "$2.elf.s"
    aarch64-linux-gnu-as "$2.elf.s" -o "$2.o"
    aarch64-linux-gnu-ld -e _linux_start -o "$2" "$2.o" "$BUILD/linux/shim.o"
}

# The fixpoint is checked the same way as in tests/fixpoint_build.sh: the
# committed seed is the previous generation of the compiler, so it does NOT have
# to reproduce itself byte for byte. The real invariant is that from the second
# generation on the output stabilizes: s1 == s2 over the complete entry point.
ENTRY=tests/fixpoint_entry.tt

# s0 = the committed seed
cp "$SEED" "$BUILD/fixpoint_s0.s"
mk_elf "$BUILD/fixpoint_s0.s" "$BUILD/linux/stage1"

qemu-aarch64 "$BUILD/linux/stage1" "$ENTRY" -o "$BUILD/fixpoint_s1.s" \
    || fail "stage1 no compilo $ENTRY"

mk_elf "$BUILD/fixpoint_s1.s" "$BUILD/linux/stage2"
qemu-aarch64 "$BUILD/linux/stage2" "$ENTRY" -o "$BUILD/fixpoint_s2.s" \
    || fail "stage2 no compilo $ENTRY"
cmp "$BUILD/fixpoint_s1.s" "$BUILD/fixpoint_s2.s" || fail "s1 != s2"

qemu-aarch64 "$BUILD/linux/stage1" tests/macos_hello.tt -o "$BUILD/hello_s1.s" \
    || fail "stage1 no compilo macos_hello.tt"
mk_elf "$BUILD/hello_s1.s" "$BUILD/linux/hello"
out=$(qemu-aarch64 "$BUILD/linux/hello")
echo "$out" | grep -q "hola desde macOS" || fail "hello stage1 no imprime"

# --- smoke tests of the Mach-O milestones (24.a..24.f) under qemu ---
smoke() { # $1=combined.tt $2=expected_rc $3=name
    local rc=0
    bash "$HARNESS/run_tt.sh" "$1" > /tmp/tt_smoke.log 2>&1 || rc=$?
    [[ $rc -eq $2 ]] || fail "$3 rc=$rc esperado $2; log:\n$(cat /tmp/tt_smoke.log)"
}

# 24.a shifts: binary << and >> (immediate and register)
if [[ -f tests/shifts_test.tt ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt tests/shifts_test.tt > "$BUILD/shifts_combined.tt"
    smoke "$BUILD/shifts_combined.tt" 0 "shifts_test"
fi

if [[ -f tests/operators_test.tt ]]; then
    smoke tests/operators_test.tt 0 "operators_test"
fi

if [[ -f tests/logical_test.tt ]]; then
    smoke tests/logical_test.tt 0 "logical_test"
fi

if [[ -f tests/syscall_checked_test.tt ]]; then
    smoke tests/syscall_checked_test.tt 0 "syscall_checked_test"
fi

# 24.b AArch64 encoder
if [[ -f src/asm.tt && -f tests/asm_test.tt ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt src/asm.tt tests/asm_test.tt > "$BUILD/asm_combined.tt"
    smoke "$BUILD/asm_combined.tt" 0 "asm_test"
fi

# 24.c SHA-256
if [[ -f lib/sha256.tt && -f tests/sha256_test.tt ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/sha256.tt tests/sha256_test.tt > "$BUILD/sha256_combined.tt"
    smoke "$BUILD/sha256_combined.tt" 0 "sha256_test"
fi

# 24.d/24.f Mach-O writer + ad-hoc signature: emits a binary and the checker
# validates it
if [[ -f src/macho.tt && -f tests/macho42_test.tt && -f "$HARNESS/check_macho.py" ]]; then
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/sha256.tt src/asm.tt src/macho.tt tests/macho42_test.tt > "$BUILD/macho42_combined.tt"
    smoke "$BUILD/macho42_combined.tt" 0 "macho42_test"
    python3 "$HARNESS/check_macho.py" /tmp/tt_macho42 42 || fail "check_macho.py rechazo /tmp/tt_macho42"
fi

# 24.e codegen to bytes: stage1 compiles a program (with calls, comparisons and
# a string literal) straight into a signed Mach-O; the binary runs under qemu
# (jumping to main, see macho_run.py) and returns 42.
if [[ -f src/codegen_bytes.tt && -f tests/codegen_bytes_test.tt && -f "$HARNESS/macho_run.py" ]]; then
    rm -f /tmp/tt_cgb
    cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt src/lexer.tt \
        src/parser.tt src/ir.tt src/codegen.tt lib/sha256.tt src/asm.tt src/macho.tt \
        src/codegen_bytes.tt tests/codegen_bytes_test.tt > "$BUILD/cgb_combined.tt"
    smoke "$BUILD/cgb_combined.tt" 0 "codegen_bytes_test"
    python3 "$HARNESS/check_macho.py" /tmp/tt_cgb - || fail "check_macho.py rechazo /tmp/tt_cgb"
    rc=0
    python3 "$HARNESS/macho_run.py" /tmp/tt_cgb || rc=$?
    [[ $rc -eq 42 ]] || fail "codegen_bytes: el binario emitido devolvio $rc, esperado 42"
fi

echo "VERIFY-LINUX OK (fixpoint s1==s2 + smokes disponibles)"
