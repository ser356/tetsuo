#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

CC=${CC:-clang}
BUILD=build
COMPILER=$BUILD/main
SEED=bootstrap/tetsuoc.s
mkdir -p "$BUILD"

if [[ ! -x $COMPILER ]]; then
  $CC -c "$SEED" -o "$BUILD/main.o"
  $CC -e _tt_start -o "$COMPILER" "$BUILD/main.o"
fi

ENTRY=tests/fixpoint_entry.tt

# stage0 (C) compiles the entry point of the stage1 compiler
"$COMPILER" --target=macos "$ENTRY" -o "$BUILD/fixpoint_s0.s"

# stage1 = binary assembled from the stage0 output
$CC -c "$BUILD/fixpoint_s0.s" -o "$BUILD/fixpoint_stage1.o"
$CC -e _tt_start -o "$BUILD/fixpoint_stage1" "$BUILD/fixpoint_stage1.o"

# milestone 19.a: stage1 compiles macos_hello.tt (msg.ptr / msg.len)
"$BUILD/fixpoint_stage1" tests/macos_hello.tt -o "$BUILD/fixpoint_hello.s"
$CC -c "$BUILD/fixpoint_hello.s" -o "$BUILD/fixpoint_hello.o"
$CC -e _tt_start -o "$BUILD/fixpoint_hello" "$BUILD/fixpoint_hello.o"
out=$("$BUILD/fixpoint_hello")
echo "$out" | grep -q "hola desde macOS" || { echo "FAIL: hello stage1 no imprime" >&2; exit 90; }

# stage1 compiles its own entry point
"$BUILD/fixpoint_stage1" "$ENTRY" -o "$BUILD/fixpoint_s1.s"

# diff bit a bit stage0 vs stage1
cmp "$BUILD/fixpoint_s0.s" "$BUILD/fixpoint_s1.s"

# stage2 = binary from the stage1 output; it must reproduce it exactly
$CC -c "$BUILD/fixpoint_s1.s" -o "$BUILD/fixpoint_stage2.o"
$CC -e _tt_start -o "$BUILD/fixpoint_stage2" "$BUILD/fixpoint_stage2.o"
"$BUILD/fixpoint_stage2" "$ENTRY" -o "$BUILD/fixpoint_s2.s"
cmp "$BUILD/fixpoint_s1.s" "$BUILD/fixpoint_s2.s"

echo "FIXPOINT OK"
