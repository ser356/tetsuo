#include "ir.h"

#include <stdio.h>
#include <stdlib.h>

typedef struct {
    Instr *head;
    Instr *tail;
    int    next_vreg;
    int    next_label;
} B;

static Instr *ins(B *b, IrOp op) {
    Instr *i = calloc(1, sizeof(*i));
    if (!i) { perror("calloc"); exit(1); }
    i->op = op;
    if (!b->head) b->head = i; else b->tail->next = i;
    b->tail = i;
    return i;
}

static int lower_expr(B *b, Expr *e) {
    switch (e->kind) {
        case EX_INT: {
            int v = b->next_vreg++;
            Instr *m = ins(b, IR_MOVI);
            m->dst = v;
            m->imm = e->ival;
            return v;
        }
        case EX_CAST:
            return lower_expr(b, e->inner);
        case EX_DEREF:
            fprintf(stderr, "ir: EX_DEREF suelto no soportado en el hito 1\n");
            exit(1);
    }
    fprintf(stderr, "ir: ExprKind desconocido\n");
    exit(1);
}

static void lower_stmt(B *b, Stmt *s) {
    switch (s->kind) {
        case ST_STORE: {
            int addr = lower_expr(b, s->lhs_ptr);
            int val  = lower_expr(b, s->rhs);
            Instr *st = ins(b, IR_STRB);
            st->addr = addr;
            st->src  = val;
            return;
        }
        case ST_LOOP: {
            int L = b->next_label++;
            Instr *lab = ins(b, IR_LABEL); lab->label = L;
            Instr *jmp = ins(b, IR_JMP);   jmp->label = L;
            return;
        }
    }
}

IrFn *lower(Func *f) {
    B b = {0};
    for (Stmt *s = f->body; s; s = s->next) lower_stmt(&b, s);
    IrFn *fn = calloc(1, sizeof(*fn));
    if (!fn) { perror("calloc"); exit(1); }
    fn->name = f->name;
    fn->head = b.head;
    return fn;
}
