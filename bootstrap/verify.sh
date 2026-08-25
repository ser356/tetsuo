#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

fail() { echo "VERIFY FAIL: $1" >&2; exit 1; }

# Forzar rebuild del binario stage1: macos_build.sh cachea build/main.
rm -f build/main

# argv shim: exit == argc
rc=0
bash tests/macos_build.sh tests/argv.tt uno dos tres > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 4 ]] || fail "argv.tt exit=$rc esperado 4; log:\n$(cat /tmp/tt_verify.log)"

# nil como 0: puntero nulo comparado con 0 devuelve 7
rc=0
bash tests/macos_build.sh tests/nil.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 7 ]] || fail "nil.tt exit=$rc esperado 7; log:\n$(cat /tmp/tt_verify.log)"

# keyword nil: mismo comportamiento con la palabra reservada
rc=0
bash tests/macos_build.sh tests/nil2.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 7 ]] || fail "nil2.tt exit=$rc esperado 7; log:\n$(cat /tmp/tt_verify.log)"

# parentesis opcionales estilo C en if/while
rc=0
bash tests/macos_build.sh tests/parens.tt a b c > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 9 ]] || fail "parens.tt exit=$rc esperado 9; log:\n$(cat /tmp/tt_verify.log)"

# sizeof(T) resuelto en tiempo de parse
rc=0
bash tests/macos_build.sh tests/sizeof.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 16 ]] || fail "sizeof.tt exit=$rc esperado 16; log:\n$(cat /tmp/tt_verify.log)"

# runtime lib/str.tt: mem_copy + bytes_eq
rc=0
bash tests/macos_build.sh tests/str_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 3 ]] || fail "str_test.tt exit=$rc esperado 3; log:\n$(cat /tmp/tt_verify.log)"

# runtime lib/fmt.tt: out_u64 convierte 42 a "42"
rc=0
bash tests/macos_build.sh tests/fmt_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 4 ]] || fail "fmt_test.tt exit=$rc esperado 4; log:\n$(cat /tmp/tt_verify.log)"

# runtime lib/vec.tt: push 3 elementos, crecimiento sobre arena, leer el segundo
rc=0
bash tests/macos_build.sh tests/vec_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 20 ]] || fail "vec_test.tt exit=$rc esperado 20; log:\n$(cat /tmp/tt_verify.log)"

# runtime lib/ast.tt: arena AST con 3 arena_take de 32 bytes; pos=96
rc=0
bash tests/macos_build.sh tests/ast_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 33 ]] || fail "ast_test.tt exit=$rc esperado 33; log:\n$(cat /tmp/tt_verify.log)"

# parser stage1 hito 15.2: Type + mk_prim/mk_ptr/type_width. *u32 -> width 8 + inner.kind 1 = 9
rc=0
bash tests/macos_build.sh tests/type_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 9 ]] || fail "type_test.tt exit=$rc esperado 9; log:\n$(cat /tmp/tt_verify.log)"

# parser stage1 hito 15.3: parse_primary sobre '42' -> EX_INT ival=42
rc=0
bash tests/macos_build.sh tests/primary_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 42 ]] || fail "primary_test.tt exit=$rc esperado 42; log:\n$(cat /tmp/tt_verify.log)"

# parser stage1 hito 15.4: parse_expr '1+2*3' -> EX_BIN(+) rhs EX_BIN(*). (4*10+0)*10+2 = 402, exit 8-bit = 146
rc=0
bash tests/macos_build.sh tests/expr_test1.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 146 ]] || fail "expr_test1.tt exit=$rc esperado 146 (402 mod 256); log:\n$(cat /tmp/tt_verify.log)"

# parser stage1 hito 15.5: parse_stmt 'let x: u64 = 5' -> ST_LET init.ival=5
rc=0
bash tests/macos_build.sh tests/stmt_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 5 ]] || fail "stmt_test.tt exit=$rc esperado 5; log:\n$(cat /tmp/tt_verify.log)"

