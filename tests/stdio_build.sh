#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
out=$(mktemp)
err=$(mktemp)
trap 'rm -f "$out" "$err"' EXIT
bash tests/macos_build.sh tests/stdio_test.tt >"$out" 2>"$err"
grep -qx 'tetsuo 42 ready' "$out"
grep -qx 'stderr' "$err"
