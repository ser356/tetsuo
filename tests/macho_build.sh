#!/usr/bin/env bash
# Hito 24.d/24.f: stage1 emite un Mach-O firmado ad-hoc (exit 42) y en macOS
# nativo se ejecuta DIRECTAMENTE, sin clang/as/ld/codesign. Devuelve 42.
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

"$COMPILER" --target=macos tests/macho42_entry.tt -o "$BUILD/macho42_emit.s"
$CC -c "$BUILD/macho42_emit.s" -o "$BUILD/macho42_emit.o"
$CC -e _tt_start -o "$BUILD/macho42_emit" "$BUILD/macho42_emit.o"

# ejecuta el emisor: escribe /tmp/tt_macho42
"$BUILD/macho42_emit"

chmod +x /tmp/tt_macho42
# ejecuta el binario Mach-O firmado por tetsuo, sin ninguna herramienta externa
/tmp/tt_macho42
rc=$?
echo "--- tt_macho42 exit=$rc ---"
exit $rc