# parser stage1 hito 15.6: top-level parse driver sobre 'fun main() -> u64 { return 42 }'
rc=0
bash tests/macos_build.sh tests/prog_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 42 ]] || fail "prog_test.tt exit=$rc esperado 42; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.1: arena IR + mk_ins + mk_ir_fn + ir_emit; walk de 3 ins encadenadas
rc=0
bash tests/macos_build.sh tests/ir_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 3 ]] || fail "ir_test.tt exit=$rc esperado 3; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.2: lower_expr sobre EX_BIN(EX_INT(3),EX_INT(4),OP_ADD) emite MOVI+MOVI+BINOP
rc=0
bash tests/macos_build.sh tests/lower_int_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 3 ]] || fail "lower_int_test.tt exit=$rc esperado 3; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.3a: lower_stmt(ST_RETURN) + lower_block; return 5 -> MOVI+RET
rc=0
bash tests/macos_build.sh tests/lower_ret_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 2 ]] || fail "lower_ret_test.tt exit=$rc esperado 2; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.3b: LET+EX_VAR+RETURN; let x=7; return x -> MOVI+STORE_LOCAL+LOAD_LOCAL+RET
rc=0
bash tests/macos_build.sh tests/lower_let_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 4 ]] || fail "lower_let_test.tt exit=$rc esperado 4; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.4a: ST_IF con else; cond+jz+body(ret5)+jmp+label_else+else(ret6)+label_end = 9 ins
rc=0
bash tests/macos_build.sh tests/lower_if_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 9 ]] || fail "lower_if_test.tt exit=$rc esperado 9; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.4b: ST_WHILE + ST_BREAK; label_top+cond+jz+break(jmp)+jmp_top+label_end = 6 ins
rc=0
bash tests/macos_build.sh tests/lower_while_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 6 ]] || fail "lower_while_test.tt exit=$rc esperado 6; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.5a: EX_LT sobre 1<2 en return -> MOVI+MOVI+CMPLT+RET = 4 ins
rc=0
bash tests/macos_build.sh tests/lower_cmp_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 4 ]] || fail "lower_cmp_test.tt exit=$rc esperado 4; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.5b: EX_CALL foo(3) como ST_EXPR -> MOVI+CALL = 2 ins
rc=0
bash tests/macos_build.sh tests/lower_call_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 2 ]] || fail "lower_call_test.tt exit=$rc esperado 2; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.5c: ADDR + DEREF + STORE_MEM; let a=0; @&a=7; return @&a = 8 ins
rc=0
bash tests/macos_build.sh tests/lower_mem_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 8 ]] || fail "lower_mem_test.tt exit=$rc esperado 8; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.6: driver lower(ar,prog) sobre Program con 1 Func (return 42) -> 2 ins en head IrFn
rc=0
bash tests/macos_build.sh tests/lower_prog_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 2 ]] || fail "lower_prog_test.tt exit=$rc esperado 2; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.7: regalloc + frame_bytes sobre Program{return 3+4}
# nslots=3 -> frame_bytes=round_up(24,16)=32; rc = (reg_of!=nil?1:0) + frame_bytes/16 = 1+2 = 3
rc=0
bash tests/macos_build.sh tests/lower_regalloc_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 3 ]] || fail "lower_regalloc_test.tt exit=$rc esperado 3; log:\n$(cat /tmp/tt_verify.log)"

# ir stage1 hito 16.8: EX_STRLIT -> IR_LABEL_ADDR; smoke construye Expr(EX_STRLIT,str_id=7) y devuelve
# el str_id de la primera Ins IR_LABEL_ADDR emitida por lower(); esperado 7
rc=0
bash tests/macos_build.sh tests/lower_str_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 7 ]] || fail "lower_str_test.tt exit=$rc esperado 7; log:\n$(cat /tmp/tt_verify.log)"

