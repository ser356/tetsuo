#include <stddef.h>
#include <stdint.h>

uint64_t bench_bytes(const uint8_t *p, uint64_t n) {
    uint64_t sum = 0;
    for (uint64_t i = 0; i < n; i++) sum += p[i];
    return sum;
}

uint64_t bench_arith(uint64_t n) {
    uint64_t x = 1;
    for (uint64_t i = 0; i < n; i++) x = (x * 1664525 + 1013904223) & UINT32_MAX;
    return x;
}

static uint64_t bench_step3(uint64_t x) { return x * 3 + 1; }
static uint64_t bench_step2(uint64_t x) { return bench_step3(x) + 2; }
static uint64_t bench_step1(uint64_t x) { return bench_step2(x) + 3; }

uint64_t bench_calls(uint64_t n) {
    uint64_t x = 0;
    for (uint64_t i = 0; i < n; i++) x = bench_step1(x) & UINT16_MAX;
    return x;
}
