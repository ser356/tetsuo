#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
printf 'fn main() -> u64 { return 0 }\n' > "$tmp/fn.tt"
printf 'pub fun main() -> u64 { return 0 }\n' > "$tmp/pub.tt"
printf 'mut x\nfun main() -> u64 { return 0 }\n' > "$tmp/mut.tt"
printf 'int main() { return 0 }\n' > "$tmp/int.tt"
printf 'fun main() -> u64 { printf(1); return 0 }\n' > "$tmp/printf.tt"
printf 'fun main() -> u64 { malloc(8); return 0 }\n' > "$tmp/malloc.tt"
printf '#include <stdio.h>\nfun main() -> u64 { return 0 }\n' > "$tmp/include.tt"
printf '/* block */\nfun main() -> u64 { return 0 }\n' > "$tmp/block.tt"
printf "fun main() -> u64 { let s: str = 'fn pub mut int printf malloc #include /*'; return 0 } // fn malloc\n" > "$tmp/clean.tt"
for case in fn pub mut int printf malloc include block; do
    set +e
    "$compiler" --diagnostics=json "$tmp/$case.tt" -o "$tmp/$case.s" 2>"$tmp/$case.json"
    rc=$?
    set -e
    [[ $rc -eq 2 ]]
done
"$compiler" --emit=macho "$tmp/clean.tt" -o "$tmp/clean"
python3 - "$tmp" <<'PY'
import json, pathlib, sys
root = pathlib.Path(sys.argv[1])
expected = {
    'fn': ('E0201', 'fun'), 'pub': ('E0202', ''),
    'mut': ('E0203', ''), 'int': ('E0204', 'u64'),
    'printf': ('E0205', 'print'), 'malloc': ('E0206', 'arena_take'),
    'include': ('E0207', "import 'path'"), 'block': ('E0208', '//'),
}
for case, pair in expected.items():
    rows = [json.loads(x) for x in (root / f'{case}.json').read_text().splitlines() if x]
    assert len(rows) == 1, (case, rows)
    assert (rows[0]['code'], rows[0]['fix']) == pair
PY
