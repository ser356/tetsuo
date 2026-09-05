#!/usr/bin/env bash
# Milestone 24.g Session C1: stage1 with --emit=macho emits a signed Mach-O
# directly. It compiles a simple program without invoking clang for the output,
# runs it natively on macOS and expects rc=42.
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

# stage1 with --emit=macho support: built from the extended entry point that
# includes codegen_bytes/asm/macho/sha256. clang links the output.
"$COMPILER" --target=macos tests/fixpoint_entry.tt -o "$BUILD/main_macho.s"
$CC -c "$BUILD/main_macho.s" -o "$BUILD/main_macho.o"
$CC -e _tt_start -o "$BUILD/main_macho" "$BUILD/main_macho.o"

# build/main_macho is now a compiler that supports --emit=macho.
# It compiles the tests/emit_macho_test.tt smoke test straight to a signed
# Mach-O.
rm -f /tmp/tt_emit_macho
"$BUILD/main_macho" --emit=macho tests/emit_macho_test.tt -o /tmp/tt_emit_macho

chmod +x /tmp/tt_emit_macho
/tmp/tt_emit_macho
rc=$?
echo "--- tt_emit_macho exit=$rc ---"
exit $rc
