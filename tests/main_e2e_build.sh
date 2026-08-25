#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

cat > /tmp/tt_return42.tt <<'EOF'
fun main() -> u64 { return 42 }
EOF

rm -f /tmp/tt_stage1.s /tmp/tt_stage1.o /tmp/tt_stage1.bin

bash tests/macos_build.sh src/main.tt /tmp/tt_return42.tt -o /tmp/tt_stage1.s >/dev/null 2>&1
if [[ ! -s /tmp/tt_stage1.s ]]; then
    echo "FAIL: main.tt no emitió /tmp/tt_stage1.s" >&2
    exit 90
fi
clang -c /tmp/tt_stage1.s -o /tmp/tt_stage1.o
clang -e _tt_start /tmp/tt_stage1.o -o /tmp/tt_stage1.bin
/tmp/tt_stage1.bin
