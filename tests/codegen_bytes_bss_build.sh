#!/usr/bin/env bash
# Milestone 24.g Session A: stage1 compiles a program with bss through the
# codegen_bytes pipeline. The emitted Mach-O binary (with __DATA,__bss
# S_ZEROFILL) runs directly, with no external tools, and returns 42 (by reading
# a byte written into a bss buffer).
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

"$COMPILER" --target=macos tests/codegen_bytes_bss_entry.tt -o "$BUILD/cgb_bss_emit.s"
$CC -c "$BUILD/cgb_bss_emit.s" -o "$BUILD/cgb_bss_emit.o"
$CC -e _tt_start -o "$BUILD/cgb_bss_emit" "$BUILD/cgb_bss_emit.o"

rm -f /tmp/tt_cgb_bss
"$BUILD/cgb_bss_emit"

chmod +x /tmp/tt_cgb_bss
/tmp/tt_cgb_bss
rc=$?
echo "--- tt_cgb_bss exit=$rc ---"
exit $rc
