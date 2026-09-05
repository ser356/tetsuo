#!/usr/bin/env bash
# Milestone 24.g Session B: multi-page __TEXT test. It generates a program with
# a 20000-'A' literal that forces text_size > 16384 -> text_pages=2. It builds
# with stage1, emits the signed (multi-page) Mach-O binary, runs it and expects
# rc=65 ('A').
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

"$COMPILER" --target=macos tests/codegen_bytes_bigtext_entry.tt -o "$BUILD/cgb_bigtext_emit.s"
$CC -c "$BUILD/cgb_bigtext_emit.s" -o "$BUILD/cgb_bigtext_emit.o"
$CC -e _tt_start -o "$BUILD/cgb_bigtext_emit" "$BUILD/cgb_bigtext_emit.o"

rm -f /tmp/tt_cgb_bigtext
"$BUILD/cgb_bigtext_emit"

chmod +x /tmp/tt_cgb_bigtext
/tmp/tt_cgb_bigtext
rc=$?
echo "--- tt_cgb_bigtext exit=$rc ---"
exit $rc
