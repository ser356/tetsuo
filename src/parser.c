#include "parser.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    Lexer lx;
    Tok   cur;
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

static Expr *mk_expr(ExprKind k) {
    Expr *e = calloc(1, sizeof(*e));
    if (!e) { perror("calloc"); exit(1); }
    e->kind = k;
    return e;
}

static char *dup_slice(const char *s, size_t n) {
    char *r = malloc(n + 1);
    if (!r) { perror("malloc"); exit(1); }
    memcpy(r, s, n);
    r[n] = 0;
    return r;
}

static Expr *parse_unary(P *p);

static Expr *parse_primary(P *p) {
    if (p->cur.kind == TK_NUM) {
        Expr *e = mk_expr(EX_INT);
        e->ival = p->cur.ival;
        advance(p);
        return e;
    }
    if (accept(p, TK_LPAREN)) {
        Expr *e = parse_unary(p);
        if (accept(p, TK_AS)) {
            expect(p, TK_STAR, "se esperaba '*' tras 'as'");
            expect(p, TK_MUT,  "solo se admite '*mut'");
            if (p->cur.kind != TK_IDENT) pdie(p, "se esperaba tipo tras '*mut'");
            if (!(p->cur.len == 2 && memcmp(p->cur.start, "u8", 2) == 0))
                pdie(p, "solo se admite u8");
            advance(p);
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

static Stmt *parse_stmt(P *p) {
    Stmt *s = calloc(1, sizeof(*s));
    if (!s) { perror("calloc"); exit(1); }
    if (accept(p, TK_LOOP)) {
        s->kind = ST_LOOP;
        expect(p, TK_LBRACE, "se esperaba '{' tras 'loop'");
        expect(p, TK_RBRACE, "hito 1: cuerpo de loop vacio");
        return s;
    }
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

Func *parse(const char *src) {
    P p = {0};
    lex_init(&p.lx, src);
    advance(&p);

    expect(&p, TK_FN, "se esperaba 'fn'");
    if (p.cur.kind != TK_IDENT) pdie(&p, "se esperaba nombre de funcion");
    char *name = dup_slice(p.cur.start, p.cur.len);
    advance(&p);
    expect(&p, TK_LPAREN, "se esperaba '('");
    expect(&p, TK_RPAREN, "hito 1: sin parametros");
    expect(&p, TK_LBRACE, "se esperaba '{'");

    Stmt *head = NULL, *tail = NULL;
    while (p.cur.kind != TK_RBRACE) {
        Stmt *s = parse_stmt(&p);
        if (!head) head = s; else tail->next = s;
        tail = s;
    }
    expect(&p, TK_RBRACE, "se esperaba '}'");
    expect(&p, TK_EOF,    "sobrante tras funcion");

    Func *f = calloc(1, sizeof(*f));
    if (!f) { perror("calloc"); exit(1); }
    f->name = name;
    f->body = head;
    return f;
}
