#!/usr/bin/env bash
# Milestone 24.e: stage1 compiles a program straight into a Mach-O signed by
# the byte codegen (src/codegen_bytes.tt) and, on native macOS, the emitted
# binary runs with no external tools and returns 42.
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

# runs the emitter: writes /tmp/tt_cgb (Mach-O signed by the byte codegen)
rm -f /tmp/tt_cgb
"$BUILD/cgb_emit"

chmod +x /tmp/tt_cgb
/tmp/tt_cgb
rc=$?
echo "--- tt_cgb exit=$rc ---"
exit $rc
