#include "parser.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Type *mk_prim(PrimType k) {
    Type *t = calloc(1, sizeof(*t));
    if (!t) { perror("calloc"); exit(1); }
    t->kind = k;
    return t;
}

Type *mk_ptr(Type *inner) {
    Type *t = calloc(1, sizeof(*t));
    if (!t) { perror("calloc"); exit(1); }
    t->kind = T_PTR;
    t->inner = inner;
    return t;
}

int type_width(const Type *t) {
    switch (t->kind) {
        case T_U8:  return 1;
        case T_U32: return 4;
        case T_U64: return 8;
        case T_PTR: return 8;
        case T_STR: return 16;
        case T_STRUCT: return t->decl ? t->decl->nfields * 8 : 8;
    }
    return 8;
}

typedef struct {
    Lexer     lx;
    Tok       cur;
    Program   *prog;
    Func      *cur_fn;
} P;

static void pdie(P *p, const char *msg) {
    fprintf(stderr, "parser: linea %d: %s\n", p->cur.line, msg);
    exit(1);
}

static void advance(P *p) { p->cur = lex_next(&p->lx); }

static int accept(P *p, TokKind k) {
    if (p->cur.kind == k) { advance(p); return 1; }
    return 0;
}

static void expect(P *p, TokKind k, const char *what) {
    if (!accept(p, k)) pdie(p, what);
}

static char *dup_slice(const char *s, size_t n) {
    char *r = malloc(n + 1);
    if (!r) { perror("malloc"); exit(1); }
    memcpy(r, s, n);
    r[n] = 0;
    return r;
}

static Expr *mk_expr(ExprKind k) {
    Expr *e = calloc(1, sizeof(*e));
    if (!e) { perror("calloc"); exit(1); }
    e->kind = k;
    return e;
}

static Stmt *mk_stmt(StmtKind k) {
    Stmt *s = calloc(1, sizeof(*s));
    if (!s) { perror("calloc"); exit(1); }
    s->kind = k;
    return s;
}

static void skip_semi(P *p) {
    while (accept(p, TK_SEMI)) {}
}

static int lookup_local(Func *f, const char *s, size_t n) {
    for (int i = 0; i < f->nlocals; i++) {
        size_t k = strlen(f->locals[i].name);
        if (k == n && memcmp(s, f->locals[i].name, k) == 0) return i;
    }
    return -1;
}

static ConstItem *lookup_const(Program *prog, const char *s, size_t n) {
    for (ConstItem *c = prog->consts; c; c = c->next) {
        size_t k = strlen(c->name);
        if (k == n && memcmp(s, c->name, k) == 0) return c;
    }
    return NULL;
}

static int add_local(Func *f, char *name, Type *type) {
    f->locals = realloc(f->locals, (size_t)(f->nlocals + 1) * sizeof(Local));
    if (!f->locals) { perror("realloc"); exit(1); }
    f->locals[f->nlocals].name = name;
    f->locals[f->nlocals].type = type;
    int idx = f->nlocals++;
    int extras = 0;
    if (type->kind == T_STR) extras = 1;
    else if (type->kind == T_STRUCT && type->decl) extras = type->decl->nfields - 1;
    for (int k = 0; k < extras; k++) {
        f->locals = realloc(f->locals, (size_t)(f->nlocals + 1) * sizeof(Local));
        if (!f->locals) { perror("realloc"); exit(1); }
        f->locals[f->nlocals].name = "";
        Type *slot_ty = mk_prim(T_U64);
        if (type->kind == T_STRUCT) {
            slot_ty = type->decl->fields[k + 1].type;
        }
        f->locals[f->nlocals].type = slot_ty;
        f->nlocals++;
    }
    return idx;
}

static StructDecl *lookup_struct(Program *prog, const char *s, size_t n) {
    for (StructDecl *d = prog->structs; d; d = d->next) {
        size_t k = strlen(d->name);
        if (k == n && memcmp(s, d->name, k) == 0) return d;
    }
    return NULL;
}

