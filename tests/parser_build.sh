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

COMBINED=$BUILD/parser_combined.tt
INPUT_TT=${1:-tests/hello.tt}
INPUT_MAIN=$BUILD/parser_main_gen.tt
sed "s|tests/hello.tt|${INPUT_TT}|" tests/parser_main.tt > "$INPUT_MAIN"
cat tests/io.tt tests/lexer.tt tests/expr.tt tests/parser.tt "$INPUT_MAIN" > "$COMBINED"

"$COMPILER" --target=macos "$COMBINED" -o "$BUILD/parser_test.s"
$CC -c "$BUILD/parser_test.s" -o "$BUILD/parser_test.o"
$CC -e _main -o "$BUILD/parser_test" "$BUILD/parser_test.o"

echo "--- ejecutando parser.tt sobre ${INPUT_TT} ---"
set +e
"$BUILD/parser_test"
rc=$?
set -e
echo "--- fun_count(tetsuo)=$rc ---"
echo -n "--- fun_count(grep)="
grep -c '^fun' "${INPUT_TT}"
echo -n "--- first_fun(grep)="
grep '^fun' "${INPUT_TT}" | head -1 | awk '{print $2}' | sed 's/(.*//'
echo "---"
