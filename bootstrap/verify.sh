#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

fail() { echo "VERIFY FAIL: $1" >&2; exit 1; }

# Forzar rebuild del compilador C: macos_build.sh cachea el binario.
rm -f build/tetsuoc

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

# hito 14: equivalencia lexer stage1 (tests/lexer.tt) vs stage0 (--dump-tokens) sobre 6 samples
# Primer sample tambien compila el binario; el resto reutiliza el compilado.
for sample in tests/hello.tt tests/argv.tt tests/nil.tt tests/parens.tt tests/sizeof.tt tests/fmt_test.tt; do
    set +e
    bash tests/lexer_build.sh "$sample" > /tmp/tt_lexer.log 2>&1
    s1=$?
    set -e
    [[ $s1 -gt 0 && $s1 -lt 250 ]] || fail "lexer stage1 rc fuera de rango sobre $sample: $s1; log:\n$(cat /tmp/tt_lexer.log)"
    s0=$(./build/tetsuoc --dump-tokens "$sample" 2>/dev/null | wc -l | tr -d ' ')
    s0_real=$((s0 - 1))
    [[ $s1 -eq $s0_real ]] || fail "lexer stage1=$s1 vs stage0=$s0_real sobre $sample; log:\n$(cat /tmp/tt_lexer.log)"
done

echo "VERIFY OK"