# parser stage1 hito 16.8b: resolucion var_index/local_index. parse+lower de
# `fun main()->u64{let a:u64=1;let b:u64=2;return b}` y devuelve el .local de la
# primera IR_LOAD_LOCAL (deberia ser slot 1 = b)
rc=0
bash tests/macos_build.sh tests/parse_locals_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 1 ]] || fail "parse_locals_test.tt exit=$rc esperado 1; log:\n$(cat /tmp/tt_verify.log)"

# codegen stage1 hito 17.1: out_hex4 en lib/fmt.tt. out_hex4(42) -> "002a"
rc=0
bash tests/macos_build.sh tests/hex4_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 4 ]] || fail "hex4_test.tt exit=$rc esperado 4; log:\n$(cat /tmp/tt_verify.log)"

# codegen stage1 hito 17.2: emit_movi en src/codegen.tt. emit_movi(o, 9, 42) -> "    movz    x9, #0x002a\n" (24 bytes)
rc=0
bash tests/macos_build.sh tests/emit_movi_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 24 ]] || fail "emit_movi_test.tt exit=$rc esperado 24; log:\n$(cat /tmp/tt_verify.log)"
# codegen stage1 hito 17.3: emit_prologue+emit_epilogue en src/codegen.tt. IrFn{name='main',frame_bytes=16},epi_label=0
# -> asm exact match longitud 174
rc=0
bash tests/macos_build.sh tests/emit_prologue_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 174 ]] || fail "emit_prologue_test.tt exit=$rc esperado 174; log:\n$(cat /tmp/tt_verify.log)"

# codegen stage1 hito 17.4: emit_instr port en src/codegen.tt. IR_MOVI(dst=0,imm=99) + IR_RET(a=0) con reg_of[0]=x9
# -> '    movz    x9, #0x0063\n    mov     x0, x9\n    b       .L7\n' longitud 59
rc=0
bash tests/macos_build.sh tests/emit_instr_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 59 ]] || fail "emit_instr_test.tt exit=$rc esperado 59; log:\n$(cat /tmp/tt_verify.log)"

# codegen stage1 hito 17.5: driver end-to-end. stage1 parsea+lowera+codegen sobre
# `fun main()->u64{return 42}` -> /tmp/tt_stage1.s; clang ensambla + enlaza; el binario
# emitido devuelve 42
rc=0
bash tests/codegen_e2e_build.sh > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 42 ]] || fail "codegen_e2e exit=$rc esperado 42; log:\n$(cat /tmp/tt_verify.log)"

# main stage1 hito 18: src/main.tt driver argv-driven. Compila stage1 completo con
# src/main.tt como INPUT, ejecuta con '/tmp/tt_return42.tt -o /tmp/tt_stage1.s', clang enlaza,
# binario devuelve 42
rc=0
bash tests/main_e2e_build.sh > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 42 ]] || fail "main_e2e exit=$rc esperado 42; log:\n$(cat /tmp/tt_verify.log)"

# hito 23: import 'path' preprocessor. tests/import_b.tt hace import de import_a.tt
# que define a(); main() devuelve a()+1 = 42
rc=0
bash tests/import_build.sh > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 42 ]] || fail "import_build.sh exit=$rc esperado 42; log:\n$(cat /tmp/tt_verify.log)"

# hito 24.a: operadores << y >>. shifts inmediatos y por registro, mezcla con & y >>
rc=0
bash tests/macos_build.sh tests/shifts_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 0 ]] || fail "shifts_test.tt exit=$rc esperado 0; log:\n$(cat /tmp/tt_verify.log)"

# hito 24.b: encoder de instrucciones AArch64 (src/asm.tt) contra tabla dorada
rc=0
bash tests/macos_build.sh tests/asm_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 0 ]] || fail "asm_test.tt exit=$rc esperado 0; log:\n$(cat /tmp/tt_verify.log)"

# hito 24.c: SHA-256 (lib/sha256.tt) contra vectores conocidos
rc=0
bash tests/macos_build.sh tests/sha256_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 0 ]] || fail "sha256_test.tt exit=$rc esperado 0; log:\n$(cat /tmp/tt_verify.log)"

