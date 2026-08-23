#pragma once
#include "parser.h"
#include <stdint.h>

typedef enum {
    IR_MOVI,
    IR_STRB,
    IR_LABEL,
    IR_JMP,
} IrOp;

typedef struct Instr {
    IrOp        op;
    int         dst;
    int         src;
    int         addr;
    uint64_t    imm;
    int         label;
    struct Instr *next;
} Instr;

typedef struct {
    const char *name;
    Instr      *head;
} IrFn;

IrFn *lower(Func *f);
