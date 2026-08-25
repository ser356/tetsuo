#!/usr/bin/env bash
# Hito 24.e: stage1 compila un programa directamente a un Mach-O firmado por el
# codegen de bytes (src/codegen_bytes.tt) y, en macOS nativo, el binario emitido
# se ejecuta sin herramientas externas y devuelve 42.
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

"$COMPILER" --target=macos tests/codegen_bytes_entry.tt -o "$BUILD/cgb_emit.s"
$CC -c "$BUILD/cgb_emit.s" -o "$BUILD/cgb_emit.o"
$CC -e _tt_start -o "$BUILD/cgb_emit" "$BUILD/cgb_emit.o"

# ejecuta el emisor: escribe /tmp/tt_cgb (Mach-O firmado por el codegen de bytes)
"$BUILD/cgb_emit"

chmod +x /tmp/tt_cgb
/tmp/tt_cgb
rc=$?
echo "--- tt_cgb exit=$rc ---"
exit $rc
