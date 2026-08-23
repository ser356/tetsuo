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

static void emit_start(FILE *out) {
    fprintf(out, "    .section .text.boot\n");
    fprintf(out, "    .globl   _start\n");
    fprintf(out, "_start:\n");
    fprintf(out, "    adrp    x0, __stack_top\n");
    fprintf(out, "    add     x0, x0, :lo12:__stack_top\n");
    fprintf(out, "    mov     sp, x0\n");
    fprintf(out, "    bl      main\n");
    fprintf(out, "1:\n");
    fprintf(out, "    b       1b\n");
}

static void emit_fn(FILE *out, IrFn *fn) {
    fprintf(out, "\n    .globl   %s\n", fn->name);
    fprintf(out, "%s:\n", fn->name);
    fprintf(out, "    stp     x29, x30, [sp, #-16]!\n");
    fprintf(out, "    mov     x29, sp\n");
    for (Instr *i = fn->head; i; i = i->next) {
        switch (i->op) {
            case IR_MOVI:  emit_movi(out, i->dst, i->imm); break;
            case IR_STRB:  fprintf(out, "    strb    w%d, [x%d]\n", i->src, i->addr); break;
            case IR_LABEL: fprintf(out, "%d:\n", i->label + 1); break;
            case IR_JMP:   fprintf(out, "    b       %db\n", i->label + 1); break;
            case IR_CALL:  fprintf(out, "    bl      %s\n", i->callee); break;
        }
    }
    fprintf(out, "    ldp     x29, x30, [sp], #16\n");
    fprintf(out, "    ret\n");
}

void codegen(FILE *out, IrFn *funcs) {
    emit_start(out);
    for (IrFn *fn = funcs; fn; fn = fn->next) emit_fn(out, fn);
}
