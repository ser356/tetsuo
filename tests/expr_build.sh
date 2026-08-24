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

COMBINED=$BUILD/expr_combined.tt
cat tests/io.tt tests/lexer.tt tests/expr.tt tests/expr_main.tt > "$COMBINED"

"$COMPILER" --target=macos "$COMBINED" -o "$BUILD/expr_test.s"
$CC -c "$BUILD/expr_test.s" -o "$BUILD/expr_test.o"
$CC -e _main -o "$BUILD/expr_test" "$BUILD/expr_test.o"

echo "--- salida ---"
"$BUILD/expr_test"
echo "--- esperado ---"
cat <<EOF
1 2 3 * + 
1 2 + 3 * 
1 2 + 3 + 
1 2 3 * + 4 - 
EOF
echo "--- fin ---"
