#include "codegen.h"
#include "ir.h"
#include "parser.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void usage(const char *prog) {
    fprintf(stderr, "uso: %s [--target=virt|macos] [--dump-tokens|--dump-ast|--dump-ir] <fuente.tt> [-o <salida.s>]\n", prog);
    exit(2);
}

static char *read_all(const char *path) {
    FILE *f = fopen(path, "rb");
    if (!f) { perror(path); exit(1); }
    if (fseek(f, 0, SEEK_END) != 0) { perror(path); exit(1); }
    long n = ftell(f);
    if (n < 0) { perror(path); exit(1); }
    if (fseek(f, 0, SEEK_SET) != 0) { perror(path); exit(1); }
    char *buf = malloc((size_t)n + 1);
    if (!buf) { perror("malloc"); exit(1); }
    if (fread(buf, 1, (size_t)n, f) != (size_t)n) { perror(path); exit(1); }
    buf[n] = 0;
    fclose(f);
    return buf;
}

int main(int argc, char **argv) {
    Target tgt = TGT_VIRT;
    int argi = 1;
    int dump_tokens_mode = 0;
    int dump_ast_mode = 0;
    int dump_ir_mode = 0;
    while (argi < argc) {
        if (strncmp(argv[argi], "--target=", 9) == 0) {
            const char *v = argv[argi] + 9;
            if      (strcmp(v, "virt") == 0)  tgt = TGT_VIRT;
            else if (strcmp(v, "macos") == 0) tgt = TGT_MACOS;
            else { fprintf(stderr, "target desconocido: %s\n", v); return 2; }
            argi++;
        } else if (strcmp(argv[argi], "--dump-tokens") == 0) {
            dump_tokens_mode = 1;
            argi++;
        } else if (strcmp(argv[argi], "--dump-ast") == 0) {
            dump_ast_mode = 1;
            argi++;
        } else if (strcmp(argv[argi], "--dump-ir") == 0) {
            dump_ir_mode = 1;
            argi++;
        } else {
            break;
        }
    }
    if (dump_tokens_mode) {
        if (argi + 1 != argc) usage(argv[0]);
        char *src = read_all(argv[argi]);
        dump_tokens(stdout, src);
        return 0;
    }
    if (dump_ast_mode) {
        if (argi + 1 != argc) usage(argv[0]);
        char *src = read_all(argv[argi]);
        Program *prog = parse(src);
        dump_ast(stdout, prog);
        return 0;
    }
    if (dump_ir_mode) {
        if (argi + 1 != argc) usage(argv[0]);
        char *src = read_all(argv[argi]);
        Program *prog = parse(src);
        IrFn *fns = lower(prog);
        dump_ir(stdout, fns);
        return 0;
    }
    if (argi + 3 != argc || strcmp(argv[argi + 1], "-o") != 0) usage(argv[0]);
    char    *src  = read_all(argv[argi]);
    Program *prog = parse(src);
    IrFn    *fns  = lower(prog);
    FILE *o = fopen(argv[argi + 2], "w");
    if (!o) { perror(argv[argi + 2]); return 1; }
    codegen(o, tgt, prog, fns);
    if (fclose(o) != 0) { perror(argv[argi + 2]); return 1; }
    return 0;
}
