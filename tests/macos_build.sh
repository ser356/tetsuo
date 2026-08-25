#!/usr/bin/env bash
set -euo pipefail

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/main
SEED=bootstrap/tetsuoc.s
INPUT=${1:-tests/macos_hello.tt}
BASE=$BUILD/$(basename "${INPUT%.*}")
shift || true
ARGS=("$@")

mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -c "$SEED" -o "$BUILD/main.o"
  $CC -e _tt_start -o "$COMPILER" "$BUILD/main.o"
fi

LIBS=(src/runtime/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt \
      src/lexer.tt src/parser.tt src/ir.tt src/codegen.tt \
      lib/sha256.tt src/asm.tt src/macho.tt src/codegen_bytes.tt)
if [[ -f ${LIBS[0]} && $INPUT != ${LIBS[0]} ]]; then
  ENTRY=$BUILD/entry_macos.tt
  : > "$ENTRY"
  for L in "${LIBS[@]}"; do
    [[ -f $L && $INPUT != $L ]] && echo "import '$L'" >> "$ENTRY"
  done
  echo "import '$INPUT'" >> "$ENTRY"
  "$COMPILER" --target=macos "$ENTRY" -o "$BASE.s"
else
  "$COMPILER" --target=macos "$INPUT" -o "$BASE.s"
fi

$CC -c "$BASE.s" -o "$BASE.o"
$CC -e _tt_start -o "$BASE" "$BASE.o"

echo "--- ejecutando ---"
"$BASE" ${ARGS[@]+"${ARGS[@]}"}
rc=$?
echo "--- exit=$rc ---"
