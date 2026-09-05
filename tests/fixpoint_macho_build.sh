#!/usr/bin/env bash
# Milestone 24.g Session C2: bit-for-bit fixpoint over .macho bytes.
# stage1 --emit=macho compiles itself and produces the same binary twice.
#
# Flujo:
#   seed .s -> build/main (clang bootstrap, once)
#   build/main compiles fixpoint_entry.tt -> build/main_macho (with --emit=macho)
#   main_macho --emit=macho fixpoint_entry.tt -> main_macho_s1.macho  (compiler emitted as bytes)
#   main_macho_s1.macho compiles tests/emit_macho_test.tt -> test binary rc=42
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

# stage1 with --emit=macho (built through clang from the extended entry point).
"$COMPILER" --target=macos tests/fixpoint_entry.tt -o "$BUILD/main_macho_bootstrap.s"
$CC -c "$BUILD/main_macho_bootstrap.s" -o "$BUILD/main_macho_bootstrap.o"
$CC -e _tt_start -o "$BUILD/main_macho" "$BUILD/main_macho_bootstrap.o"

# s1: stage1 emits a signed Mach-O that IS the stage1 compiler.
rm -f "$BUILD/main_macho_s1.macho"
"$BUILD/main_macho" --emit=macho tests/fixpoint_entry.tt -o "$BUILD/main_macho_s1.macho"
chmod +x "$BUILD/main_macho_s1.macho"

# The emitted binary must run as a compiler: compile the smoke test and produce
# a binary that returns 42.
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

# s2: s1 compiles itself.
rm -f "$BUILD/main_macho_s2.macho"
"$BUILD/main_macho_s1.macho" --emit=macho tests/fixpoint_entry.tt -o "$BUILD/main_macho_s2.macho"

# Fixpoint bytes: s1 == s2 bit-a-bit.
cmp "$BUILD/main_macho_s1.macho" "$BUILD/main_macho_s2.macho"
cmp bootstrap/tetsuoc.macho "$BUILD/main_macho_s1.macho"

echo "FIXPOINT MACHO OK"
