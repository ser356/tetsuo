#!/usr/bin/env bash
set -euo pipefail

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/main
SEED=bootstrap/tetsuoc.s

mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -c "$SEED" -o "$BUILD/main.o"
  $CC -e _tt_start -o "$COMPILER" "$BUILD/main.o"
fi

COMBINED=$BUILD/lexer_combined.tt
cat src/runtime/io.tt lib/str.tt src/lexer.tt tests/lexer_main.tt > "$COMBINED"

"$COMPILER" --target=macos "$COMBINED" -o "$BUILD/lexer_test.s"
$CC -c "$BUILD/lexer_test.s" -o "$BUILD/lexer_test.o"
$CC -e _main -o "$BUILD/lexer_test" "$BUILD/lexer_test.o"

echo "--- ejecutando lexer.tt sobre ${1:-tests/hello.tt} ---"
set +e
"$BUILD/lexer_test" "${1:-tests/hello.tt}"
rc=$?
set -e
echo "--- token_count=$rc ---"
exit $rc
