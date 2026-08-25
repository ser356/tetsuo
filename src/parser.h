#pragma once
#include "lexer.h"
#include <stdint.h>

typedef enum {
    T_U8, T_U32, T_U64, T_PTR, T_STR, T_STRUCT,
} PrimType;

struct StructDecl;

typedef struct Type {
    PrimType     kind;
    struct Type *inner;
    struct StructDecl *decl;
} Type;

int type_width(const Type *t);

typedef enum {
    OP_ADD, OP_SUB, OP_MUL, OP_DIV,
    OP_AND, OP_OR, OP_XOR,
} BinOpKind;

typedef enum {
    EX_INT,
    EX_VAR,
    EX_CALL,
    EX_DEREF,
    EX_BIN,
    EX_EQ,
    EX_NE,
    EX_LT,
    EX_LE,
    EX_GT,
    EX_GE,
    EX_STRLIT,
    EX_ADDR,
    EX_EXTERN,
} ExprKind;

struct ConstItem;

typedef struct Expr {
    ExprKind    kind;
    Type       *type;

    uint64_t    ival;

    int         var_index;

    char        *callee;
    struct Expr **args;
    int         nargs;

    struct Expr *inner;

    BinOpKind   op;
    struct Expr *lhs;
    struct Expr *rhs;

    int         str_id;
    char        *str_bytes;
    size_t      str_len;

    char        *label_name;
} Expr;

typedef enum {
    ST_LET,
    ST_STORE,
    ST_ASSIGN,
    ST_LOOP,
    ST_WHILE,
    ST_IF,
    ST_BREAK,
    ST_RETURN,
    ST_EXPR,
} StmtKind;

typedef struct Stmt {
    StmtKind    kind;

    int         let_local;
    Expr        *let_init;

    Expr        *store_ptr;
    Expr        *store_val;

    int         assign_local;
    Expr        *assign_val;

    Expr        *cond;

    Expr        *ret_val;

    Expr        *expr;

    struct Stmt *body;
    struct Stmt *else_body;

    struct Stmt *next;
} Stmt;

typedef struct Local {
    char *name;
    Type *type;
} Local;

typedef struct Func {
    char        *name;
    Local       *locals;
    int         nlocals;
    int         nparams;
    Type        *ret_type;
    Stmt        *body;
    struct Func *next;
} Func;

typedef struct ConstItem {
    char             *name;
    Type             *type;
    uint64_t         value;
    struct ConstItem *next;
} ConstItem;

typedef struct Program {
    ConstItem *consts;
    Func      *funcs;
    struct StrLit *strs;
    int       nstrs;
    struct StructDecl *structs;
    struct BssItem *bsses;
} Program;

typedef struct Field {
    char *name;
    Type *type;
} Field;

typedef struct StructDecl {
    char  *name;
    Field *fields;
    int    nfields;
    struct StructDecl *next;
} StructDecl;

typedef struct BssItem {
    char           *name;
    uint64_t       size;
    struct BssItem *next;
} BssItem;

typedef struct StrLit {
    int       id;
    char      *bytes;
    size_t    len;
    struct StrLit *next;
} StrLit;

Program *parse(const char *src);
Type    *mk_ptr(Type *inner);
Type    *mk_prim(PrimType k);

#include <stdio.h>
void dump_ast(FILE *out, Program *prog);
