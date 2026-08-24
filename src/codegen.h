#pragma once
#include "ir.h"
#include "parser.h"
#include <stdio.h>

typedef enum {
    TGT_VIRT,
    TGT_MACOS,
} Target;

void codegen(FILE *out, Target tgt, Program *prog, IrFn *funcs);
