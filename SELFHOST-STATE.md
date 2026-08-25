# Estado del autohospedaje tetsuo (pausa 2026-08-25)

## Hitos cerrados y verificados
| # | Cerrado | Notas |
|---|---|---|
| 12 (a-d) | ✅ | argv shim, nil, sizeof(T), parens opcionales |
| 13 (a-d) | ✅ | runtime lib/str.tt, lib/fmt.tt, lib/vec.tt, io_open_write en tests/io.tt |
| 14 (a-c) | ✅ | KIND_NAMES stage0 arreglado; equivalencia numérica lexer stage1↔stage0 sobre 6 samples |
| 15.1 | ✅ | `lib/ast.tt` arena AST separada 8 MB (`AST_BUF` + `ast_init`) |
| 15.2 | ✅ | `src/parser.tt` con `PrimType`, `Type`, `mk_prim`, `mk_ptr`, `type_width` |
| 15.2b | ✅ | Paridad lexer stage1 con stage0: `TK_BSS=11`, `TK_NIL=12`, `TK_SIZEOF=13` (todo TK_* posterior +3) + kw_kind |
| 15.3 | ✅ | Enum `EX_*` + `OP_*` + `struct Expr` (15 campos, 120 bytes) + bss `LX_STATE`/`TOK_CUR` + `ps_init/advance/kind` + `mk_expr` + `parse_primary` (NUM/NIL/IDENT/STRING) |
| 15.4 | ✅ | `parse_unary` (`@`,`&`) + `bin_prec` + `parse_expr` Pratt con precedencias 6..1 |
| 15.5 | ✅ | `Stmt`, `parse_stmt` (LET/RETURN/IF/WHILE/LOOP/BREAK/EXPR/ASSIGN), `parse_block`, `parse_type` (`*T`, u8/u32/u64/str, fallback T_STRUCT) + `ps_expect`/`ps_accept`/`bytes_eq_at` |
| 15.6 | ✅ | Structs `Program/Func/Param/ConstItem/BssItem/StructDecl/Field` + `parse_fun/parse_const_decl/parse_bss_decl/parse_struct_decl` + `parse(ar,src,len)` driver |

Además de 15.3, en `parse_primary` se añadieron TK_SIZEOF, `(expr)` y detección de CALL (`IDENT LPAREN args RPAREN`).
En 15.4 se añadió `parse_postfix` con `.f` (EX_VAR con `inner=base`) y `[i]` (EX_DEREF con `inner=base`,`rhs=idx`).

## Verify actual (11/11 verde antes del bloque 15.7-8)
Tests smoke añadidos al `bootstrap/verify.sh`:
- argv=4, nil=7, nil2=7, parens=9, sizeof=16, str_test=3, fmt_test=4, vec_test=20, ast_test=33, type_test=9, primary_test=42, expr_test1=146 (402 mod 256), stmt_test=5, prog_test=42
- `write_test.tt` crea `/tmp/tetsuo_write_test.txt` con `vec\n`
- `macos_hello.tt` imprime + exit=0
- Equivalencia numérica lexer stage1↔stage0 sobre 6 samples reales

## Hito 15.7-8 PAUSADO — bug bloqueante

### Estado
- `tests/parser_main.tt` **reescrito** argv-driven (main lee `argv[1]`, carga archivo en `PARSER_BUF` de 64 KB, llama `parse()`, cuenta `nfuncs+nconsts+nbsses+nstructs` iterando `.next`, `io_exit(total)`).
- `tests/parser_build.sh` **reescrito**: concatena `io.tt + str.tt + fmt.tt + vec.tt + ast.tt + lexer.tt + src/parser.tt + parser_main.tt`, compila `-e _main`, ejecuta con `"$INPUT_TT"` como arg1, `exit $rc`.
- `bootstrap/verify.sh` **NO incluye todavía** el bloque 15.7-8. Verify sigue verde con lo cerrado hasta 15.6.

### Sample sintético (funciona)
Sample custom `/tmp/sample.tt` con `fun m()->u32{return 1} fun n()->u32{return 2} const K:u64=3 bss B:100` → `rc=4`. Correcto.

### Sample real (falla)
`bash tests/parser_build.sh tests/argv.tt` → **Segfault** (rc=139). Todos los samples `tests/*.tt` reales contienen `return VAR` o `return CALL(...)` que desencadenan el bug.

### Reproducción minimal del bug
```bash
printf 'fun m()->u32{return 1}\n' > /tmp/mini.tt
bash tests/parser_build.sh /tmp/mini.tt   # rc=1  ← OK

printf 'fun m()->u32{return a}\n' > /tmp/mini.tt
bash tests/parser_build.sh /tmp/mini.tt   # rc=139 SEGV ← BUG
```

