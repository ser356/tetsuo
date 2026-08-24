#include "ir.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    Instr *head;
    Instr *tail;
    Func  *f;
    int    nlocals_base;
    int    next_slot;
    int    max_slot;
    int    *shared_label;
    int    break_stack[16];
    int    break_top;
    Type   **slot_types;
    int    slot_types_cap;
} B;

static Instr *ins(B *b, IrOp op) {
    Instr *i = calloc(1, sizeof(*i));
    if (!i) { perror("calloc"); exit(1); }
    i->op = op;
    if (!b->head) b->head = i; else b->tail->next = i;
    b->tail = i;
    return i;
}

static int new_slot(B *b, Type *ty) {
    int s = b->next_slot++;
    if (s + 1 > b->slot_types_cap) {
        int nc = b->slot_types_cap ? b->slot_types_cap * 2 : 16;
        while (nc < s + 1) nc *= 2;
        b->slot_types = realloc(b->slot_types, (size_t)nc * sizeof(Type *));
        if (!b->slot_types) { perror("realloc"); exit(1); }
        for (int i = b->slot_types_cap; i < nc; i++) b->slot_types[i] = NULL;
        b->slot_types_cap = nc;
    }
    b->slot_types[s] = ty;
    if (s + 1 > b->max_slot) b->max_slot = s + 1;
    return s;
}

static int lower_expr(B *b, Expr *e);

static int lower_call(B *b, Expr *e) {
    int max_slots = e->nargs * 2;
    int *argslots = calloc((size_t)(max_slots ? max_slots : 1), sizeof(int));
    int actual = 0;
    for (int k = 0; k < e->nargs; k++) {
        Expr *a = e->args[k];
        if (a->type && a->type->kind == T_STR) {
            if (a->kind != EX_VAR) {
                fprintf(stderr, "ir: arg 'str' solo desde local (hito 4)\n");
                exit(1);
            }
            int p = new_slot(b, mk_ptr(mk_prim(T_U8)));
            Instr *lp = ins(b, IR_LOAD_LOCAL);
            lp->dst = p; lp->local = a->var_index; lp->width = 8;
            argslots[actual++] = p;
            int L = new_slot(b, mk_prim(T_U64));
            Instr *ll = ins(b, IR_LOAD_LOCAL);
            ll->dst = L; ll->local = a->var_index + 1; ll->width = 8;
            argslots[actual++] = L;
        } else {
            argslots[actual++] = lower_expr(b, a);
        }
    }
    if (actual > 8) { fprintf(stderr, "ir: mas de 8 argumentos efectivos\n"); exit(1); }
    int dst = new_slot(b, e->type);
    Instr *c = ins(b, IR_CALL);
    c->dst = dst;
    c->callee = e->callee;
    c->args = argslots;
    c->nargs = actual;
    return dst;
}

