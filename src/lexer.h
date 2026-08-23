#pragma once
#include <stddef.h>
#include <stdint.h>

typedef enum {
    TK_EOF,
    TK_FN, TK_AS, TK_MUT, TK_LOOP,
    TK_IDENT,
    TK_NUM,
    TK_LPAREN, TK_RPAREN, TK_LBRACE, TK_RBRACE,
    TK_STAR, TK_EQ, TK_SEMI,
} TokKind;

typedef struct {
    TokKind    kind;
    const char *start;
    size_t     len;
    uint64_t   ival;
    int        line;
} Tok;

typedef struct {
    const char *src;
    const char *p;
    int        line;
} Lexer;

void lex_init(Lexer *lx, const char *src);
Tok  lex_next(Lexer *lx);
