#include "codegen.h"

#include <stdio.h>
#include <stdlib.h>

static void emit_movi(FILE *out, int dst, uint64_t v) {
    unsigned g[4] = {
        (unsigned)((v >>  0) & 0xffff),
        (unsigned)((v >> 16) & 0xffff),
        (unsigned)((v >> 32) & 0xffff),
        (unsigned)((v >> 48) & 0xffff),
    };
    int nz[4], n = 0;
    for (int i = 0; i < 4; i++) if (g[i]) nz[n++] = i;

    if (n == 0) { fprintf(out, "    mov     x%d, #0\n", dst); return; }

    if (n == 1) {
        int i = nz[0];
        if (i == 0) fprintf(out, "    mov     w%d, #%u\n", dst, g[0]);
        else        fprintf(out, "    movz    x%d, #0x%04x, lsl #%d\n", dst, g[i], i * 16);
        return;
    }

    int i0 = nz[0];
    if (i0 == 0) fprintf(out, "    movz    x%d, #0x%04x\n", dst, g[0]);
    else         fprintf(out, "    movz    x%d, #0x%04x, lsl #%d\n", dst, g[i0], i0 * 16);
    for (int k = 1; k < n; k++) {
        int i = nz[k];
        fprintf(out, "    movk    x%d, #0x%04x, lsl #%d\n", dst, g[i], i * 16);
    }
}

void codegen(FILE *out, IrFn *fn) {
    fprintf(out, "    .section .text.boot\n");
    fprintf(out, "    .globl   _start\n");
    fprintf(out, "_start:\n");
    for (Instr *i = fn->head; i; i = i->next) {
        switch (i->op) {
            case IR_MOVI:
                emit_movi(out, i->dst, i->imm);
                break;
            case IR_STRB:
                fprintf(out, "    strb    w%d, [x%d]\n", i->src, i->addr);
                break;
            case IR_LABEL:
                fprintf(out, "%d:\n", i->label + 1);
                break;
            case IR_JMP:
                fprintf(out, "    b       %db\n", i->label + 1);
                break;
        }
    }
}
