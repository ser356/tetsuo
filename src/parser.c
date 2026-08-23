#include "parser.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    Lexer lx;
    Tok   cur;
    Func  *cur_fn;
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

static int lookup_param(Func *f, const char *s, size_t n) {
    for (int i = 0; i < f->nparams; i++) {
        size_t k = strlen(f->params[i].name);
        if (k == n && memcmp(s, f->params[i].name, k) == 0) return i;
    }
    return -1;
}

static void expect_type_u8(P *p) {
    if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba tipo");
    if (!(p->cur.len == 2 && memcmp(p->cur.start, "u8", 2) == 0))
        pdie(p, "hito 2: solo se admite u8");
    advance(p);
}

static Expr *parse_unary(P *p);

static Expr *parse_primary(P *p) {
    if (p->cur.kind == TK_NUM) {
        Expr *e = mk_expr(EX_INT);
        e->ival = p->cur.ival;
        advance(p);
        return e;
    }
    if (p->cur.kind == TK_IDENT) {
        int idx = lookup_param(p->cur_fn, p->cur.start, p->cur.len);
        if (idx < 0) pdie(p, "identificador no declarado");
        Expr *e = mk_expr(EX_VAR);
        e->var_index = idx;
        advance(p);
        return e;
    }
    if (accept(p, TK_LPAREN)) {
        Expr *e = parse_unary(p);
        if (accept(p, TK_AS)) {
            expect(p, TK_STAR, "se esperaba '*' tras 'as'");
            expect(p, TK_MUT,  "solo se admite '*mut'");
            expect_type_u8(p);
            Expr *c = mk_expr(EX_CAST);
            c->inner   = e;
            c->cast_to = TY_PTR_MUT_U8;
            e = c;
        }
        expect(p, TK_RPAREN, "se esperaba ')'");
        return e;
    }
    pdie(p, "expresion no reconocida");
    return NULL;
}

static Expr *parse_unary(P *p) {
    if (accept(p, TK_STAR)) {
        Expr *inner = parse_unary(p);
        Expr *e = mk_expr(EX_DEREF);
        e->inner = inner;
        return e;
    }
    return parse_primary(p);
}

static Stmt *parse_call_stmt(P *p) {
    Stmt *s = calloc(1, sizeof(*s));
    if (!s) { perror("calloc"); exit(1); }
    s->kind   = ST_CALL;
    s->callee = dup_slice(p->cur.start, p->cur.len);
    advance(p);
    expect(p, TK_LPAREN, "se esperaba '(' en llamada");

    int cap = 0;
    if (p->cur.kind != TK_RPAREN) {
        for (;;) {
            Expr *e = parse_unary(p);
            if (s->nargs == cap) {
                cap = cap ? cap * 2 : 4;
                s->args = realloc(s->args, (size_t)cap * sizeof(Expr *));
                if (!s->args) { perror("realloc"); exit(1); }
            }
            s->args[s->nargs++] = e;
            if (accept(p, TK_COMMA)) continue;
            break;
        }
    }
    if (s->nargs > 8) pdie(p, "hito 2: maximo 8 argumentos");
    expect(p, TK_RPAREN, "se esperaba ')'");
    expect(p, TK_SEMI,   "se esperaba ';'");
    return s;
}

static Stmt *parse_stmt(P *p) {
    if (p->cur.kind == TK_LOOP) {
        Stmt *s = calloc(1, sizeof(*s));
        if (!s) { perror("calloc"); exit(1); }
        s->kind = ST_LOOP;
        advance(p);
        expect(p, TK_LBRACE, "se esperaba '{' tras 'loop'");
        expect(p, TK_RBRACE, "hito 2: cuerpo de loop vacio");
        return s;
    }
    if (p->cur.kind == TK_IDENT) return parse_call_stmt(p);
    if (p->cur.kind == TK_STAR) {
        Stmt *s = calloc(1, sizeof(*s));
        if (!s) { perror("calloc"); exit(1); }
        Expr *lhs = parse_unary(p);
        if (lhs->kind != EX_DEREF) pdie(p, "solo se admite asignacion via '*<ptr>'");
        expect(p, TK_EQ, "se esperaba '='");
        Expr *rhs = parse_unary(p);
        expect(p, TK_SEMI, "se esperaba ';'");
        s->kind    = ST_STORE;
        s->lhs_ptr = lhs->inner;
        s->rhs     = rhs;
        return s;
    }
    pdie(p, "sentencia no reconocida");
    return NULL;
}

static Func *parse_func(P *p) {
    expect(p, TK_FN, "se esperaba 'fn'");
    if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de funcion");
    char *name = dup_slice(p->cur.start, p->cur.len);
    advance(p);
    expect(p, TK_LPAREN, "se esperaba '('");

    Func *f = calloc(1, sizeof(*f));
    if (!f) { perror("calloc"); exit(1); }
    f->name = name;

    int cap = 0;
    if (p->cur.kind != TK_RPAREN) {
        for (;;) {
            if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba nombre de parametro");
            char *pname = dup_slice(p->cur.start, p->cur.len);
            advance(p);
            expect(p, TK_COLON, "se esperaba ':' tras nombre de parametro");
            expect_type_u8(p);
            if (f->nparams == cap) {
                cap = cap ? cap * 2 : 4;
                f->params = realloc(f->params, (size_t)cap * sizeof(Param));
                if (!f->params) { perror("realloc"); exit(1); }
            }
            f->params[f->nparams++].name = pname;
            if (accept(p, TK_COMMA)) continue;
            break;
        }
    }
    if (f->nparams > 8) pdie(p, "hito 2: maximo 8 parametros");
    expect(p, TK_RPAREN, "se esperaba ')'");
    expect(p, TK_LBRACE, "se esperaba '{'");

    p->cur_fn = f;
    Stmt *head = NULL, *tail = NULL;
    while (p->cur.kind != TK_RBRACE) {
        Stmt *s = parse_stmt(p);
        if (!head) head = s; else tail->next = s;
        tail = s;
    }
    expect(p, TK_RBRACE, "se esperaba '}'");
    p->cur_fn = NULL;

    f->body = head;
    return f;
}

Func *parse(const char *src) {
    P p = {0};
    lex_init(&p.lx, src);
    advance(&p);

    Func *head = NULL, *tail = NULL;
    while (p.cur.kind != TK_EOF) {
        Func *f = parse_func(&p);
        if (!head) head = f; else tail->next = f;
        tail = f;
    }
    if (!head) { fprintf(stderr, "parser: fuente vacio\n"); exit(1); }
    return head;
}
