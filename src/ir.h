#pragma once
#include "parser.h"
#include <stdint.h>

typedef enum {
    IR_MOVI,
    IR_LABEL_ADDR,
    IR_ADDR_LOCAL,
    IR_LOAD_LOCAL,
    IR_STORE_LOCAL,
    IR_LOAD_MEM,
    IR_STORE_MEM,
    IR_BINOP,
    IR_CMPEQ,
    IR_CMPNE,
    IR_CMPLT,
    IR_CMPLE,
    IR_CMPGT,
    IR_CMPGE,
    IR_CALL,
    IR_RET,
    IR_JMP,
    IR_JZ,
    IR_LABEL,
} IrOp;

typedef struct Instr {
    IrOp        op;
    int         dst;
    int         a;
    int         b;
    int         local;
    int         width;
    uint64_t    imm;
    int         label;
    int         str_id;
    char        *label_name;
    BinOpKind   binop;
    char        *callee;
    int         *args;
    int         nargs;
    struct Instr *next;
} Instr;

typedef struct IrFn {
    char        *name;
    int         nparams;
    Type        **param_types;
    int         nlocals;
    int         nslots;
    Type        **slot_types;
    int         frame_bytes;
    Type        *ret_type;
    int         *reg_of;
    int         *last_use;
    Instr       *head;
    struct IrFn *next;
} IrFn;

IrFn *lower(Program *prog);

#include <stdio.h>
void dump_ir(FILE *out, IrFn *funcs);
