#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cat > "$tmp/ops.tt" <<'EOF'
bss X64_BUF: 8

fun tt_signed(a: i64, b: i64) -> i64 {
    return a / b + a % b
}

fun tt_io() -> u64 {
    let err: u64 = 0
    let msg: str = 'x64'
    let n: u64 = syscall_checked(4, 1, msg.ptr, msg.len, &err)
    return n + err
}

fun tt_ops(a: u64, b: u64) -> u64 {
    let values: [16]u64
    values[15] = a
    let byte: u8 = a as u8
    let local: *u8 = &byte
    @local = byte
    let loaded: u8 = @local
    let global: *u8 = X64_BUF
    @global = loaded
    let bits: u64 = (a << b) ^ (a >> b)
    let cmp: u64 = (a == b) + (a != b) + (a < b) + (a <= b) + (a > b) + (a >= b)
    while loaded == 0 { return 1 }
    return values[15] / b + a % b + bits + cmp + @global
}
EOF
"$compiler" --target=windows-x64 "$tmp/ops.tt" -o "$tmp/ops.s"
grep -q '^tt_ops:' "$tmp/ops.s"
grep -q 'leaq.*(%rbp)' "$tmp/ops.s"
grep -q 'movb.*(%rax)' "$tmp/ops.s"
grep -q 'movzbq.*(%rax)' "$tmp/ops.s"
grep -q 'shlq.*%cl' "$tmp/ops.s"
grep -q 'shrq.*%cl' "$tmp/ops.s"
grep -q 'idivq' "$tmp/ops.s"
grep -q 'divq' "$tmp/ops.s"
grep -q 'setae' "$tmp/ops.s"
grep -q 'je.*\.L' "$tmp/ops.s"
grep -q '\.section \.rdata' "$tmp/ops.s"
grep -q '^L_str' "$tmp/ops.s"
grep -q '^X64_BUF:' "$tmp/ops.s"
grep -q 'call    _write' "$tmp/ops.s"
"$compiler" --target=windows-x64 tests/fixpoint_entry.tt -o "$tmp/compiler.s"
grep -q 'testb.*(%rsp)' "$tmp/compiler.s"
cat > "$tmp/component.tt" <<'EOF'
fun tt_component_add(a: u64, b: u64) -> u64 {
    return a + b
}
EOF
"$compiler" --target=windows-x64 --emit=obj "$tmp/component.tt" -o "$tmp/component.s"
grep -q '^tt_component_add:' "$tmp/component.s"
if grep -Eq '(^|[[:space:]])(tt_start|__getmainargs|main|exit)($|[[:space:]])' "$tmp/component.s"; then
    exit 1
fi
clang --target=x86_64-windows-msvc -c "$tmp/component.s" -o "$tmp/component.obj"
if clang --target=x86_64-windows-msvc -c "$tmp/ops.s" -o "$tmp/ops.obj"; then
    python3 - "$tmp/ops.obj" <<'PY'
import struct,sys
p=open(sys.argv[1],'rb').read()
assert struct.unpack_from('<H',p)[0]==0x8664
PY
fi
