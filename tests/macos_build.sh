#!/usr/bin/env bash
set -euo pipefail

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/tetsuoc
INPUT=${1:-tests/macos_hello.tt}
BASE=$BUILD/$(basename "${INPUT%.*}")
shift || true
ARGS=("$@")

mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -std=c11 -O0 -g -Wall -Wextra -Wswitch -Werror \
      -fsanitize=address,undefined \
      -o "$COMPILER" src/*.c
fi

IO_LIB=tests/io.tt
STR_LIB=lib/str.tt
FMT_LIB=lib/fmt.tt
VEC_LIB=lib/vec.tt
AST_LIB=lib/ast.tt
LEXER_LIB=tests/lexer.tt
PARSER_LIB=src/parser.tt
IR_LIB=src/ir.tt
CODEGEN_LIB=src/codegen.tt
if [[ -f $IO_LIB && $INPUT != $IO_LIB ]]; then
  COMBINED=$BUILD/combined_macos.tt
  cat "$IO_LIB" > "$COMBINED"
  [[ -f $STR_LIB && $INPUT != $STR_LIB ]] && cat "$STR_LIB" >> "$COMBINED"
  [[ -f $FMT_LIB && $INPUT != $FMT_LIB ]] && cat "$FMT_LIB" >> "$COMBINED"
  [[ -f $VEC_LIB && $INPUT != $VEC_LIB ]] && cat "$VEC_LIB" >> "$COMBINED"
  [[ -f $AST_LIB && $INPUT != $AST_LIB ]] && cat "$AST_LIB" >> "$COMBINED"
  [[ -f $LEXER_LIB && $INPUT != $LEXER_LIB ]] && cat "$LEXER_LIB" >> "$COMBINED"
  [[ -f $PARSER_LIB && $INPUT != $PARSER_LIB ]] && cat "$PARSER_LIB" >> "$COMBINED"
  [[ -f $IR_LIB && $INPUT != $IR_LIB ]] && cat "$IR_LIB" >> "$COMBINED"
  [[ -f $CODEGEN_LIB && $INPUT != $CODEGEN_LIB ]] && cat "$CODEGEN_LIB" >> "$COMBINED"
  cat "$INPUT" >> "$COMBINED"
  "$COMPILER" --target=macos "$COMBINED" -o "$BASE.s"
else
  "$COMPILER" --target=macos "$INPUT" -o "$BASE.s"
fi

$CC -c "$BASE.s" -o "$BASE.o"
$CC -e _tt_start -o "$BASE" "$BASE.o"

echo "--- ejecutando ---"
"$BASE" ${ARGS[@]+"${ARGS[@]}"}
rc=$?
echo "--- exit=$rc ---"
