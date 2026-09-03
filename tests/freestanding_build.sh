#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

rm -f /tmp/tt_freestanding.s /tmp/tt_freestanding.o /tmp/tt_freestanding.c /tmp/tt_freestanding
bash tests/macos_build.sh src/main.tt --emit=obj tests/freestanding_test.tt -o /tmp/tt_freestanding.s >/dev/null
clang -c /tmp/tt_freestanding.s -o /tmp/tt_freestanding.o
if nm -m /tmp/tt_freestanding.o | grep -q '__bss'; then
    echo "FAIL: freestanding contiene bss" >&2
    exit 90
fi
cat > /tmp/tt_freestanding.c <<'EOF'
#include <pthread.h>
#include <stdint.h>
#include <string.h>
extern uint64_t tt_freestanding(uint8_t *, uint64_t, const uint8_t *, uint64_t);
static void *run(void *arg) {
    uint8_t scratch[128];
    for (int i = 0; i < 10000; i++) {
        memset(scratch, 0, sizeof scratch);
        if (tt_freestanding(scratch, sizeof scratch, (const uint8_t *)"42", 2) != 42) return (void *)1;
    }
    return 0;
}
int main(void) {
    pthread_t a, b;
    void *ra, *rb;
    if (pthread_create(&a, 0, run, 0) || pthread_create(&b, 0, run, 0)) return 2;
    if (pthread_join(a, &ra) || pthread_join(b, &rb)) return 3;
    return ra != 0 || rb != 0;
}
EOF
clang /tmp/tt_freestanding.c /tmp/tt_freestanding.o -o /tmp/tt_freestanding
/tmp/tt_freestanding