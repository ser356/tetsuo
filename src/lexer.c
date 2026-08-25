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
        while (is_ident_cont((unsigned char)*lx->p)) lx->p++;
        t.len = (size_t)(lx->p - t.start);
        if      (kw_match(t.start, t.len, "fun"))    t.kind = TK_FUN;
        else if (kw_match(t.start, t.len, "let"))    t.kind = TK_LET;
        else if (kw_match(t.start, t.len, "const"))  t.kind = TK_CONST;
        else if (kw_match(t.start, t.len, "return")) t.kind = TK_RETURN;
        else if (kw_match(t.start, t.len, "if"))     t.kind = TK_IF;
        else if (kw_match(t.start, t.len, "else"))   t.kind = TK_ELSE;
        else if (kw_match(t.start, t.len, "loop"))   t.kind = TK_LOOP;
        else if (kw_match(t.start, t.len, "while"))  t.kind = TK_WHILE;
        else if (kw_match(t.start, t.len, "break"))  t.kind = TK_BREAK;
        else if (kw_match(t.start, t.len, "struct")) t.kind = TK_STRUCT;
        else if (kw_match(t.start, t.len, "bss"))    t.kind = TK_BSS;
        else if (kw_match(t.start, t.len, "nil"))    t.kind = TK_NIL;
        else if (kw_match(t.start, t.len, "sizeof")) t.kind = TK_SIZEOF;
        else                                          t.kind = TK_IDENT;
        return t;
    }

    if (c == '-' && lx->p[1] == '>') {
        lx->p += 2;
        t.kind = TK_ARROW;
        t.len  = 2;
        return t;
    }
    if (c == '=' && lx->p[1] == '=') {
        lx->p += 2;
        t.kind = TK_EQEQ;
        t.len  = 2;
        return t;
    }
    if (c == '!' && lx->p[1] == '=') {
        lx->p += 2;
        t.kind = TK_BANGEQ;
        t.len  = 2;
        return t;
    }
    if (c == '<' && lx->p[1] == '=') {
        lx->p += 2; t.kind = TK_LE; t.len = 2; return t;
    }
    if (c == '>' && lx->p[1] == '=') {
        lx->p += 2; t.kind = TK_GE; t.len = 2; return t;
    }

    if (c == '\'') {
        lx->p++;
        size_t cap = 16, n = 0;
        char *buf = malloc(cap);
        if (!buf) { perror("malloc"); exit(1); }
        while (*lx->p && *lx->p != '\'') {
            char b;
            if (*lx->p == '\\') {
                lx->p++;
                switch (*lx->p) {
                    case 'n':  b = '\n'; lx->p++; break;
                    case 't':  b = '\t'; lx->p++; break;
                    case '\\': b = '\\'; lx->p++; break;
                    case '\'': b = '\''; lx->p++; break;
                    case '0':  b = '\0'; lx->p++; break;
                    case 'x': {
                        lx->p++;
                        int hv = 0;
                        for (int k = 0; k < 2; k++) {
                            char q = *lx->p;
                            int d;
                            if      (isdigit((unsigned char)q))       d = q - '0';
                            else if (q >= 'a' && q <= 'f')            d = q - 'a' + 10;
                            else if (q >= 'A' && q <= 'F')            d = q - 'A' + 10;
                            else { die_lex(t.line, "escape \\x requiere 2 hex"); return t; }
                            hv = hv * 16 + d;
                            lx->p++;
                        }
                        b = (char)hv;
                        break;
                    }
                    default: die_lex(t.line, "escape desconocido"); return t;
                }
            } else if (*lx->p == '\n') {
                die_lex(t.line, "salto de linea sin cerrar en literal de cadena");
                return t;
            } else {
                b = *lx->p;
                lx->p++;
            }
            if (n + 1 > cap) { cap *= 2; buf = realloc(buf, cap); if (!buf) { perror("realloc"); exit(1); } }
            buf[n++] = b;
        }
        if (*lx->p != '\'') { die_lex(t.line, "literal de cadena sin cerrar"); return t; }
        lx->p++;
        t.kind = TK_STRING;
        t.str_bytes = buf;
        t.str_len = n;
        t.len = (size_t)(lx->p - t.start);
        return t;
    }

    lx->p++;
    t.len = 1;
    switch (c) {
        case '(': t.kind = TK_LPAREN; return t;
        case ')': t.kind = TK_RPAREN; return t;
        case '{': t.kind = TK_LBRACE; return t;
        case '}': t.kind = TK_RBRACE; return t;
        case '[': t.kind = TK_LBRACK; return t;
        case ']': t.kind = TK_RBRACK; return t;
        case '*': t.kind = TK_STAR;   return t;
        case '+': t.kind = TK_PLUS;   return t;
        case '-': t.kind = TK_MINUS;  return t;
        case '/': t.kind = TK_SLASH;  return t;
        case '&': t.kind = TK_AMP;    return t;
        case '|': t.kind = TK_PIPE;   return t;
        case '^': t.kind = TK_CARET;  return t;
        case '=': t.kind = TK_EQ;     return t;
        case ';': t.kind = TK_SEMI;   return t;
        case ',': t.kind = TK_COMMA;  return t;
        case ':': t.kind = TK_COLON;  return t;
        case '.': t.kind = TK_DOT;    return t;
        case '@': t.kind = TK_AT;     return t;
        case '<': t.kind = TK_LT;     return t;
        case '>': t.kind = TK_GT;     return t;
        default:  die_lex(t.line, "caracter inesperado");
    }
    return t;
}

static const char *KIND_NAMES[] = {
    "EOF",
    "FUN","LET","CONST","RETURN","IF","ELSE","LOOP","WHILE","BREAK","STRUCT","BSS",
    "NIL","SIZEOF",
    "IDENT","NUM","STRING",
    "LPAREN","RPAREN","LBRACE","RBRACE","LBRACK","RBRACK",
    "STAR","PLUS","MINUS","SLASH",
    "AMP","PIPE","CARET",
    "EQ","EQEQ","BANGEQ",
    "LT","LE","GT","GE",
    "SEMI","COMMA","COLON","DOT",
    "ARROW","AT",
};

void dump_tokens(FILE *out, const char *src) {
    Lexer lx;
    lex_init(&lx, src);
    const char *cursor = src;
    const char *line_start = src;
    for (;;) {
        Tok t = lex_next(&lx);
        while (cursor < t.start) {
            if (*cursor == '\n') line_start = cursor + 1;
            cursor++;
        }
        int col = (int)(t.start - line_start) + 1;
        fprintf(out, "%d %d %s", t.line, col, KIND_NAMES[t.kind]);
        if (t.kind == TK_IDENT) {
            fprintf(out, " %.*s", (int)t.len, t.start);
        } else if (t.kind == TK_NUM) {
            fprintf(out, " %llu", (unsigned long long)t.ival);
        } else if (t.kind == TK_STRING) {
            fputs(" \"", out);
            for (size_t k = 0; k < t.str_len; k++) {
                unsigned char c = (unsigned char)t.str_bytes[k];
                if (c == '\\' || c == '"') fprintf(out, "\\%c", c);
                else if (c == '\n') fputs("\\n", out);
                else if (c == '\t') fputs("\\t", out);
                else if (c >= 32 && c < 127) fputc(c, out);
                else fprintf(out, "\\x%02x", c);
            }
            fputc('"', out);
        }
        fputc('\n', out);
        if (t.kind == TK_EOF) break;
    }
}
