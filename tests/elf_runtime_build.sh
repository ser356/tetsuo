#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
"$compiler" --emit=elf tests/elf_runtime_test.tt -o "$tmp/runtime"
chmod +x "$tmp/runtime"
python3 - "$tmp/runtime" <<'PY'
import sys
assert open(sys.argv[1], 'rb').read(4) == b'\x7fELF'
PY
if command -v qemu-aarch64 >/dev/null; then
    out=$(qemu-aarch64 "$tmp/runtime")
    [[ $out == linux-native ]]
fi
