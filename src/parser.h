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
    EX_VAR,
} ExprKind;

typedef struct Expr {
    ExprKind    kind;
    uint64_t    ival;
    struct Expr *inner;
    TyKind      cast_to;
    int         var_index;
} Expr;

typedef enum {
    ST_STORE,
    ST_LOOP,
    ST_CALL,
} StmtKind;

typedef struct Stmt {
    StmtKind    kind;
    Expr        *lhs_ptr;
    Expr        *rhs;
    char        *callee;
    Expr        **args;
    int         nargs;
    struct Stmt *next;
} Stmt;

typedef struct Param {
    char *name;
} Param;

typedef struct Func {
    char        *name;
    Param       *params;
    int         nparams;
    Stmt        *body;
    struct Func *next;
} Func;

Func *parse(const char *src);
