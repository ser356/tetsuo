#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

RED=$'\033[31m'
GREEN=$'\033[32m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

check() {
    local desc="$1"; local exp="$2"; shift 2
    printf '  %-46s ' "$desc"
    local rc=0
    "$@" > /tmp/tt_verify.log 2>&1 || rc=$?
    if [[ $rc -eq $exp ]]; then
        printf '%sOK%s\n' "$GREEN" "$RESET"
    else
        printf '%sFAIL%s (rc=%s esp=%s)\n' "$RED" "$RESET" "$rc" "$exp"
        cat /tmp/tt_verify.log >&2
        exit 1
    fi
}

section() { printf '\n%s%s%s\n' "$BOLD" "$1" "$RESET"; }

# Forzar rebuild del binario stage1: macos_build.sh cachea build/main.
rm -f build/main

section "Base runtime + parser (hitos 12-15)"
check "argv.tt (argc)"                  4   bash tests/macos_build.sh tests/argv.tt uno dos tres
check "nil.tt (literal 0)"              7   bash tests/macos_build.sh tests/nil.tt
check "nil2.tt (keyword)"               7   bash tests/macos_build.sh tests/nil2.tt
check "parens.tt (if/while opt)"        9   bash tests/macos_build.sh tests/parens.tt a b c
check "sizeof.tt"                       16  bash tests/macos_build.sh tests/sizeof.tt
check "str_test.tt (mem_copy)"          3   bash tests/macos_build.sh tests/str_test.tt
check "fmt_test.tt (out_u64)"           4   bash tests/macos_build.sh tests/fmt_test.tt
check "vec_test.tt (arena grow)"        20  bash tests/macos_build.sh tests/vec_test.tt
check "ast_test.tt (arena AST)"         33  bash tests/macos_build.sh tests/ast_test.tt
check "type_test.tt (Type,mk_prim)"     9   bash tests/macos_build.sh tests/type_test.tt
check "primary_test.tt"                 42  bash tests/macos_build.sh tests/primary_test.tt
check "expr_test1.tt (Pratt)"           146 bash tests/macos_build.sh tests/expr_test1.tt
check "stmt_test.tt (parse_stmt LET)"   5   bash tests/macos_build.sh tests/stmt_test.tt
check "prog_test.tt (parse driver)"     42  bash tests/macos_build.sh tests/prog_test.tt

section "IR + lowering (hito 16)"
check "ir_test.tt (mk_ins+ir_emit)"     3  bash tests/macos_build.sh tests/ir_test.tt
check "lower_int_test.tt (EX_BIN)"      3  bash tests/macos_build.sh tests/lower_int_test.tt
check "lower_ret_test.tt (ST_RETURN)"   2  bash tests/macos_build.sh tests/lower_ret_test.tt
check "lower_let_test.tt (LET+VAR)"     4  bash tests/macos_build.sh tests/lower_let_test.tt
check "lower_if_test.tt (ST_IF else)"   9  bash tests/macos_build.sh tests/lower_if_test.tt
check "lower_while_test.tt (BREAK)"     6  bash tests/macos_build.sh tests/lower_while_test.tt
check "lower_cmp_test.tt (EX_LT)"       4  bash tests/macos_build.sh tests/lower_cmp_test.tt
check "lower_call_test.tt (EX_CALL)"    2  bash tests/macos_build.sh tests/lower_call_test.tt
check "lower_mem_test.tt (ADDR/DEREF)"  8  bash tests/macos_build.sh tests/lower_mem_test.tt
check "lower_prog_test.tt (driver)"     2  bash tests/macos_build.sh tests/lower_prog_test.tt
check "lower_regalloc_test.tt"          3  bash tests/macos_build.sh tests/lower_regalloc_test.tt
check "lower_str_test.tt (EX_STRLIT)"   7  bash tests/macos_build.sh tests/lower_str_test.tt
check "parse_locals_test.tt (var_idx)"  1  bash tests/macos_build.sh tests/parse_locals_test.tt

section "Codegen textual + driver (hitos 17-18)"
check "hex4_test.tt (out_hex4)"         4   bash tests/macos_build.sh tests/hex4_test.tt
check "emit_movi_test.tt"               24  bash tests/macos_build.sh tests/emit_movi_test.tt
check "emit_prologue_test.tt"           174 bash tests/macos_build.sh tests/emit_prologue_test.tt
check "emit_instr_test.tt"              59  bash tests/macos_build.sh tests/emit_instr_test.tt
check "codegen_e2e (stage1 -> bin)"     42  bash tests/codegen_e2e_build.sh
check "main_e2e (argv-driven driver)"   42  bash tests/main_e2e_build.sh

section "Preprocessor + Mach-O nativo (hitos 23-24)"
check "import_build.sh (pp inline)"     42  bash tests/import_build.sh
check "shifts_test.tt (<< >>)"          0   bash tests/macos_build.sh tests/shifts_test.tt
check "asm_test.tt (encoder AArch64)"   0   bash tests/macos_build.sh tests/asm_test.tt
check "sha256_test.tt (vectors)"        0   bash tests/macos_build.sh tests/sha256_test.tt
check "macho_build.sh (adhoc signed)"   42  bash tests/macho_build.sh
check "codegen_bytes_build.sh (bytes)"  42  bash tests/codegen_bytes_build.sh
check "codegen_bytes_bss (Session A)"   42  bash tests/codegen_bytes_bss_build.sh
check "codegen_bytes_bigtext (Sess B)"  65  bash tests/codegen_bytes_bigtext_build.sh
check "emit_macho_build.sh (Sess C1)"   42  bash tests/emit_macho_build.sh
check "fixpoint_macho (Sess C2 bytes)"  0   bash tests/fixpoint_macho_build.sh

section "Runtime IO + fixpoint (hito 19.b)"
rm -f /tmp/tetsuo_write_test.txt
check "write_test.tt (io_open_write)"   0   bash tests/macos_build.sh tests/write_test.tt
printf '  %-46s ' "write_test.tt (fichero + contenido)"
if [[ -f /tmp/tetsuo_write_test.txt ]] && grep -q "^vec$" /tmp/tetsuo_write_test.txt; then
    printf '%sOK%s\n' "$GREEN" "$RESET"
else
    printf '%sFAIL%s\n' "$RED" "$RESET"
    ls -la /tmp/tetsuo_write_test.txt >&2 2>&1 || true
    exit 1
fi

printf '  %-46s ' "macos_hello.tt (imprime + exit=0)"
out=$(bash tests/macos_build.sh tests/macos_hello.tt 2>&1)
if echo "$out" | grep -q "hola desde macOS" && echo "$out" | tail -1 | grep -q "exit=0"; then
    printf '%sOK%s\n' "$GREEN" "$RESET"
else
    printf '%sFAIL%s\n' "$RED" "$RESET"
    echo "$out" >&2
    exit 1
fi

for sample in tests/argv.tt tests/hello.tt tests/nil.tt tests/parens.tt tests/sizeof.tt tests/str_test.tt; do
    check "parser stage1 <- $(basename "$sample")" 55 bash tests/parser_build.sh "$sample"
done

check "fixpoint_build.sh (s0==s1==s2)"  0   bash tests/fixpoint_build.sh

printf '\n%s%sVERIFY OK%s\n' "$GREEN" "$BOLD" "$RESET"
