#!/usr/bin/env bash
# Hito 24.g Session A: stage1 compila un programa con bss al pipeline codegen_bytes.
# El binario Mach-O emitido (con __DATA,__bss S_ZEROFILL) se ejecuta directamente,
# sin herramientas externas, y devuelve 42 (leyendo un byte escrito en un buffer bss).
set -euo pipefail
cd "$(dirname "$0")/.."

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/main
SEED=bootstrap/tetsuoc.s
mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -c "$SEED" -o "$BUILD/main.o"
  $CC -e _tt_start -o "$COMPILER" "$BUILD/main.o"
fi

"$COMPILER" --target=macos tests/codegen_bytes_bss_entry.tt -o "$BUILD/cgb_bss_emit.s"
$CC -c "$BUILD/cgb_bss_emit.s" -o "$BUILD/cgb_bss_emit.o"
$CC -e _tt_start -o "$BUILD/cgb_bss_emit" "$BUILD/cgb_bss_emit.o"

rm -f /tmp/tt_cgb_bss
"$BUILD/cgb_bss_emit"

chmod +x /tmp/tt_cgb_bss
/tmp/tt_cgb_bss
rc=$?
echo "--- tt_cgb_bss exit=$rc ---"
exit $rc
