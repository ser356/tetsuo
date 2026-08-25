#!/usr/bin/env bash
set -euo pipefail

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/tetsuoc

mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -std=c11 -O0 -g -Wall -Wextra -Wswitch -Werror \
      -fsanitize=address,undefined \
      -o "$COMPILER" src/*.c
fi

COMBINED=$BUILD/lexer_combined.tt
cat tests/io.tt lib/str.tt tests/lexer.tt tests/lexer_main.tt > "$COMBINED"

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