static int lower_expr(B *b, Expr *e) {
    switch (e->kind) {
        case EX_INT: {
            int s = new_slot(b, e->type);
            Instr *m = ins(b, IR_MOVI);
            m->dst = s;
            m->imm = e->ival;
            return s;
        }
        case EX_VAR: {
            int s = new_slot(b, e->type);
            Instr *l = ins(b, IR_LOAD_LOCAL);
            l->dst = s;
            l->local = e->var_index;
            l->width = type_width(b->f->locals[e->var_index].type);
            return s;
        }
        case EX_CALL:
            return lower_call(b, e);
        case EX_DEREF: {
            int addr = lower_expr(b, e->inner);
            int s = new_slot(b, e->type);
            Instr *l = ins(b, IR_LOAD_MEM);
            l->dst = s;
            l->a   = addr;
            l->width = type_width(e->type);
            return s;
        }
        case EX_BIN: {
            int la = lower_expr(b, e->lhs);
            int lb = lower_expr(b, e->rhs);
            int s = new_slot(b, e->type);
            Instr *op = ins(b, IR_BINOP);
            op->dst = s;
            op->a = la;
            op->b = lb;
            op->binop = e->op;
            op->width = e->type ? type_width(e->type) : 4;
            return s;
        }
        case EX_EQ: {
            int la = lower_expr(b, e->lhs);
            int lb = lower_expr(b, e->rhs);
            int s = new_slot(b, e->type);
            Instr *op = ins(b, IR_CMPEQ);
            op->dst = s;
            op->a = la;
            op->b = lb;
            op->width = e->lhs->type ? type_width(e->lhs->type) : 4;
            return s;
        }
        case EX_NE: {
            int la = lower_expr(b, e->lhs);
            int lb = lower_expr(b, e->rhs);
            int s = new_slot(b, e->type);
            Instr *op = ins(b, IR_CMPNE);
            op->dst = s;
            op->a = la;
            op->b = lb;
            op->width = e->lhs->type ? type_width(e->lhs->type) : 4;
            return s;
        }
        case EX_STRLIT:
            fprintf(stderr, "ir: literal de cadena solo admitido como init de 'let'\n");
            exit(1);
        case EX_ADDR:
            fprintf(stderr, "ir: EX_ADDR no soportado en hito 4\n");
            exit(1);
    }
    fprintf(stderr, "ir: expr desconocida\n");
    exit(1);
}

static void lower_stmt(B *b, Stmt *s);

static void lower_block(B *b, Stmt *body) {
    for (Stmt *s = body; s; s = s->next) lower_stmt(b, s);
}

static void lower_stmt(B *b, Stmt *s) {
    switch (s->kind) {
        case ST_LET: {
            Type *ty = b->f->locals[s->let_local].type;
            if (ty->kind == T_STR) {
                Expr *init = s->let_init;
                if (init->kind != EX_STRLIT)
                    { fprintf(stderr, "ir: str let requiere literal de cadena en hito 4\n"); exit(1); }
                int ptr_slot = new_slot(b, mk_ptr(mk_prim(T_U8)));
                Instr *la = ins(b, IR_LABEL_ADDR);
                la->dst = ptr_slot;
                la->str_id = init->str_id;
                Instr *sp = ins(b, IR_STORE_LOCAL);
                sp->local = s->let_local;
                sp->a = ptr_slot;
                sp->width = 8;

                int len_slot = new_slot(b, mk_prim(T_U64));
                Instr *m = ins(b, IR_MOVI);
                m->dst = len_slot;
                m->imm = (uint64_t)init->str_len;
                Instr *sl = ins(b, IR_STORE_LOCAL);
                sl->local = s->let_local + 1;
                sl->a = len_slot;
                sl->width = 8;
                return;
            }
            int v = lower_expr(b, s->let_init);
            Instr *st = ins(b, IR_STORE_LOCAL);
            st->local = s->let_local;
            st->a = v;
            st->width = type_width(ty);
            return;
        }
        case ST_ASSIGN: {
            int v = lower_expr(b, s->assign_val);
            Instr *st = ins(b, IR_STORE_LOCAL);
            st->local = s->assign_local;
            st->a = v;
            st->width = type_width(b->f->locals[s->assign_local].type);
            return;
        }
        case ST_STORE: {
            int addr = lower_expr(b, s->store_ptr);
            int val  = lower_expr(b, s->store_val);
            Instr *st = ins(b, IR_STORE_MEM);
            st->a = addr;
            st->b = val;
            st->width = type_width(s->store_ptr->type->inner);
            return;
        }
        case ST_RETURN: {
            int v = lower_expr(b, s->ret_val);
            Instr *r = ins(b, IR_RET);
            r->a = v;
            return;
        }
        case ST_LOOP: {
            int start = (*b->shared_label)++;
            int end   = (*b->shared_label)++;
            Instr *ls = ins(b, IR_LABEL); ls->label = start;
            if (b->break_top >= 16) { fprintf(stderr, "ir: bucles anidados demasiado profundos\n"); exit(1); }
            b->break_stack[b->break_top++] = end;
            lower_block(b, s->body);
            b->break_top--;
            Instr *j = ins(b, IR_JMP); j->label = start;
            Instr *le = ins(b, IR_LABEL); le->label = end;
            return;
        }
        case ST_WHILE: {
            int start = (*b->shared_label)++;
            int end   = (*b->shared_label)++;
            Instr *ls = ins(b, IR_LABEL); ls->label = start;
            int c = lower_expr(b, s->cond);
            Instr *jz = ins(b, IR_JZ); jz->a = c; jz->label = end;
            if (b->break_top >= 16) { fprintf(stderr, "ir: bucles anidados demasiado profundos\n"); exit(1); }
            b->break_stack[b->break_top++] = end;
            lower_block(b, s->body);
            b->break_top--;
            Instr *j = ins(b, IR_JMP); j->label = start;
            Instr *le = ins(b, IR_LABEL); le->label = end;
            return;
        }
        case ST_IF: {
            int c = lower_expr(b, s->cond);
            int else_lbl = (*b->shared_label)++;
            Instr *jz = ins(b, IR_JZ); jz->a = c; jz->label = else_lbl;
            lower_block(b, s->body);
            if (s->else_body) {
                int end_lbl = (*b->shared_label)++;
                Instr *jmp = ins(b, IR_JMP); jmp->label = end_lbl;
                Instr *le = ins(b, IR_LABEL); le->label = else_lbl;
                lower_block(b, s->else_body);
                Instr *le2 = ins(b, IR_LABEL); le2->label = end_lbl;
            } else {
                Instr *le = ins(b, IR_LABEL); le->label = else_lbl;
            }
            return;
        }
        case ST_BREAK: {
            if (b->break_top == 0) { fprintf(stderr, "ir: 'break' fuera de 'loop'\n"); exit(1); }
            Instr *j = ins(b, IR_JMP);
            j->label = b->break_stack[b->break_top - 1];
            return;
        }
        case ST_EXPR:
            lower_expr(b, s->expr);
            return;
    }
}

