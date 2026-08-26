#!/usr/bin/env bash
# Hito 24.g Session C3a: aisla el layout Mach-O multi-pagina del volumen de
# codigo. Emite /tmp/tt_macho_multipage (7 paginas de __TEXT, ~50MB de __bss,
# apenas 40 instrucciones de codigo) y lo ejecuta: debe devolver 20.
#
# Si este test pasa pero los binarios grandes de macos_build.sh mueren, el
# problema NO es el layout multi-pagina ni los fixups lejanos contra __bss.
set -euo pipefail
cd "$(dirname "$0")/.."

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/main_mp
SEED=bootstrap/tetsuoc.s
mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -c "$SEED" -o "$BUILD/main_mp.o"
  $CC -e _tt_start -o "$COMPILER" "$BUILD/main_mp.o"
fi

"$COMPILER" --target=macos tests/macho_multipage_entry.tt -o "$BUILD/macho_multipage_emit.s"
$CC -c "$BUILD/macho_multipage_emit.s" -o "$BUILD/macho_multipage_emit.o"
$CC -e _tt_start -o "$BUILD/macho_multipage_emit" "$BUILD/macho_multipage_emit.o"

rm -f /tmp/tt_macho_multipage
"$BUILD/macho_multipage_emit"

chmod +x /tmp/tt_macho_multipage
/tmp/tt_macho_multipage
rc=$?
echo "--- tt_macho_multipage exit=$rc ---"
exit $rc
