#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/sha256.tt src/asm.tt src/macho.tt src/pe.tt tests/pe_writer_test.tt > /tmp/tt_pe_writer.tt
bootstrap/tetsuoc.macho --emit=macho /tmp/tt_pe_writer.tt -o /tmp/tt_pe_writer
chmod +x /tmp/tt_pe_writer
/tmp/tt_pe_writer
python3 - <<'PY'
import struct
p=open('/tmp/tt_pe_arm64.exe','rb').read()
assert p[:2]==b'MZ' and p[0x80:0x84]==b'PE\0\0'
machine,nsects=struct.unpack_from('<HH',p,0x84)
assert machine==0xAA64 and nsects==3
assert struct.unpack_from('<H',p,0x98)[0]==0x20b
assert p[0x188:0x190].rstrip(b'\0')==b'.text'
assert p[0x1b0:0x1b8].rstrip(b'\0')==b'.idata'
assert b'msvcrt.dll\0' in p and b'exit\0' in p and b'_write\0' in p
PY