static Type *parse_type(P *p) {
    if (accept(p, TK_STAR)) {
        Type *inner = parse_type(p);
        return mk_ptr(inner);
    }
    if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba tipo");
    Type *t = NULL;
    if      (p->cur.len == 2 && memcmp(p->cur.start, "u8",  2) == 0) t = mk_prim(T_U8);
    else if (p->cur.len == 3 && memcmp(p->cur.start, "u32", 3) == 0) t = mk_prim(T_U32);
    else if (p->cur.len == 3 && memcmp(p->cur.start, "u64", 3) == 0) t = mk_prim(T_U64);
    else if (p->cur.len == 3 && memcmp(p->cur.start, "str", 3) == 0) t = mk_prim(T_STR);
    else {
        StructDecl *d = lookup_struct(p->prog, p->cur.start, p->cur.len);
        if (!d) pdie(p, "tipo desconocido");
        t = mk_prim(T_STRUCT);
        t->decl = d;
    }
    advance(p);
    return t;
}

static Expr *parse_expr(P *p, int min_prec);

static Expr *parse_call_args(P *p, char *callee_name) {
    Expr *e = mk_expr(EX_CALL);
    e->callee = callee_name;
    int cap = 0;
    if (p->cur.kind != TK_RPAREN) {
        for (;;) {
            Expr *a = parse_expr(p, 0);
            if (e->nargs == cap) {
                cap = cap ? cap * 2 : 4;
                e->args = realloc(e->args, (size_t)cap * sizeof(Expr *));
                if (!e->args) { perror("realloc"); exit(1); }
            }
            e->args[e->nargs++] = a;
            if (accept(p, TK_COMMA)) continue;
            break;
        }
    }
    if (e->nargs > 8) pdie(p, "hito 3: maximo 8 argumentos");
    expect(p, TK_RPAREN, "se esperaba ')'");
    if (strcmp(callee_name, "syscall") == 0) {
        if (e->nargs < 1) pdie(p, "syscall requiere al menos 1 argumento (numero)");
        e->type = mk_prim(T_U64);
    } else {
        e->type = mk_prim(T_U32);
    }
    return e;
}

static Expr *parse_primary(P *p) {
    if (p->cur.kind == TK_NUM) {
        Expr *e = mk_expr(EX_INT);
        e->ival = p->cur.ival;
        e->type = mk_prim(T_U64);
        advance(p);
        return e;
    }
    if (p->cur.kind == TK_STRING) {
        Expr *e = mk_expr(EX_STRLIT);
        e->str_bytes = p->cur.str_bytes;
        e->str_len   = p->cur.str_len;
        e->str_id    = p->prog->nstrs++;
        StrLit *lit = calloc(1, sizeof(*lit));
        if (!lit) { perror("calloc"); exit(1); }
        lit->id = e->str_id;
        lit->bytes = e->str_bytes;
        lit->len   = e->str_len;
        StrLit **tail = &p->prog->strs;
        while (*tail) tail = &(*tail)->next;
        *tail = lit;
        e->type = mk_prim(T_STR);
        advance(p);
        return e;
    }
    if (accept(p, TK_LPAREN)) {
        Expr *e = parse_expr(p, 0);
        expect(p, TK_RPAREN, "se esperaba ')'");
        return e;
    }
    if (p->cur.kind == TK_IDENT) {
        char *name = dup_slice(p->cur.start, p->cur.len);
        size_t nlen = p->cur.len;
        const char *nstart = p->cur.start;
        advance(p);
        if (accept(p, TK_LPAREN)) {
            return parse_call_args(p, name);
        }
        int idx = lookup_local(p->cur_fn, nstart, nlen);
        if (idx >= 0) {
            Expr *e = mk_expr(EX_VAR);
            e->var_index = idx;
            e->type = p->cur_fn->locals[idx].type;
            free(name);
            return e;
        }
        ConstItem *ci = lookup_const(p->prog, nstart, nlen);
        if (ci) {
            Expr *e = mk_expr(EX_INT);
            e->ival = ci->value;
            e->type = ci->type;
            free(name);
            return e;
        }
        pdie(p, "identificador no declarado");
    }
    pdie(p, "expresion no reconocida");
    return NULL;
}

