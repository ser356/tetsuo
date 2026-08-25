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

COMBINED=$BUILD/expr_combined.tt
cat src/runtime/io.tt src/lexer.tt tests/expr.tt tests/expr_main.tt > "$COMBINED"

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
