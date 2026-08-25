#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
rm -f /tmp/tt_stage1.s /tmp/tt_stage1.o /tmp/tt_stage1.bin
bash tests/macos_build.sh tests/codegen_e2e_test.tt >/dev/null 2>&1
if [[ ! -s /tmp/tt_stage1.s ]]; then
    echo "FAIL: stage1 no emitió /tmp/tt_stage1.s" >&2
    exit 90
fi
clang -c /tmp/tt_stage1.s -o /tmp/tt_stage1.o
clang -e _tt_start /tmp/tt_stage1.o -o /tmp/tt_stage1.bin
/tmp/tt_stage1.bin
