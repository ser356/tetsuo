#!/usr/bin/env bash
set -euo pipefail

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/tetsuoc
INPUT=${1:-tests/macos_hello.tt}
BASE=$BUILD/$(basename "${INPUT%.*}")

mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -std=c11 -O0 -g -Wall -Wextra -Wswitch -Werror \
      -fsanitize=address,undefined \
      -o "$COMPILER" src/*.c
fi

IO_LIB=tests/io.tt
if [[ -f $IO_LIB && $INPUT != $IO_LIB ]]; then
  COMBINED=$BUILD/combined_macos.tt
  cat "$IO_LIB" "$INPUT" > "$COMBINED"
  "$COMPILER" --target=macos "$COMBINED" -o "$BASE.s"
else
  "$COMPILER" --target=macos "$INPUT" -o "$BASE.s"
fi

$CC -c "$BASE.s" -o "$BASE.o"
$CC -e _main -o "$BASE" "$BASE.o"

echo "--- ejecutando ---"
"$BASE"
rc=$?
echo "--- exit=$rc ---"