Diferencia: `return NUM` OK, `return IDENT` SEGV. Con `let x:u64=0; return x` **también funciona** (rc=1). El bug se dispara solo cuando el IDENT tras `return` NO fue previamente declarado como `let` en el mismo bloque (i.e. es param o global).

### Sitios candidatos
- `parse_primary` rama `TK_IDENT`: crea EX_VAR con `var_start/var_len`. Sin resolución de scope. La expresión creada es válida como AST, así que el bug no está en el propio parser — pero el binario `parser_test` crashea EN TIEMPO DE EJECUCIÓN al procesar ese input.
- Posible causa: bug en el codegen stage0 al compilar una función recursiva grande (Expr con 15 campos + Pratt) donde el patrón `let e: *Expr = mk_expr(...)` + rebind de `e` dentro de un `if` deja registros mal asignados. Sospecha reforzada porque el "hola" funciona hasta que el input contiene un patrón concreto.
- Alternativa: `parse_stmt` en TK_RETURN — `s.ret_val = parse_expr(ar, 1)` cuando parse_expr retorna un EX_VAR con `inner=nil` — algo del patrón EX_VAR devuelto directamente por `parse_primary` (sin pasar por Pratt binop) puede dispararlo.

### Cómo continuar
1. `lldb -batch -o "run tests/argv.tt" -o "bt" ./build/parser_test` para bt exacto. La primera vez dio `EXC_BAD_ACCESS address=0x1b`, `str x9, [x11]` con `x11 = x9 + 0x20 (32)` — sospechoso store en offset 32 sobre un puntero corrompido.
2. Aislar con `printf 'fun m()->u32{return a}\n' > /tmp/mini.tt`.
3. Añadir `printf`s en el binario stage1 no es viable (no hay). Alternativa: reducir `parser_main.tt` a llamar solo `ps_init(BUF, n); ps_advance()` hasta EOF sin construir AST, ver si crashea. Si no, el bug está en la construcción del AST, no en tokenizar.
4. Otra hipótesis: `mk_expr` `arena_take(ar, 120)` — el codegen stage0 quizá no alinea a 8 el resultado y sí escrituras subsecuentes esperan alineación. Comprobar con `arena_take(ar, 128)` para forzar alineación explícita.

### Alcance restante del hito 15 completo
- 15.7 `dump_ast` bit-a-bit — pospuesto: requiere replicar 200 líneas de formateo. Actual criterio de "diff estructural" (contadores top-level) es lo que 15.7-8 combinado pretende comprobar.
- 15.8 diff sobre 6 samples — bloqueado por el bug anterior.

## Archivos tocados en la sesión

Nuevos:
- `lib/ast.tt`
- `src/parser.tt` (~560 líneas)
- `tests/ast_test.tt`, `tests/type_test.tt`, `tests/primary_test.tt`, `tests/expr_test1.tt`, `tests/stmt_test.tt`, `tests/prog_test.tt`
- `SELFHOST-STATE.md` (este)

Modificados:
- `src/lexer.c` (KIND_NAMES reordenado tras TK_NIL/TK_SIZEOF)
- `tests/lexer.tt` (TK_BSS/NIL/SIZEOF + kw_kind + bytes_eq eliminado)
- `tests/lexer_main.tt` (argv-driven)
- `tests/lexer_build.sh` (concatena `lib/str.tt` + `exit $rc`)
- `tests/macos_build.sh` (concatena STR + FMT + VEC + AST + LEXER + PARSER libs)
- `tests/parser_main.tt` (reescrito argv-driven)
- `tests/parser_build.sh` (reescrito, sin sed, cat directo)
- `bootstrap/verify.sh` (todos los smoke tests hasta 15.6)
- `tests/io.tt` (`io_open_write`)

## Contexto del contract (para retomar)
- `caveman.instructions.md`: contract con prelude+cierre. Cada reply que mute archivos debe abrir graph session.
- Modo caveman ultra desde turn 1, español.
- Graft-first cuando aplique.
- No comentarios en código nuevo salvo petición explícita.

## Sesiones graph consumidas en esta sesión
Todas cerradas en `finish@1`:
- `gs-ea141b5a` (15.1), `gs-deb2f01f` (15.2), `gs-a5bba9f7` (15.2b), `gs-1bfdc82a` (15.3), `gs-56c3e7e7` (15.4), `gs-506069e5` (15.5), `gs-29f0d69f` (15.6), `gs-f8e64546` (15.7-8 pausada, marcada done:false y luego finish con summary de pausa).
