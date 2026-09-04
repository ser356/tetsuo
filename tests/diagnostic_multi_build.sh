#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

set +e
out=$(build/main --emit=macho tests/diagnostic_multi.tt -o build/diagnostic_multi.macho 2>&1)
rc=$?
set -e
[[ $rc -eq 2 ]]
count=$(printf '%s\n' "$out" | grep -c ': error: ')
[[ $count -eq 5 ]]
printf '%s\n' "$out" | grep -q 'tests/diagnostic_multi.tt:2:12:'
printf '%s\n' "$out" | grep -q 'tests/diagnostic_multi.tt:6:18:'