# hito 24.d/f: Mach-O firmado ad-hoc. Emite el binario exit(42); en macOS nativo
# se ejecuta directo (cero herramientas externas) y devuelve 42.
rc=0
bash tests/macho_build.sh > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 42 ]] || fail "macho_build.sh exit=$rc esperado 42; log:\n$(cat /tmp/tt_verify.log)"

# hito 24.e: codegen a bytes. stage1 compila un programa (llamadas, comparaciones,
# literal de cadena) a un Mach-O firmado directamente en bytes; el binario corre
# nativo en macOS y devuelve 42.
rc=0
bash tests/codegen_bytes_build.sh > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 42 ]] || fail "codegen_bytes_build.sh exit=$rc esperado 42; log:\n$(cat /tmp/tt_verify.log)"
# codegen stage1 hito 17.4: emit_instr para IR_MOVI(dst=0,imm=99)+IR_RET(a=0) con reg_of[0]=0 y epi_label=7
# esperado "    movz    x9, #0x0063\n    mov     x0, x9\n    b       .L7\n" = 24+19+16 = 59 bytes
rc=0
bash tests/macos_build.sh tests/emit_instr_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 59 ]] || fail "emit_instr_test.tt exit=$rc esperado 59; log:\n$(cat /tmp/tt_verify.log)"

# codegen stage1 hito 17.3: emit_sym/emit_prologue/emit_epilogue. main+frame=16+label=0 -> 174 bytes
rc=0
bash tests/macos_build.sh tests/emit_prologue_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 174 ]] || fail "emit_prologue_test.tt exit=$rc esperado 174; log:\n$(cat /tmp/tt_verify.log)"

# runtime io_open_write: abre /tmp/tetsuo_write_test.txt, escribe 'vec\n', cierra
rm -f /tmp/tetsuo_write_test.txt
rc=0
bash tests/macos_build.sh tests/write_test.tt > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 0 ]] || fail "write_test.tt exit=$rc esperado 0; log:\n$(cat /tmp/tt_verify.log)"
[[ -f /tmp/tetsuo_write_test.txt ]] || fail "write_test.tt no creo el fichero"
grep -q "^vec$" /tmp/tetsuo_write_test.txt || fail "write_test.tt contenido inesperado: $(cat /tmp/tetsuo_write_test.txt)"

# no regresion de macos_hello
out=$(bash tests/macos_build.sh tests/macos_hello.tt 2>&1)
echo "$out" | grep -q "hola desde macOS" || fail "macos_hello no imprime; salida:\n$out"
echo "$out" | tail -1 | grep -q "exit=0" || fail "macos_hello exit != 0; salida:\n$out"

# hito 15.7-8: parser stage1 corre sobre samples reales sin SEGV. parser_main.tt
# devuelve 55 como sentinel tras parse() exitoso; regresion = crash != 55.
for sample in tests/argv.tt tests/hello.tt tests/nil.tt tests/parens.tt tests/sizeof.tt tests/str_test.tt; do
    rc=0
    bash tests/parser_build.sh "$sample" > /tmp/tt_verify.log 2>&1 || rc=$?
    [[ $rc -eq 55 ]] || fail "parser stage1 sobre $sample rc=$rc esperado 55; log:\n$(cat /tmp/tt_verify.log)"
done

# hito 14 obsoleto tras hito 19.b: la equivalencia lexer stage1<->stage0 se sub-
# sume en el fixpoint bit-a-bit s0==s1==s2 del hito 19. Ademas requiere src/*.c,
# que ya no existe en el proceso. Bloque eliminado.

# hito 19: fixpoint completo. stage1 compila macos_hello (msg.ptr/msg.len) y
# se compila a si mismo; diff bit a bit s0 vs s1 y s1 vs s2.
rc=0
bash tests/fixpoint_build.sh > /tmp/tt_verify.log 2>&1 || rc=$?
[[ $rc -eq 0 ]] || fail "fixpoint rc=$rc; log:\n$(cat /tmp/tt_verify.log)"

echo "VERIFY OK"
