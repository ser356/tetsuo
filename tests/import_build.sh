#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
rm -f /tmp/tt_import.s /tmp/tt_import.o /tmp/tt_import.bin
bash tests/macos_build.sh tests/import_b.tt >/dev/null 2>&1 || true
if [[ ! -x build/main ]]; then
    echo "no build/main" >&2; exit 90
fi
./build/main tests/import_b.tt -o /tmp/tt_import.s
clang -c /tmp/tt_import.s -o /tmp/tt_import.o
clang -e _tt_start -o /tmp/tt_import.bin /tmp/tt_import.o
/tmp/tt_import.bin
