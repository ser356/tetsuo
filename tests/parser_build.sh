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

INPUT_TT=${1:-tests/hello.tt}
COMBINED=$BUILD/parser_combined.tt
cat tests/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt tests/lexer.tt src/parser.tt tests/parser_main.tt > "$COMBINED"

"$COMPILER" --target=macos "$COMBINED" -o "$BUILD/parser_test.s"
$CC -c "$BUILD/parser_test.s" -o "$BUILD/parser_test.o"
$CC -e _main -o "$BUILD/parser_test" "$BUILD/parser_test.o"

set +e
"$BUILD/parser_test" "$INPUT_TT"
rc=$?
set -e
exit $rc
