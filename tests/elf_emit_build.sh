#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cat > "$tmp/return42.tt" <<'EOF'
fun main(argc: u64, argv: **u8) -> u64 { return argc + 39 }
EOF
"$compiler" --emit=elf "$tmp/return42.tt" -o "$tmp/return42"
chmod +x "$tmp/return42"
python3 - "$tmp/return42" <<'PY'
import struct, sys
p = open(sys.argv[1], 'rb').read()
assert p[:4] == b'\x7fELF' and p[4:7] == b'\x02\x01\x01'
e_type, machine = struct.unpack_from('<HH', p, 16)
entry, phoff = struct.unpack_from('<QQ', p, 24)
ehsize, phentsize, phnum = struct.unpack_from('<HHH', p, 52)
assert (e_type, machine, ehsize, phentsize, phnum) == (2, 183, 64, 56, 2)
assert phoff == 64 and entry >= 0x400000
for i in range(phnum):
    typ, flags = struct.unpack_from('<II', p, phoff + i * phentsize)
    assert typ == 1 and flags in (5, 6)
PY
if command -v qemu-aarch64 >/dev/null; then
    set +e
    qemu-aarch64 "$tmp/return42" one two
    rc=$?
    set -e
    [[ $rc -eq 42 ]]
fi
