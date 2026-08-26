#!/usr/bin/env bash
# Compila un .tt a Mach-O AArch64 firmado adhoc y lo ejecuta.
# Sin clang, sin as, sin ld, sin codesign: el binario emitido por stage1
# --emit=macho es directamente ejecutable en macOS 11+ arm64.
set -euo pipefail

BUILD=build
COMPILER=$BUILD/main
SEED=bootstrap/tetsuoc.macho
INPUT=${1:-tests/macos_hello.tt}
BASE=$BUILD/$(basename "${INPUT%.*}")
shift || true
ARGS=("$@")

mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  cp "$SEED" "$COMPILER"
  chmod +x "$COMPILER"
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
  "$COMPILER" --emit=macho "$ENTRY" -o "$BASE.macho"
else
  "$COMPILER" --emit=macho "$INPUT" -o "$BASE.macho"
fi

chmod +x "$BASE.macho"

echo "--- ejecutando ---"
"$BASE.macho" ${ARGS[@]+"${ARGS[@]}"}
rc=$?
echo "--- exit=$rc ---"
