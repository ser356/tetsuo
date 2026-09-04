#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
src="$tmp/many.tt"
{
    printf 'fun pick('
    for i in $(seq 1 520); do
        [[ $i -gt 1 ]] && printf ','
        printf 'a%s:u64' "$i"
    done
    printf ')->u64{return a520}\nfun main()->u64{return pick('
    for i in $(seq 1 520); do
        [[ $i -gt 1 ]] && printf ','
        printf '%s' "$i"
    done
    printf ')}\n'
} > "$src"
"$compiler" "$src" -o "$tmp/many.s"
grep -q 'sub     sp, sp, x16' "$tmp/many.s"
clang -c "$tmp/many.s" -o "$tmp/many.o"
clang -e _tt_start "$tmp/many.o" -o "$tmp/many_text"
"$compiler" --emit=macho "$src" -o "$tmp/many_macho"
chmod +x "$tmp/many_text" "$tmp/many_macho"
set +e
"$tmp/many_text"; a=$?
"$tmp/many_macho"; b=$?
set -e
[[ $a -eq 8 && $b -eq 8 ]]
