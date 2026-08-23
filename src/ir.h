#pragma once
#include "parser.h"
#include <stdint.h>

typedef enum {
    IR_MOVI,
    IR_STRB,
    IR_LABEL,
    IR_JMP,
    IR_CALL,
} IrOp;

typedef struct Instr {
    IrOp        op;
    int         dst;
    int         src;
    int         addr;
    uint64_t    imm;
    int         label;
    char        *callee;
    int         nargs;
    struct Instr *next;
} Instr;

typedef struct IrFn {
    char        *name;
    int         nparams;
    Instr       *head;
    struct IrFn *next;
} IrFn;

IrFn *lower(Func *funcs);
