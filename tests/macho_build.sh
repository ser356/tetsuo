#!/usr/bin/env bash
# Milestone 24.d/24.f: stage1 emits an ad-hoc signed Mach-O (exit 42) which on
# native macOS runs DIRECTLY, with no clang/as/ld/codesign. It returns 42.
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

# runs the emitter: writes /tmp/tt_macho42
rm -f /tmp/tt_macho42
"$BUILD/macho42_emit"

chmod +x /tmp/tt_macho42
# runs the Mach-O binary signed by tetsuo, with no external tool at all
/tmp/tt_macho42
rc=$?
echo "--- tt_macho42 exit=$rc ---"
exit $rc
