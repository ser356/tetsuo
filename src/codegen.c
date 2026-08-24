#include "codegen.h"

#include <stdio.h>
#include <stdlib.h>

static const char *w_pool[7] = {"w9","w10","w11","w12","w13","w14","w15"};
static const char *x_pool[7] = {"x9","x10","x11","x12","x13","x14","x15"};

static int slot_off(IrFn *fn, int slot) {
    (void)fn;
    return 8 * slot;
}

static int in_reg(IrFn *fn, int slot) { return fn->reg_of[slot] >= 0; }

static const char *dst_x(IrFn *fn, int slot) {
    int r = fn->reg_of[slot];
    return r >= 0 ? x_pool[r] : "x16";
}
static const char *dst_w(IrFn *fn, int slot) {
    int r = fn->reg_of[slot];
    return r >= 0 ? w_pool[r] : "w16";
}
static const char *src_x_or_load(FILE *out, IrFn *fn, int slot, const char *scratch) {
    int r = fn->reg_of[slot];
    if (r >= 0) return x_pool[r];
    fprintf(out, "    ldr     %s, [sp, #%d]\n", scratch, slot_off(fn, slot));
    return scratch;
}
static const char *src_w_or_load(FILE *out, IrFn *fn, int slot, const char *scratch_w) {
    int r = fn->reg_of[slot];
    if (r >= 0) return w_pool[r];
    fprintf(out, "    ldr     %s, [sp, #%d]\n", scratch_w, slot_off(fn, slot));
    return scratch_w;
}

static void spill_x(FILE *out, IrFn *fn, int slot, const char *xreg) {
    if (in_reg(fn, slot)) return;
    fprintf(out, "    str     %s, [sp, #%d]\n", xreg, slot_off(fn, slot));
}

