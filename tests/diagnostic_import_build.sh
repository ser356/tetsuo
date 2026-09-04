#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

rm -f build/diagnostic_bad.macho
set +e
out=$(build/main --emit=macho tests/diagnostic_entry.tt -o build/diagnostic_bad.macho 2>&1)
rc=$?
set -e
[[ $rc -eq 2 ]]
expected=$'tests/diagnostic_bad.tt:2:12: error: expresion primaria invalida, encontrado \')\'\n2 |     return )\n  |            ^'
[[ $out == "$expected" ]]