static Expr *parse_postfix(P *p) {
    Expr *e = parse_primary(p);
    for (;;) {
        if (accept(p, TK_DOT)) {
            if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de campo");
            const char *fname = p->cur.start;
            size_t flen = p->cur.len;
            advance(p);
            if (e->type && e->type->kind == T_STR) {
                if (e->kind != EX_VAR) pdie(p, "campo de str solo sobre locales");
                int idx = e->var_index;
                if (flen == 3 && memcmp(fname, "ptr", 3) == 0) {
                    Expr *n = mk_expr(EX_VAR);
                    n->var_index = idx;
                    n->type = mk_ptr(mk_prim(T_U8));
                    e = n;
                    continue;
                }
                if (flen == 3 && memcmp(fname, "len", 3) == 0) {
                    Expr *n = mk_expr(EX_VAR);
                    n->var_index = idx + 1;
                    n->type = mk_prim(T_U64);
                    e = n;
                    continue;
                }
                pdie(p, "campo desconocido sobre str");
            }
            if (e->type && e->type->kind == T_STRUCT && e->type->decl) {
                if (e->kind != EX_VAR) pdie(p, "campo de struct solo sobre locales");
                StructDecl *d = e->type->decl;
                int fi = -1;
                for (int k = 0; k < d->nfields; k++) {
                    size_t nn = strlen(d->fields[k].name);
                    if (nn == flen && memcmp(fname, d->fields[k].name, nn) == 0) { fi = k; break; }
                }
                if (fi < 0) pdie(p, "campo desconocido en struct");
                Expr *n = mk_expr(EX_VAR);
                n->var_index = e->var_index + fi;
                n->type = d->fields[fi].type;
                e = n;
                continue;
            }
            if (e->type && e->type->kind == T_PTR && e->type->inner && e->type->inner->kind == T_STRUCT) {
                StructDecl *d = e->type->inner->decl;
                int fi = -1;
                for (int k = 0; k < d->nfields; k++) {
                    size_t nn = strlen(d->fields[k].name);
                    if (nn == flen && memcmp(fname, d->fields[k].name, nn) == 0) { fi = k; break; }
                }
                if (fi < 0) pdie(p, "campo desconocido en struct");
                Type *ft = d->fields[fi].type;
                Expr *off_e = mk_expr(EX_INT);
                off_e->ival = (uint64_t)(8 * fi);
                off_e->type = mk_prim(T_U64);
                Expr *ptr = mk_expr(EX_BIN);
                ptr->op = OP_ADD;
                ptr->lhs = e;
                ptr->rhs = off_e;
                ptr->type = mk_ptr(ft);
                Expr *d_e = mk_expr(EX_DEREF);
                d_e->inner = ptr;
                d_e->type = ft;
                e = d_e;
                continue;
            }
            pdie(p, "'.' solo sobre str, struct o *struct");
        }
        if (accept(p, TK_LBRACK)) {
            Expr *idx = parse_expr(p, 0);
            expect(p, TK_RBRACK, "se esperaba ']'");
            if (!e->type || e->type->kind != T_PTR)
                pdie(p, "indexacion '[]' solo sobre *T");
            int sz = type_width(e->type->inner);
            Expr *scaled = idx;
            if (sz != 1) {
                Expr *sz_e = mk_expr(EX_INT);
                sz_e->ival = (uint64_t)sz;
                sz_e->type = mk_prim(T_U64);
                Expr *m = mk_expr(EX_BIN);
                m->op = OP_MUL;
                m->lhs = idx;
                m->rhs = sz_e;
                m->type = mk_prim(T_U64);
                scaled = m;
            }
            Expr *ptr = mk_expr(EX_BIN);
            ptr->op = OP_ADD;
            ptr->lhs = e;
            ptr->rhs = scaled;
            ptr->type = e->type;
            Expr *d = mk_expr(EX_DEREF);
            d->inner = ptr;
            d->type = e->type->inner;
            e = d;
            continue;
        }
        break;
    }
    return e;
}

static Expr *parse_unary(P *p) {
    if (accept(p, TK_AT)) {
        Expr *inner = parse_unary(p);
        if (!inner->type || inner->type->kind != T_PTR)
            pdie(p, "operador '@' requiere un puntero");
        Expr *e = mk_expr(EX_DEREF);
        e->inner = inner;
        e->type  = inner->type->inner;
        return e;
    }
    if (accept(p, TK_AMP)) {
        Expr *inner = parse_unary(p);
        if (inner->kind != EX_VAR) pdie(p, "'&' solo sobre variable local");
        Expr *e = mk_expr(EX_ADDR);
        e->inner = inner;
        e->type = mk_ptr(inner->type);
        return e;
    }
    return parse_postfix(p);
}

static int op_prec(TokKind k) {
    switch (k) {
        case TK_EQEQ:
        case TK_BANGEQ: return 1;
        case TK_PIPE:  return 2;
        case TK_CARET: return 3;
        case TK_AMP:   return 4;
        case TK_PLUS:
        case TK_MINUS: return 5;
        case TK_STAR:
        case TK_SLASH: return 6;
        default:       return -1;
    }
}

