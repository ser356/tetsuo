#pragma once
#include "lexer.h"
#include <stdint.h>

typedef enum {
    TY_PTR_MUT_U8,
} TyKind;

typedef enum {
    EX_INT,
    EX_CAST,
    EX_DEREF,
} ExprKind;

typedef struct Expr {
    ExprKind    kind;
    uint64_t    ival;
    struct Expr *inner;
    TyKind      cast_to;
} Expr;

typedef enum {
    ST_STORE,
    ST_LOOP,
} StmtKind;

typedef struct Stmt {
    StmtKind    kind;
    Expr        *lhs_ptr;
    Expr        *rhs;
    struct Stmt *next;
} Stmt;

typedef struct {
    char *name;
    Stmt *body;
} Func;

Func *parse(const char *src);
