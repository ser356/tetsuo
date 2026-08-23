#include "ir.h"

#include <stdio.h>
#include <stdlib.h>

typedef struct {
    Instr *head;
    Instr *tail;
    int    next_vreg;
    int    next_label;
    int    nparams;
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
        case EX_VAR:
            return e->var_index;
        case EX_CAST:
            return lower_expr(b, e->inner);
        case EX_DEREF:
            fprintf(stderr, "ir: EX_DEREF suelto no soportado en el hito 2\n");
            exit(1);
    }
    fprintf(stderr, "ir: ExprKind desconocido\n");
    exit(1);
}

static void lower_stmt(B *b, Stmt *s) {
    b->next_vreg = b->nparams;
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
        case ST_CALL: {
            for (int k = 0; k < s->nargs; k++) {
                Expr *a = s->args[k];
                if (a->kind != EX_INT) {
                    fprintf(stderr, "ir: hito 2 solo admite literales enteros como argumentos\n");
                    exit(1);
                }
                Instr *m = ins(b, IR_MOVI);
                m->dst = k;
                m->imm = a->ival;
            }
            Instr *c = ins(b, IR_CALL);
            c->callee = s->callee;
            c->nargs  = s->nargs;
            return;
        }
    }
}

static IrFn *lower_one(Func *f) {
    B b = {0};
    b.nparams = f->nparams;
    for (Stmt *s = f->body; s; s = s->next) lower_stmt(&b, s);
    IrFn *fn = calloc(1, sizeof(*fn));
    if (!fn) { perror("calloc"); exit(1); }
    fn->name    = f->name;
    fn->nparams = f->nparams;
    fn->head    = b.head;
    return fn;
}

IrFn *lower(Func *funcs) {
    IrFn *head = NULL, *tail = NULL;
    for (Func *f = funcs; f; f = f->next) {
        IrFn *fn = lower_one(f);
        if (!head) head = fn; else tail->next = fn;
        tail = fn;
    }
    return head;
}
