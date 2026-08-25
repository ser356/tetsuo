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

"$COMPILER" --target=macos tests/expr_entry.tt -o "$BUILD/expr_test.s"
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
