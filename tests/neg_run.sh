#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

cases=(tests/neg/*.tt)
if [[ ! -e ${cases[0]} ]]; then
    printf 'sin casos negativos\n' >&2
    exit 1
fi

for src in "${cases[@]}"; do
    expected="${src%.tt}.expected"
    if [[ ! -f $expected ]]; then
        printf '%s: falta %s\n' "$src" "$expected" >&2
        exit 1
    fi

    expected_rc=$(awk 'NR == 1 { print; exit }' "$expected")
    if [[ -z $expected_rc ]] || [[ $(wc -l < "$expected") -lt 2 ]]; then
        printf '%s: expectativa invalida\n' "$expected" >&2
        exit 1
    fi

    rc=0
    "$compiler" --emit=macho "$src" -o "$tmp/out.macho" >"$tmp/stdout" 2>"$tmp/stderr" || rc=$?
    if [[ $rc -eq 0 ]]; then
        printf '%s: compilo con exito\n' "$src" >&2
        exit 1
    fi
    if [[ $rc -ne $expected_rc ]]; then
        printf '%s: rc=%s, esperado=%s\n' "$src" "$rc" "$expected_rc" >&2
        cat "$tmp/stderr" >&2
        exit 1
    fi
    while IFS= read -r expected_stderr; do
        if [[ -n $expected_stderr ]] && ! grep -Fq -- "$expected_stderr" "$tmp/stderr"; then
            printf '%s: stderr no contiene: %s\n' "$src" "$expected_stderr" >&2
            cat "$tmp/stderr" >&2
            exit 1
        fi
    done < <(awk 'NR > 1' "$expected")
    printf '  %s OK\n' "$(basename "$src")"
done