static BinOpKind tok_to_binop(TokKind k) {
    switch (k) {
        case TK_PLUS:  return OP_ADD;
        case TK_MINUS: return OP_SUB;
        case TK_STAR:  return OP_MUL;
        case TK_SLASH: return OP_DIV;
        case TK_AMP:   return OP_AND;
        case TK_PIPE:  return OP_OR;
        case TK_CARET: return OP_XOR;
        default: return OP_ADD;
    }
}

static Expr *parse_expr(P *p, int min_prec) {
    Expr *lhs = parse_unary(p);
    for (;;) {
        int pr = op_prec(p->cur.kind);
        if (pr < 0 || pr < min_prec) break;
        TokKind op = p->cur.kind;
        advance(p);
        Expr *rhs = parse_expr(p, pr + 1);
        Expr *n;
        if (op == TK_EQEQ) {
            n = mk_expr(EX_EQ);
        } else if (op == TK_BANGEQ) {
            n = mk_expr(EX_NE);
        } else {
            n = mk_expr(EX_BIN);
            n->op = tok_to_binop(op);
        }
        n->lhs = lhs;
        n->rhs = rhs;
        n->type = (op == TK_EQEQ || op == TK_BANGEQ) ? mk_prim(T_U32) : lhs->type;
        lhs = n;
    }
    return lhs;
}

static Stmt *parse_block(P *p);

static Stmt *parse_stmt(P *p) {
    if (accept(p, TK_LET)) {
        if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre tras 'let'");
        char *name = dup_slice(p->cur.start, p->cur.len);
        advance(p);
        expect(p, TK_COLON, "hito 3: 'let' requiere anotacion ': tipo'");
        Type *ty = parse_type(p);
        Expr *init = NULL;
        if (accept(p, TK_EQ)) {
            init = parse_expr(p, 0);
        }
        skip_semi(p);
        Stmt *s = mk_stmt(ST_LET);
        s->let_local = add_local(p->cur_fn, name, ty);
        s->let_init = init;
        return s;
    }
    if (accept(p, TK_RETURN)) {
        Stmt *s = mk_stmt(ST_RETURN);
        s->ret_val = parse_expr(p, 0);
        skip_semi(p);
        return s;
    }
    if (accept(p, TK_IF)) {
        Stmt *s = mk_stmt(ST_IF);
        s->cond = parse_expr(p, 0);
        s->body = parse_block(p);
        if (accept(p, TK_ELSE)) s->else_body = parse_block(p);
        return s;
    }
    if (accept(p, TK_LOOP)) {
        Stmt *s = mk_stmt(ST_LOOP);
        s->body = parse_block(p);
        return s;
    }
    if (accept(p, TK_WHILE)) {
        Stmt *s = mk_stmt(ST_WHILE);
        s->cond = parse_expr(p, 0);
        s->body = parse_block(p);
        return s;
    }
    if (accept(p, TK_BREAK)) {
        skip_semi(p);
        return mk_stmt(ST_BREAK);
    }
    Expr *lhs = parse_expr(p, 0);
    if (accept(p, TK_EQ)) {
        Expr *v = parse_expr(p, 0);
        skip_semi(p);
        if (lhs->kind == EX_VAR) {
            Stmt *s = mk_stmt(ST_ASSIGN);
            s->assign_local = lhs->var_index;
            s->assign_val = v;
            return s;
        }
        if (lhs->kind == EX_DEREF) {
            Stmt *s = mk_stmt(ST_STORE);
            s->store_ptr = lhs->inner;
            s->store_val = v;
            return s;
        }
        pdie(p, "lado izquierdo no es lvalue");
    }
    skip_semi(p);
    Stmt *s = mk_stmt(ST_EXPR);
    s->expr = lhs;
    return s;
}

static Stmt *parse_block(P *p) {
    expect(p, TK_LBRACE, "se esperaba '{'");
    Stmt *head = NULL, *tail = NULL;
    while (p->cur.kind != TK_RBRACE && p->cur.kind != TK_EOF) {
        Stmt *s = parse_stmt(p);
        if (!head) head = s; else tail->next = s;
        tail = s;
        skip_semi(p);
    }
    expect(p, TK_RBRACE, "se esperaba '}'");
    return head;
}

