#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cat > "$tmp/main.tt" <<'EOF'
fun main() -> u64 { return 42 }
EOF
"$compiler" --emit=pe-arm64 "$tmp/main.tt" -o "$tmp/main.exe"
python3 - "$tmp/main.exe" <<'PY'
import struct, sys
p=open(sys.argv[1],'rb').read()
assert p[:2]==b'MZ' and p[0x80:0x84]==b'PE\0\0'
assert struct.unpack_from('<H',p,0x84)[0]==0xaa64
entry=struct.unpack_from('<I',p,0xa8)[0]
assert entry==0x1000
text_raw=struct.unpack_from('<I',p,0x188+20)[0]
stub=text_raw
adrp,ldr,blr=struct.unpack_from('<III',p,stub)
assert adrp & 0x9f00001f == 0x90000010
assert ldr & 0xffc003ff == 0xf9400010
assert blr==0xd63f0200
for name in (b'msvcrt.dll\0', b'exit\0', b'_open\0', b'__p___argc\0', b'__p___argv\0'):
	assert name in p
PY
