#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cc=${CC:-clang}

bootstrap/tetsuoc.macho --emit=obj bench/bench.tt -o "$tmp/tetsuo.s"
"$cc" -c "$tmp/tetsuo.s" -o "$tmp/tetsuo.o"
"$cc" -O2 bench/harness.c "$tmp/tetsuo.o" -o "$tmp/tetsuo"
"$cc" -O0 bench/harness.c bench/bench.c -o "$tmp/clang_o0"
"$cc" -O2 bench/harness.c bench/bench.c -o "$tmp/clang_o2"

for variant in tetsuo clang_o0 clang_o2; do
    printf '\n[%s]\n' "$variant"
    "$tmp/$variant"
done

printf '\n[fixpoint]\n'
/usr/bin/time -p bash tests/fixpoint_macho_build.sh
