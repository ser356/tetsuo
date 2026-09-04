#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

entry="$tmp/entry.tt"
: > "$entry"
for i in 1 2 3 4 5; do
    chunk="$tmp/chunk_$i.tt"
    perl -e 'print "//", "x" x 230000, "\n"' > "$chunk"
    printf "import '%s'\n" "$chunk" >> "$entry"
done
printf 'fun main() -> u64 { return 0 }\n' >> "$entry"

"$compiler" --emit=macho "$entry" -o "$tmp/out.macho"
chmod +x "$tmp/out.macho"
"$tmp/out.macho"
