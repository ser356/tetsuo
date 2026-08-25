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

# stage0 (C) compila el entry del compilador stage1
"$COMPILER" --target=macos "$ENTRY" -o "$BUILD/fixpoint_s0.s"

# stage1 = binario ensamblado de la salida de stage0
$CC -c "$BUILD/fixpoint_s0.s" -o "$BUILD/fixpoint_stage1.o"
$CC -e _tt_start -o "$BUILD/fixpoint_stage1" "$BUILD/fixpoint_stage1.o"

# hito 19.a: stage1 compila macos_hello.tt (msg.ptr / msg.len)
"$BUILD/fixpoint_stage1" tests/macos_hello.tt -o "$BUILD/fixpoint_hello.s"
$CC -c "$BUILD/fixpoint_hello.s" -o "$BUILD/fixpoint_hello.o"
$CC -e _tt_start -o "$BUILD/fixpoint_hello" "$BUILD/fixpoint_hello.o"
out=$("$BUILD/fixpoint_hello")
echo "$out" | grep -q "hola desde macOS" || { echo "FAIL: hello stage1 no imprime" >&2; exit 90; }

# stage1 compila su propio entry
"$BUILD/fixpoint_stage1" "$ENTRY" -o "$BUILD/fixpoint_s1.s"

# diff bit a bit stage0 vs stage1
cmp "$BUILD/fixpoint_s0.s" "$BUILD/fixpoint_s1.s"

# stage2 = binario de la salida de stage1; debe reproducirla exacta
$CC -c "$BUILD/fixpoint_s1.s" -o "$BUILD/fixpoint_stage2.o"
$CC -e _tt_start -o "$BUILD/fixpoint_stage2" "$BUILD/fixpoint_stage2.o"
"$BUILD/fixpoint_stage2" "$ENTRY" -o "$BUILD/fixpoint_s2.s"
cmp "$BUILD/fixpoint_s1.s" "$BUILD/fixpoint_s2.s"

echo "FIXPOINT OK"
