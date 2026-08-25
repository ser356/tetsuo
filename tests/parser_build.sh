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

INPUT_TT=${1:-tests/hello.tt}
COMBINED=$BUILD/parser_combined.tt
cat src/runtime/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt src/lexer.tt src/parser.tt tests/parser_main.tt > "$COMBINED"

"$COMPILER" --target=macos "$COMBINED" -o "$BUILD/parser_test.s"
$CC -c "$BUILD/parser_test.s" -o "$BUILD/parser_test.o"
$CC -e _main -o "$BUILD/parser_test" "$BUILD/parser_test.o"

set +e
"$BUILD/parser_test" "$INPUT_TT"
rc=$?
set -e
exit $rc
