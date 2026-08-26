#!/usr/bin/env bash
# Hito 24.g Session C1: stage1 con --emit=macho emite un Mach-O firmado
# directamente. Compila un programa simple sin invocar clang para el output,
# lo ejecuta nativo en macOS y espera rc=42.
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

# stage1 con soporte --emit=macho: se compila desde el entry extendido que
# incluye codegen_bytes/asm/macho/sha256. clang linka la salida.
"$COMPILER" --target=macos tests/fixpoint_entry.tt -o "$BUILD/main_macho.s"
$CC -c "$BUILD/main_macho.s" -o "$BUILD/main_macho.o"
$CC -e _tt_start -o "$BUILD/main_macho" "$BUILD/main_macho.o"

# Ahora build/main_macho es un compilador que soporta --emit=macho.
# Compila el smoke tests/emit_macho_test.tt directamente a Mach-O firmado.
rm -f /tmp/tt_emit_macho
"$BUILD/main_macho" --emit=macho tests/emit_macho_test.tt -o /tmp/tt_emit_macho

chmod +x /tmp/tt_emit_macho
/tmp/tt_emit_macho
rc=$?
echo "--- tt_emit_macho exit=$rc ---"
exit $rc
