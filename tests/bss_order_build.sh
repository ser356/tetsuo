#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
"$compiler" --emit=macho tests/bss_order_a.tt -o /tmp/tt_bss_a
"$compiler" --emit=macho tests/bss_order_b.tt -o /tmp/tt_bss_b
cmp /tmp/tt_bss_a /tmp/tt_bss_b
chmod +x /tmp/tt_bss_a
set +e
/tmp/tt_bss_a
rc=$?
set -e
[[ $rc -eq 42 ]]