static void emit_movi_reg(FILE *out, const char *xreg, uint64_t v) {
    unsigned g[4] = {
        (unsigned)((v >>  0) & 0xffff),
        (unsigned)((v >> 16) & 0xffff),
        (unsigned)((v >> 32) & 0xffff),
        (unsigned)((v >> 48) & 0xffff),
    };
    int nz[4], n = 0;
    for (int i = 0; i < 4; i++) if (g[i]) nz[n++] = i;
    if (n == 0) { fprintf(out, "    mov     %s, #0\n", xreg); return; }
    int i0 = nz[0];
    if (i0 == 0) fprintf(out, "    movz    %s, #0x%04x\n", xreg, g[0]);
    else         fprintf(out, "    movz    %s, #0x%04x, lsl #%d\n", xreg, g[i0], i0 * 16);
    for (int k = 1; k < n; k++) {
        int i = nz[k];
        fprintf(out, "    movk    %s, #0x%04x, lsl #%d\n", xreg, g[i], i * 16);
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

static const char *binop_mnemonic(BinOpKind op) {
    switch (op) {
        case OP_ADD: return "add";
        case OP_SUB: return "sub";
        case OP_MUL: return "mul";
        case OP_DIV: return "udiv";
        case OP_AND: return "and";
        case OP_OR:  return "orr";
        case OP_XOR: return "eor";
    }
    return "add";
}

static void emit_instr(FILE *out, IrFn *fn, Instr *i, int epilogue_label) {
    switch (i->op) {
        case IR_MOVI: {
            const char *dx = dst_x(fn, i->dst);
            emit_movi_reg(out, dx, i->imm);
            spill_x(out, fn, i->dst, dx);
            return;
        }
        case IR_LABEL_ADDR: {
            const char *dx = dst_x(fn, i->dst);
            fprintf(out, "    adrp    %s, .L_str%d\n", dx, i->str_id);
            fprintf(out, "    add     %s, %s, :lo12:.L_str%d\n", dx, dx, i->str_id);
            spill_x(out, fn, i->dst, dx);
            return;
        }
        case IR_LOAD_LOCAL: {
            int off = slot_off(fn, i->local);
            const char *dw = dst_w(fn, i->dst);
            if (i->width == 1)      fprintf(out, "    ldrb    %s, [sp, #%d]\n", dw, off);
            else if (i->width == 4) fprintf(out, "    ldr     %s, [sp, #%d]\n", dw, off);
            else                    fprintf(out, "    ldr     %s, [sp, #%d]\n", dst_x(fn, i->dst), off);
            spill_x(out, fn, i->dst, dst_x(fn, i->dst));
            return;
        }
        case IR_STORE_LOCAL: {
            int r = fn->reg_of[i->a];
            const char *sw = (r >= 0) ? w_pool[r] : "w16";
            const char *sx = (r >= 0) ? x_pool[r] : "x16";
            if (r < 0) fprintf(out, "    ldr     x16, [sp, #%d]\n", slot_off(fn, i->a));
            int off = slot_off(fn, i->local);
            if (i->width == 1)      fprintf(out, "    strb    %s, [sp, #%d]\n", sw, off);
            else if (i->width == 4) fprintf(out, "    str     %s, [sp, #%d]\n", sw, off);
            else                    fprintf(out, "    str     %s, [sp, #%d]\n", sx, off);
            return;
        }
        case IR_LOAD_MEM: {
            const char *addr = src_x_or_load(out, fn, i->a, "x17");
            const char *dw = dst_w(fn, i->dst);
            if (i->width == 1)      fprintf(out, "    ldrb    %s, [%s]\n", dw, addr);
            else if (i->width == 4) fprintf(out, "    ldr     %s, [%s]\n", dw, addr);
            else                    fprintf(out, "    ldr     %s, [%s]\n", dst_x(fn, i->dst), addr);
            spill_x(out, fn, i->dst, dst_x(fn, i->dst));
            return;
        }
        case IR_STORE_MEM: {
            const char *addr = src_x_or_load(out, fn, i->a, "x17");
            int r = fn->reg_of[i->b];
            const char *vw = (r >= 0) ? w_pool[r] : "w16";
            const char *vx = (r >= 0) ? x_pool[r] : "x16";
            if (r < 0) fprintf(out, "    ldr     x16, [sp, #%d]\n", slot_off(fn, i->b));
            if (i->width == 1)      fprintf(out, "    strb    %s, [%s]\n", vw, addr);
            else if (i->width == 4) fprintf(out, "    str     %s, [%s]\n", vw, addr);
            else                    fprintf(out, "    str     %s, [%s]\n", vx, addr);
            return;
        }
        case IR_BINOP: {
            int wide = (i->width == 8);
            const char *a = wide
                ? src_x_or_load(out, fn, i->a, "x16")
                : src_w_or_load(out, fn, i->a, "w16");
            const char *b = wide
                ? src_x_or_load(out, fn, i->b, "x17")
                : src_w_or_load(out, fn, i->b, "w17");
            const char *d = wide ? dst_x(fn, i->dst) : dst_w(fn, i->dst);
            fprintf(out, "    %s     %s, %s, %s\n", binop_mnemonic(i->binop), d, a, b);
            if (!in_reg(fn, i->dst))
                fprintf(out, "    str     x16, [sp, #%d]\n", slot_off(fn, i->dst));
            return;
        }
        case IR_CMPEQ:
        case IR_CMPNE: {
            int wide = (i->width == 8);
            const char *a = wide
                ? src_x_or_load(out, fn, i->a, "x16")
                : src_w_or_load(out, fn, i->a, "w16");
            const char *b = wide
                ? src_x_or_load(out, fn, i->b, "x17")
                : src_w_or_load(out, fn, i->b, "w17");
            const char *dw = dst_w(fn, i->dst);
            fprintf(out, "    cmp     %s, %s\n", a, b);
            fprintf(out, "    cset    %s, %s\n", dw, (i->op == IR_CMPEQ) ? "eq" : "ne");
            if (!in_reg(fn, i->dst))
                fprintf(out, "    str     x16, [sp, #%d]\n", slot_off(fn, i->dst));
            return;
        }
        case IR_CALL: {
            for (int k = 0; k < i->nargs; k++) {
                int s = i->args[k];
                int r = fn->reg_of[s];
                if (r >= 0) fprintf(out, "    mov     x%d, %s\n", k, x_pool[r]);
                else        fprintf(out, "    ldr     x%d, [sp, #%d]\n", k, slot_off(fn, s));
            }
            fprintf(out, "    bl      %s\n", i->callee);
            int r = fn->reg_of[i->dst];
            if (r >= 0) fprintf(out, "    mov     %s, x0\n", x_pool[r]);
            else        fprintf(out, "    str     x0, [sp, #%d]\n", slot_off(fn, i->dst));
            return;
        }
        case IR_RET: {
            int r = fn->reg_of[i->a];
            if (r >= 0) fprintf(out, "    mov     w0, %s\n", w_pool[r]);
            else        fprintf(out, "    ldr     w0, [sp, #%d]\n", slot_off(fn, i->a));
            fprintf(out, "    b       .L%d\n", epilogue_label);
            return;
        }
        case IR_JZ: {
            const char *cw = src_w_or_load(out, fn, i->a, "w16");
            fprintf(out, "    cbz     %s, .L%d\n", cw, i->label);
            return;
        }
        case IR_JMP:
            fprintf(out, "    b       .L%d\n", i->label);
            return;
        case IR_LABEL:
            fprintf(out, ".L%d:\n", i->label);
            return;
    }
}

static int param_width(Type *t) {
    if (!t) return 8;
    switch (t->kind) {
        case T_U8:  return 1;
        case T_U32: return 4;
        default:    return 8;
    }
}

static void emit_fn(FILE *out, IrFn *fn, int epilogue_label) {
    fprintf(out, "\n    .globl   %s\n", fn->name);
    fprintf(out, "%s:\n", fn->name);
    fprintf(out, "    stp     x29, x30, [sp, #-16]!\n");
    fprintf(out, "    mov     x29, sp\n");
    if (fn->frame_bytes > 0)
        fprintf(out, "    sub     sp, sp, #%d\n", fn->frame_bytes);

    for (int k = 0; k < fn->nparams; k++) {
        int w = param_width(fn->param_types[k]);
        int off = slot_off(fn, k);
        switch (w) {
            case 1: fprintf(out, "    strb    w%d, [sp, #%d]\n", k, off); break;
            case 4: fprintf(out, "    str     w%d, [sp, #%d]\n", k, off); break;
            default: fprintf(out, "    str     x%d, [sp, #%d]\n", k, off); break;
        }
    }

    for (Instr *i = fn->head; i; i = i->next) emit_instr(out, fn, i, epilogue_label);

    fprintf(out, ".L%d:\n", epilogue_label);
    if (fn->frame_bytes > 0)
        fprintf(out, "    add     sp, sp, #%d\n", fn->frame_bytes);
    fprintf(out, "    ldp     x29, x30, [sp], #16\n");
    fprintf(out, "    ret\n");
}

void codegen(FILE *out, Program *prog, IrFn *funcs) {
    emit_start(out);

    int max_label = 0;
    for (IrFn *fn = funcs; fn; fn = fn->next) {
        for (Instr *i = fn->head; i; i = i->next) {
            if ((i->op == IR_LABEL || i->op == IR_JMP || i->op == IR_JZ) && i->label >= max_label)
                max_label = i->label + 1;
        }
    }
    int epilogue_label = max_label;

    for (IrFn *fn = funcs; fn; fn = fn->next) emit_fn(out, fn, epilogue_label++);

    if (prog->strs) {
        fprintf(out, "\n    .section .rodata\n");
        for (StrLit *s = prog->strs; s; s = s->next) {
            fprintf(out, "    .balign  8\n");
            fprintf(out, ".L_str%d:\n", s->id);
            for (size_t k = 0; k < s->len; k++) {
                fprintf(out, "    .byte   0x%02x\n", (unsigned char)s->bytes[k]);
            }
        }
    }
}
