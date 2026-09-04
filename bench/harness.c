#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern uint64_t bench_bytes(const uint8_t *, uint64_t);
extern uint64_t bench_arith(uint64_t);
extern uint64_t bench_calls(uint64_t);

static double now(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (double)t.tv_sec + (double)t.tv_nsec / 1000000000.0;
}

int main(void) {
    const uint64_t bytes_n = 1 << 20;
    uint8_t *bytes = malloc(bytes_n);
    if (!bytes) return 1;
    for (uint64_t i = 0; i < bytes_n; i++) bytes[i] = (uint8_t)i;

    uint64_t bytes_result = 0;
    double start = now();
    for (unsigned i = 0; i < 200; i++) bytes_result += bench_bytes(bytes, bytes_n);
    double byte_s = now() - start;

    uint64_t arith_result = 0;
    start = now();
    for (unsigned i = 0; i < 20; i++) arith_result += bench_arith(10000000);
    double arith_s = now() - start;

    uint64_t call_result = 0;
    start = now();
    for (unsigned i = 0; i < 20; i++) call_result += bench_calls(1000000);
    double call_s = now() - start;

    int valid = bytes_result == 26738688000ULL && arith_result == 16360706580ULL && call_result == 1223680ULL;
    printf("bytes %.6f\narith %.6f\ncalls %.6f\nvalid %d\n", byte_s, arith_s, call_s, valid);
    free(bytes);
    return valid ? 0 : 2;
}