static Func *parse_func(P *p) {
    expect(p, TK_FUN, "se esperaba 'fun'");
    if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de funcion");
    char *name = dup_slice(p->cur.start, p->cur.len);
    advance(p);
    expect(p, TK_LPAREN, "se esperaba '('");

    Func *f = calloc(1, sizeof(*f));
    if (!f) { perror("calloc"); exit(1); }
    f->name = name;

    if (p->cur.kind != TK_RPAREN) {
        for (;;) {
            if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de parametro");
            char *pname = dup_slice(p->cur.start, p->cur.len);
            advance(p);
            expect(p, TK_COLON, "se esperaba ':' tras nombre de parametro");
            Type *ty = parse_type(p);
            add_local(f, pname, ty);
            f->nparams += (ty->kind == T_STR) ? 2 : 1;
            if (accept(p, TK_COMMA)) continue;
            break;
        }
    }
    if (f->nparams > 8) pdie(p, "hito 3: maximo 8 parametros");
    expect(p, TK_RPAREN, "se esperaba ')'");

    if (accept(p, TK_ARROW)) f->ret_type = parse_type(p);

    p->cur_fn = f;
    f->body = parse_block(p);
    p->cur_fn = NULL;

    return f;
}

static void parse_const(P *p) {
    expect(p, TK_CONST, "se esperaba 'const'");
    if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de const");
    char *name = dup_slice(p->cur.start, p->cur.len);
    advance(p);
    expect(p, TK_COLON, "se esperaba ':' tras nombre de const");
    Type *ty = parse_type(p);
    expect(p, TK_EQ, "se esperaba '='");
    if (p->cur.kind != TK_NUM) pdie(p, "hito 3: const solo admite literal entero");
    uint64_t v = p->cur.ival;
    advance(p);
    skip_semi(p);

    ConstItem *c = calloc(1, sizeof(*c));
    if (!c) { perror("calloc"); exit(1); }
    c->name = name;
    c->type = ty;
    c->value = v;

    ConstItem **tail = &p->prog->consts;
    while (*tail) tail = &(*tail)->next;
    *tail = c;
}

static void parse_struct_decl(P *p) {
    expect(p, TK_STRUCT, "se esperaba 'struct'");
    if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de struct");
    char *name = dup_slice(p->cur.start, p->cur.len);
    advance(p);
    expect(p, TK_LBRACE, "se esperaba '{'");

    StructDecl *d = calloc(1, sizeof(*d));
    if (!d) { perror("calloc"); exit(1); }
    d->name = name;

    int cap = 0;
    while (p->cur.kind != TK_RBRACE && p->cur.kind != TK_EOF) {
        if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de campo");
        char *fname = dup_slice(p->cur.start, p->cur.len);
        advance(p);
        expect(p, TK_COLON, "se esperaba ':' tras nombre de campo");
        Type *ty = parse_type(p);
        if (d->nfields == cap) {
            cap = cap ? cap * 2 : 4;
            d->fields = realloc(d->fields, (size_t)cap * sizeof(Field));
            if (!d->fields) { perror("realloc"); exit(1); }
        }
        d->fields[d->nfields].name = fname;
        d->fields[d->nfields].type = ty;
        d->nfields++;
        accept(p, TK_COMMA);
        skip_semi(p);
    }
    expect(p, TK_RBRACE, "se esperaba '}'");

    StructDecl **tail = &p->prog->structs;
    while (*tail) tail = &(*tail)->next;
    *tail = d;
}

Program *parse(const char *src) {
    P p = {0};
    lex_init(&p.lx, src);
    advance(&p);
    p.prog = calloc(1, sizeof(*p.prog));
    if (!p.prog) { perror("calloc"); exit(1); }

    Func *ftail = NULL;
    while (p.cur.kind != TK_EOF) {
        skip_semi(&p);
        if (p.cur.kind == TK_EOF) break;
        if (p.cur.kind == TK_CONST) {
            parse_const(&p);
            continue;
        }
        if (p.cur.kind == TK_STRUCT) {
            parse_struct_decl(&p);
            continue;
        }
        Func *f = parse_func(&p);
        if (!p.prog->funcs) p.prog->funcs = f; else ftail->next = f;
        ftail = f;
    }
    if (!p.prog->funcs) { fprintf(stderr, "parser: sin funciones\n"); exit(1); }
    return p.prog;
}
