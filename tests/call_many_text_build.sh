#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
"$compiler" tests/call_many_runtime_test.tt -o /tmp/tt_call_many.s
clang -c /tmp/tt_call_many.s -o /tmp/tt_call_many.o
clang -e _tt_start /tmp/tt_call_many.o -o /tmp/tt_call_many
set +e
/tmp/tt_call_many
rc=$?
set -e
[[ $rc -eq 78 ]]
