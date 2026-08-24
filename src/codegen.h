#pragma once
#include "ir.h"
#include "parser.h"
#include <stdio.h>

void codegen(FILE *out, Program *prog, IrFn *funcs);