static IrFn *lower_one(Func *f, int *shared_label) {
    B b = {0};
    b.f = f;
    b.nlocals_base = f->nlocals;
    b.next_slot = b.nlocals_base;
    b.max_slot  = b.nlocals_base;
    b.shared_label = shared_label;

    b.slot_types_cap = 16;
    while (b.slot_types_cap < b.nlocals_base + 4) b.slot_types_cap *= 2;
    b.slot_types = calloc((size_t)b.slot_types_cap, sizeof(Type *));
    for (int i = 0; i < f->nlocals; i++) b.slot_types[i] = f->locals[i].type;

    lower_block(&b, f->body);

    IrFn *fn = calloc(1, sizeof(*fn));
    if (!fn) { perror("calloc"); exit(1); }
    fn->name    = f->name;
    fn->nparams = f->nparams;
    fn->nlocals = f->nlocals;
    fn->ret_type = f->ret_type;
    fn->head    = b.head;

    fn->nslots = b.max_slot;
    fn->slot_types = b.slot_types;
    fn->param_types = calloc((size_t)fn->nparams, sizeof(Type *));
    for (int i = 0; i < fn->nparams; i++) fn->param_types[i] = f->locals[i].type;

    int fb = fn->nslots * 8;
    fb = (fb + 15) & ~15;
    fn->frame_bytes = fb;
    return fn;
}

#define NREGS 7

static int collect_uses(Instr *i, int uses[16]) {
    int nu = 0;
    switch (i->op) {
        case IR_STORE_LOCAL: uses[nu++] = i->a; break;
        case IR_LOAD_MEM:    uses[nu++] = i->a; break;
        case IR_STORE_MEM:   uses[nu++] = i->a; uses[nu++] = i->b; break;
        case IR_BINOP:
        case IR_CMPEQ:
        case IR_CMPNE:       uses[nu++] = i->a; uses[nu++] = i->b; break;
        case IR_JZ:          uses[nu++] = i->a; break;
        case IR_RET:         uses[nu++] = i->a; break;
        case IR_CALL:
            for (int k = 0; k < i->nargs; k++) uses[nu++] = i->args[k];
            break;
        default: break;
    }
    return nu;
}

