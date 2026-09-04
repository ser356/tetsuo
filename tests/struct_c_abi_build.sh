#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

rm -f /tmp/tt_struct_c.s /tmp/tt_struct_c.o /tmp/tt_struct_c.c /tmp/tt_struct_c
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
"$compiler" --emit=obj tests/struct_c_abi.tt -o /tmp/tt_struct_c.s
clang -c /tmp/tt_struct_c.s -o /tmp/tt_struct_c.o
cat > /tmp/tt_struct_c.c <<'EOF'
#include <stddef.h>
#include <stdint.h>
typedef struct { uint8_t a; uint32_t b; uint8_t *c; } MixedC;
extern uint64_t tt_mixed_read(MixedC *);
extern void tt_mixed_write(MixedC *, uint8_t *);
int main(void) {
    uint8_t x = 5, y = 9;
    MixedC v = {3, 34, &x};
    if (sizeof v != 16 || offsetof(MixedC, a) != 0 || offsetof(MixedC, b) != 4 || offsetof(MixedC, c) != 8) return 1;
    if (tt_mixed_read(&v) != 42) return 2;
    tt_mixed_write(&v, &y);
    if (v.a != 7 || v.b != 0x12345678 || v.c != &y) return 3;
    return 0;
}
EOF
clang /tmp/tt_struct_c.c /tmp/tt_struct_c.o -o /tmp/tt_struct_c
/tmp/tt_struct_c
