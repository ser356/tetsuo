#pragma once
#include <stddef.h>
#include <stdint.h>

typedef enum {
    TK_EOF,
    TK_FUN, TK_LET, TK_CONST, TK_RETURN, TK_IF, TK_ELSE, TK_LOOP, TK_WHILE, TK_BREAK, TK_STRUCT, TK_BSS,
    TK_IDENT,
    TK_NUM,
    TK_STRING,
    TK_LPAREN, TK_RPAREN, TK_LBRACE, TK_RBRACE, TK_LBRACK, TK_RBRACK,
    TK_STAR, TK_PLUS, TK_MINUS, TK_SLASH,
    TK_AMP, TK_PIPE, TK_CARET,
    TK_EQ, TK_EQEQ, TK_BANGEQ,
    TK_LT, TK_LE, TK_GT, TK_GE,
    TK_SEMI, TK_COMMA, TK_COLON, TK_DOT,
    TK_ARROW,
    TK_AT,
} TokKind;

typedef struct {
    TokKind    kind;
    const char *start;
    size_t     len;
    uint64_t   ival;
    char       *str_bytes;
    size_t     str_len;
    int        line;
} Tok;

typedef struct {
    const char *src;
    const char *p;
    int        line;
} Lexer;

void lex_init(Lexer *lx, const char *src);
Tok  lex_next(Lexer *lx);
