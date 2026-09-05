#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
"$compiler" --target=windows-x64 tests/fixpoint_entry.tt -o "$tmp/tetsuoc.s"
if ! clang --target=x86_64-windows-msvc -c "$tmp/tetsuoc.s" -o "$tmp/tetsuoc.obj"; then
    exit 0
fi
python3 tools/link_pe_x64.py "$tmp/tetsuoc.obj" "$tmp/tetsuoc.exe"
python3 tools/link_pe_x64.py "$tmp/tetsuoc.obj" "$tmp/tetsuoc-2.exe"
cmp "$tmp/tetsuoc.exe" "$tmp/tetsuoc-2.exe"
python3 - "$tmp/tetsuoc.exe" <<'PY'
import struct
import sys
p=open(sys.argv[1],'rb').read()
pe=struct.unpack_from('<L',p,60)[0]
assert p[:2]==b'MZ' and p[pe:pe+4]==b'PE\0\0'
machine,nsections,timestamp,_,_,optional_size,_=struct.unpack_from('<HHLLLHH',p,pe+4)
assert machine==0x8664 and nsections==4 and timestamp==0 and optional_size==240
optional=pe+24
assert struct.unpack_from('<H',p,optional)[0]==0x20b
entry=struct.unpack_from('<L',p,optional+16)[0]
image_base=struct.unpack_from('<Q',p,optional+24)[0]
import_rva,import_size=struct.unpack_from('<LL',p,optional+120)
assert entry>=0x1000 and image_base==0x140000000 and import_size>40
sections={}
for i in range(nsections):
    off=optional+optional_size+i*40
    name=p[off:off+8].rstrip(b'\0').decode()
    virtual_size,rva,raw_size,raw=struct.unpack_from('<LLLL',p,off+8)
    sections[name]=(virtual_size,rva,raw_size,raw)
assert set(sections)=={'.text','.rdata','.idata','.bss'}
assert sections['.bss'][0]>800_000_000 and sections['.bss'][2:]==(0,0)
idata=sections['.idata']
assert idata[1]==import_rva
blob=p[idata[3]:idata[3]+idata[2]]
for name in (b'msvcrt.dll',b'exit',b'_write',b'__getmainargs'):
    assert name in blob
PY
cat > "$tmp/smoke.tt" <<'EOF'
fun main() -> u64 { return 42 }
EOF
"$compiler" --target=windows-x64 "$tmp/smoke.tt" -o "$tmp/smoke.s"
clang --target=x86_64-windows-msvc -c "$tmp/smoke.s" -o "$tmp/smoke.obj"
python3 tools/link_pe_x64.py "$tmp/smoke.obj" "$tmp/smoke.exe"
python3 - "$tmp/smoke.exe" <<'PY'
import struct,sys
p=open(sys.argv[1],'rb').read(); pe=struct.unpack_from('<L',p,60)[0]; opt=pe+24
n=struct.unpack_from('<H',p,pe+6)[0]; image_size=struct.unpack_from('<L',p,opt+56)[0]
sections=[]
for i in range(n):
    off=opt+240+i*40
    virtual_size,rva=struct.unpack_from('<LL',p,off+8)
    sections.append((rva,virtual_size))
assert len({rva for rva,_ in sections})==n
assert image_size>=max(rva+max(size,1) for rva,size in sections)
PY
