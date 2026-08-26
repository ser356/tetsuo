#!/usr/bin/env bash
# Hito 24.g Session C2: fixpoint bit-a-bit en bytes .macho.
# stage1 --emit=macho se compila a si mismo y produce el mismo binario dos veces.
#
# Flujo:
#   seed .s -> build/main (clang bootstrap una vez)
#   build/main compila fixpoint_entry.tt -> build/main_macho (con --emit=macho)
#   main_macho --emit=macho fixpoint_entry.tt -> main_macho_s1.macho  (compilador emitido en bytes)
#   main_macho_s1.macho compila tests/emit_macho_test.tt -> binario de prueba rc=42
#   main_macho_s1.macho --emit=macho fixpoint_entry.tt -> main_macho_s2.macho
#   cmp main_macho_s1.macho main_macho_s2.macho  (fixpoint bytes)
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

# stage1 con --emit=macho (compilado via clang desde el entry extendido).
"$COMPILER" --target=macos tests/fixpoint_entry.tt -o "$BUILD/main_macho_bootstrap.s"
$CC -c "$BUILD/main_macho_bootstrap.s" -o "$BUILD/main_macho_bootstrap.o"
$CC -e _tt_start -o "$BUILD/main_macho" "$BUILD/main_macho_bootstrap.o"

# s1: stage1 emite un Mach-O firmado que ES el compilador stage1.
rm -f "$BUILD/main_macho_s1.macho"
"$BUILD/main_macho" --emit=macho tests/fixpoint_entry.tt -o "$BUILD/main_macho_s1.macho"
chmod +x "$BUILD/main_macho_s1.macho"

# El binario emitido debe ejecutarse como compilador: compilar el smoke y
# producir un binario que devuelve 42.
rm -f /tmp/tt_fmv_smoke
"$BUILD/main_macho_s1.macho" --emit=macho tests/emit_macho_test.tt -o /tmp/tt_fmv_smoke
chmod +x /tmp/tt_fmv_smoke
set +e
/tmp/tt_fmv_smoke
smoke_rc=$?
set -e
if [[ $smoke_rc -ne 42 ]]; then
  echo "FAIL: main_macho_s1.macho compila un binario que devuelve $smoke_rc (esperado 42)" >&2
  exit 91
fi

# s2: s1 se compila a si mismo.
rm -f "$BUILD/main_macho_s2.macho"
"$BUILD/main_macho_s1.macho" --emit=macho tests/fixpoint_entry.tt -o "$BUILD/main_macho_s2.macho"

# Fixpoint bytes: s1 == s2 bit-a-bit.
cmp "$BUILD/main_macho_s1.macho" "$BUILD/main_macho_s2.macho"

echo "FIXPOINT MACHO OK"