static int instr_dst(Instr *i) {
    switch (i->op) {
        case IR_MOVI:
        case IR_LABEL_ADDR:
        case IR_LOAD_LOCAL:
        case IR_LOAD_MEM:
        case IR_BINOP:
        case IR_CMPEQ:
        case IR_CMPNE:
        case IR_CALL:
            return i->dst;
        default:
            return -1;
    }
}

static void regalloc(IrFn *fn) {
    int n = 0;
    for (Instr *i = fn->head; i; i = i->next) n++;
    Instr **arr = malloc((size_t)n * sizeof(Instr *));
    if (n && !arr) { perror("malloc"); exit(1); }
    int idx = 0;
    for (Instr *i = fn->head; i; i = i->next) arr[idx++] = i;

    int nslots = fn->nslots;
    int *last_use = malloc((size_t)nslots * sizeof(int));
    int *def_idx  = malloc((size_t)nslots * sizeof(int));
    int *cross    = calloc((size_t)nslots, sizeof(int));
    if (nslots && (!last_use || !def_idx || !cross)) { perror("alloc"); exit(1); }
    for (int s = 0; s < nslots; s++) { last_use[s] = -1; def_idx[s] = -1; }

    int *call_ix = malloc((size_t)(n ? n : 1) * sizeof(int));
    int ncalls = 0;
    for (int j = 0; j < n; j++) if (arr[j]->op == IR_CALL) call_ix[ncalls++] = j;

    for (int j = n - 1; j >= 0; j--) {
        int uses[16];
        int nu = collect_uses(arr[j], uses);
        for (int u = 0; u < nu; u++) {
            if (last_use[uses[u]] == -1) last_use[uses[u]] = j;
        }
    }
    for (int j = 0; j < n; j++) {
        int dst = instr_dst(arr[j]);
        if (dst >= 0 && def_idx[dst] == -1) def_idx[dst] = j;
    }
    for (int s = 0; s < nslots; s++) {
        if (def_idx[s] < 0 || last_use[s] < 0) continue;
        for (int c = 0; c < ncalls; c++) {
            if (call_ix[c] > def_idx[s] && call_ix[c] < last_use[s]) {
                cross[s] = 1;
                break;
            }
        }
    }

    fn->reg_of   = malloc((size_t)nslots * sizeof(int));
    fn->last_use = last_use;
    for (int s = 0; s < nslots; s++) fn->reg_of[s] = -1;

    int free_mask = (1 << NREGS) - 1;
    int reg_slot[NREGS];
    for (int r = 0; r < NREGS; r++) reg_slot[r] = -1;

    for (int j = 0; j < n; j++) {
        Instr *i = arr[j];
        int dst = instr_dst(i);
        if (dst >= 0 && dst >= fn->nlocals && last_use[dst] != -1 && !cross[dst]) {
            int r = -1;
            for (int rr = 0; rr < NREGS; rr++) if (free_mask & (1 << rr)) { r = rr; break; }
            if (r >= 0) {
                fn->reg_of[dst]  = r;
                reg_slot[r]      = dst;
                free_mask       &= ~(1 << r);
            }
        }
        int uses[16];
        int nu = collect_uses(i, uses);
        for (int u = 0; u < nu; u++) {
            int s = uses[u];
            if (last_use[s] == j) {
                int r = fn->reg_of[s];
                if (r >= 0) {
                    free_mask  |= (1 << r);
                    reg_slot[r] = -1;
                }
            }
        }
    }

    free(arr);
    free(def_idx);
    free(cross);
    free(call_ix);
}
IrFn *lower(Program *prog) {
    IrFn *head = NULL, *tail = NULL;
    int shared_label = 0;
    for (Func *f = prog->funcs; f; f = f->next) {
        IrFn *fn = lower_one(f, &shared_label);
        regalloc(fn);
        if (!head) head = fn; else tail->next = fn;
        tail = fn;
    }
    return head;
}
