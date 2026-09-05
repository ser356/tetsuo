#!/usr/bin/env bash
# Compiles a .tt into an ad-hoc signed AArch64 Mach-O and runs it.
# No clang, no as, no ld, no codesign: the binary emitted by stage1
# --emit=macho is directly executable on macOS 11+ arm64.
set -euo pipefail

BUILD=build
COMPILER=$BUILD/main
SEED=bootstrap/tetsuoc.macho
INPUT=${1:-tests/macos_hello.tt}
BASE=$BUILD/$(basename "${INPUT%.*}")
shift || true
ARGS=("$@")

mkdir -p "$BUILD"

# macOS caches the code signature per vnode: overwriting a signed Mach-O
# "in place" leaves the old blob attached to the inode and the kernel kills the
# process with SIGKILL even when `codesign -v` on the new file is clean. That is
# why every binary is written to a temporary and moved with an atomic rename(),
# which creates a new inode.
if [[ ! -x $COMPILER ]]; then
  rm -f "$COMPILER"
  cp "$SEED" "$COMPILER.tmp"
  chmod +x "$COMPILER.tmp"
  mv -f "$COMPILER.tmp" "$COMPILER"
fi

LIBS=(src/runtime/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt \
  src/lexer.tt src/parser.tt src/check.tt src/ir.tt src/codegen.tt \
      lib/sha256.tt src/asm.tt src/macho.tt src/codegen_bytes.tt src/elf.tt src/pe.tt src/codegen_x64.tt)
if [[ -f ${LIBS[0]} && $INPUT != ${LIBS[0]} ]]; then
  ENTRY=$BUILD/entry_macos.tt
  : > "$ENTRY"
  for L in "${LIBS[@]}"; do
    [[ -f $L && $INPUT != $L ]] && echo "import '$L'" >> "$ENTRY"
  done
  echo "import '$INPUT'" >> "$ENTRY"
  "$COMPILER" --emit=macho "$ENTRY" -o "$BASE.macho.tmp"
else
  "$COMPILER" --emit=macho "$INPUT" -o "$BASE.macho.tmp"
fi

chmod +x "$BASE.macho.tmp"
rm -f "$BASE.macho"
mv -f "$BASE.macho.tmp" "$BASE.macho"

echo "--- ejecutando ---"
"$BASE.macho" ${ARGS[@]+"${ARGS[@]}"}
rc=$?
echo "--- exit=$rc ---"
