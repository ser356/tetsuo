#!/usr/bin/env bash
# Milestone 24.g Session C3a: isolates the multi-page Mach-O layout from the
# code volume. It emits /tmp/tt_macho_multipage (7 pages of __TEXT, ~50MB of
# __bss, barely 40 instructions of code) and runs it: it must return 20.
#
# If this test passes but the large binaries from macos_build.sh die, the
# problem is NOT the multi-page layout nor the distant fixups against __bss.
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
