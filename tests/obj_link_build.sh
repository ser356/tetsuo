#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

rm -f /tmp/tt_obj_link.s /tmp/tt_obj_link.o /tmp/tt_obj_link.c /tmp/tt_obj_link
bash tests/macos_build.sh src/main.tt --emit=obj tests/obj_link_test.tt -o /tmp/tt_obj_link.s >/dev/null
if grep -q _tt_start /tmp/tt_obj_link.s; then
    echo "FAIL: --emit=obj emitió _tt_start" >&2
    exit 90
fi
clang -c /tmp/tt_obj_link.s -o /tmp/tt_obj_link.o
cat > /tmp/tt_obj_link.c <<'EOF'
#include <stdint.h>
extern uint64_t tt_add(uint64_t, uint64_t);
int main(void) { return tt_add(19, 23) == 42 ? 0 : 1; }
EOF
clang /tmp/tt_obj_link.c /tmp/tt_obj_link.o -o /tmp/tt_obj_link
/tmp/tt_obj_link