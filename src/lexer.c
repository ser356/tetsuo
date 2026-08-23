#include "lexer.h"

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void die_lex(int line, const char *msg) {
    fprintf(stderr, "lexer: linea %d: %s\n", line, msg);
    exit(1);
}

void lex_init(Lexer *lx, const char *src) {
    lx->src  = src;
    lx->p    = src;
    lx->line = 1;
}

static void skip_ws(Lexer *lx) {
    for (;;) {
        char c = *lx->p;
        if (c == 0) return;
        if (c == '\n') { lx->line++; lx->p++; continue; }
        if (isspace((unsigned char)c)) { lx->p++; continue; }
        if (c == '/' && lx->p[1] == '/') {
            while (*lx->p && *lx->p != '\n') lx->p++;
            continue;
        }
        return;
    }
}

static int is_ident_start(int c) { return isalpha(c) || c == '_'; }
static int is_ident_cont(int c)  { return isalnum(c) || c == '_'; }

static int kw_match(const char *s, size_t n, const char *kw) {
    size_t k = strlen(kw);
    return n == k && memcmp(s, kw, k) == 0;
}

Tok lex_next(Lexer *lx) {
    skip_ws(lx);
    Tok t = {0};
    t.line  = lx->line;
    t.start = lx->p;

    if (!*lx->p) { t.kind = TK_EOF; return t; }

    char c = *lx->p;

    if (isdigit((unsigned char)c)) {
        int base = 10;
        if (c == '0' && (lx->p[1] == 'x' || lx->p[1] == 'X')) {
            base = 16;
            lx->p += 2;
        }
        uint64_t v = 0;
        int digits = 0;
        for (;;) {
            char q = *lx->p;
            int d;
            if (base == 16) {
                if      (isdigit((unsigned char)q))       d = q - '0';
                else if (q >= 'a' && q <= 'f')            d = q - 'a' + 10;
                else if (q >= 'A' && q <= 'F')            d = q - 'A' + 10;
                else break;
            } else {
                if (isdigit((unsigned char)q))            d = q - '0';
                else break;
            }
            v = v * (uint64_t)base + (uint64_t)d;
            digits++;
            lx->p++;
        }
        if (!digits) die_lex(t.line, "literal numerico sin digitos");
        t.kind = TK_NUM;
        t.ival = v;
        t.len  = (size_t)(lx->p - t.start);
        return t;
    }

    if (is_ident_start((unsigned char)c)) {
        const char *s = lx->p;
        while (is_ident_cont((unsigned char)*lx->p)) lx->p++;
        size_t n = (size_t)(lx->p - s);
        t.start = s;
        t.len   = n;
        if (kw_match(s, n, "fn"))   { t.kind = TK_FN;   return t; }
        if (kw_match(s, n, "as"))   { t.kind = TK_AS;   return t; }
        if (kw_match(s, n, "mut"))  { t.kind = TK_MUT;  return t; }
        if (kw_match(s, n, "loop")) { t.kind = TK_LOOP; return t; }
        t.kind = TK_IDENT;
        return t;
    }

    lx->p++;
    t.len = 1;
    switch (c) {
        case '(': t.kind = TK_LPAREN; return t;
        case ')': t.kind = TK_RPAREN; return t;
        case '{': t.kind = TK_LBRACE; return t;
        case '}': t.kind = TK_RBRACE; return t;
        case '*': t.kind = TK_STAR;   return t;
        case '=': t.kind = TK_EQ;     return t;
        case ';': t.kind = TK_SEMI;   return t;
        default: die_lex(t.line, "caracter inesperado");
    }
    return t;
}
