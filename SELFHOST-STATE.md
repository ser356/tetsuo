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
| 15.7-8 | ✅ | Fix `lookup_local` walk-backwards (shadowing léxico). `parser_test` corre sin SEGV sobre 6 samples reales; smoke añadido a `bootstrap/verify.sh` con centinela rc=55 |
| 16.1 | ✅ | `src/ir.tt` skeleton: arena IR 4 MB + 19 constantes `IR_*` + `struct Ins` (15 campos, 120 B) + `struct IrFn` (14 campos, 112 B con head+tail) + `mk_ins/mk_ir_fn/ir_emit`. Smoke `ir_test.tt` walk de 3 ins rc=3 |
| 16.2 | ✅ | Builder `struct B` (48 B, `slot_types` cap fijo 4096 sobre arena, sin realloc) + `mk_builder` + `ir_new_slot` + `lower_expr` para EX_INT y EX_BIN aritmético (ADD/SUB/MUL/DIV/AND/OR/XOR). Smoke `lower_int_test.tt` `EX_BIN(3+4)` → 3 ins rc=3 |
| 16.3a | ✅ | `lower_stmt` para ST_RETURN + ST_EXPR + `lower_block`. Smoke `lower_ret_test.tt` `return 5` → 2 ins rc=2 |
| 16.3b | ✅ | Expr gana `var_index:u64` (sizeof 128), Stmt gana `local_index:u64` (sizeof 96). `lower_expr` EX_VAR emite `IR_LOAD_LOCAL`; `lower_stmt` ST_LET/ST_ASSIGN emiten `IR_STORE_LOCAL`. Smoke `lower_let_test.tt` `let x=7; return x` → 4 ins rc=4. **Nota**: la resolución nombre→`var_index` sigue pendiente; los tests preseteean el índice a mano |
| 16.4 | ✅ | Control de flujo. `struct B` gana `next_label` + `break_stack` (cap 16 sobre arena) + `break_top` (72 B). Helpers `ir_new_label/ir_emit_label/ir_emit_jmp/ir_emit_jz`. `lower_stmt` gana ST_IF (con/sin else), ST_WHILE, ST_LOOP, ST_BREAK. Smokes `lower_if_test.tt` (if 1 { ret 5 } else { ret 6 } → 9 ins) y `lower_while_test.tt` (while 0 { break } → 6 ins) |
| 16.5 | ✅ | Batch expresiones y memoria. `lower_expr`: EX_EQ..EX_GE (helper `lower_cmp` → IR_CMPEQ..CMPGE), EX_ADDR (IR_ADDR_LOCAL), EX_DEREF (IR_LOAD_MEM), EX_CALL (arg_slots reservados en arena + IR_CALL). `lower_stmt` ST_STORE emite IR_STORE_MEM (`expr`=ptr, `init`=val). Smokes cmp rc=4, call rc=2, mem rc=8 |
| 16.6 | ✅ | Driver `lower_one_fn(ar,sf) → *IrFn` + `lower(ar,prog) → *IrFn` head. Recorre `Program.funcs`, crea IrFn por Func, `lower_block(body)`, popula `nslots=max_slot`. Smoke `lower_prog_test.tt` Program{return 42} → head IrFn con 2 ins rc=2 |
| 16.7 | ✅ | Regalloc lineal + `frame_bytes`. `const NREGS:u64=7` + helpers `ir_count_ins`, `ir_has_dst`, `collect_uses(i,buf:*u64)->nu`. `regalloc(ar,fn)`: reserva arr/last_use/def_idx/cross/call_ix/reg_of en arena, sentinela=n para last_use/def_idx y NREGS para reg_of, cross-CALL via call_ix, linear scan con `is_free:[u64;NREGS]` (sin bitshift ni ~, no soportados). `finalize_frame(fn)`: `nslots*8` round-up a 16 con div/mul. `lower` invoca `regalloc(ar,f) + finalize_frame(f)` por función. Convención IR_RET: `.a` siempre es slot válido → `lower_stmt ST_RETURN` emite MOVI 0 si `ret_val==nil`. Smoke `lower_regalloc_test.tt` Program{return 3+4} → nslots=3, frame_bytes=32, reg_of!=nil, rc=3 |
| 16.8 | ✅ | EX_STRLIT + tabla `str_id` compartida. Expr gana `str_id:u64` (17 campos, 136 B). Program gana `strs:*StrLit`+`nstrs:u64` (48 B). Nuevo `struct StrLit{id,bytes,slen,next}` (32 B) + bss `STR_HEAD`/`STR_COUNT`/`STR_TAIL` + `str_table_init`/`str_table_add`. `parse_primary` TK_STRING extrae `str_bytes = LX_STATE.src+t.start+1`, `str_len = t.tlen-2`, invoca `str_table_add` y guarda `str_id`. `parse()` inicializa la tabla y vuelca `STR_HEAD/COUNT` en `p.strs/p.nstrs`. `lower_expr` EX_STRLIT emite IR_LABEL_ADDR con `str_id`. Smoke `lower_str_test.tt` construye `EX_STRLIT(str_id=7)` manual → rc=7 |
| 16.9 | ✅ | Resolución `var_index`/`local_index` en el parser. Nuevo `struct Local{name_start,name_len,type}` (24 B). Func gana `locals:**Local`+`nlocals:u64` (72 B, cap fija 256). bss `CUR_FUNC` + helpers `cur_func_set/get`, `bytes_eq_off`, `add_local`, `lookup_local` (walk-backwards). `parse_fun` setea CUR_FUNC, añade params como locales 0..nparams-1. `parse_stmt` ST_LET llama `add_local` y setea `local_index`. `parse_stmt` (assign): si lhs es EX_VAR copia `var_index → local_index`. `parse_primary` TK_IDENT resuelve `var_index = lookup_local(...)`. Estructuras Stmt/Param/Local/Func reordenadas antes de parse_primary para satisfacer forward refs del stage0. Smoke `parse_locals_test.tt` parse+lower `fun main()->u64{let a:u64=1;let b:u64=2;return b}` → primer IR_LOAD_LOCAL.local = 1 (b) |
| 17.1 | ✅ | `out_hex4(o,v)` + `out_nibble(o,n)` en `lib/fmt.tt`. 4 hex minúsculas MSB→LSB via div (sin bitshift ni AND). Smoke rc=4 bytes_eq contra `'002a'` |
| 17.2 | ✅ | `src/codegen.tt` skeleton. Constantes `TGT_VIRT`/`TGT_MACOS`, bss `G_TARGET` + `set_target`/`get_target`, helpers `out_reg_x`/`out_reg_w`, y `emit_movi(o,xreg_r,imm)` (movz/movk chain via div por 65536). Smoke rc=24 bytes_eq contra `'    movz    x9, #0x002a\n'` |
| 17.3 | ✅ | `emit_prologue(o,fn)` (`.globl name`+`stp x29,x30`+`mov x29,sp`+`sub sp` si frame_bytes>0) + `emit_epilogue(o,fn,epi_label)` (`.L{n}:`+`add sp`+`ldp x29,x30`+`ret`). Smoke rc=174 bytes_eq. **Bonus fix crítico stage0**: `src/codegen.c` ahora null-termina literales str en `__TEXT,__cstring` (`.byte 0x00` extra) — sin él `ld` mergea literales que comparten sufijos y corrompe `s.ptr` con >60 literals |
| 17.4 | ✅ | `emit_instr(o,fn,i,epi_label)` chain sobre IR_MOVI/LABEL_ADDR/ADDR_LOCAL/LOAD_LOCAL/STORE_LOCAL/LOAD_MEM/STORE_MEM/BINOP/CMPxx/CALL/RET/JMP/JZ/LABEL. Helpers `out_binop_mnemonic`, `out_cc`, `emit_load_slot_to_x`, `emit_spill_x`, `ensure_src_x`, `emit_i_*`. Smoke `emit_instr_test.tt` IR_MOVI(dst=0,imm=99)+IR_RET(a=0) → 59 bytes exactos |
| 17.5 | ✅ | Driver `codegen(o,target,prog,funcs)` + `emit_fn`, `emit_text_section`, `emit_strings` (con null-term), `emit_macos_start`, `emit_string_byte`. `codegen_e2e_test.tt` parse+lower+codegen `fun main()->u64{return 42}` → `/tmp/tt_stage1.s`; clang -c + clang -e _tt_start + ejecuta → **rc=42**. Stage1 emite ejecutables reales |
| 18 | ✅ | `src/main.tt` driver argv-driven (37 líneas): `read_all(path,buf,cap)` via `io_open_read`+loop `io_read`+`io_close`. `main(argc,argv)` toma input.tt en `argv[argc-3]` y output.s en `argv[argc-1]`, parse+lower+codegen a fichero. Bonus: `codegen()` calcula `max_label` recorriendo IR_LABEL/JMP/JZ para evitar colisión con labels de control de flujo. Smoke `main_e2e_build.sh`: compila `src/main.tt` como binario stage1, lo ejecuta con `/tmp/tt_return42.tt -o /tmp/tt_stage1.s`, clang enlaza → rc=42 |
| 19 | 🟡 P1 | **Completitud estructural.** Añadido `emit_bsses` a codegen (`__DATA,__bss,_name,size,3` per macos). Fix crítico: `emit_i_call` usaba `get_src()` bss no inicializado → segfault en cualquier CALL; migrado a `LX_STATE.src`. Smoke funcional: stage1 compila `fun helper(){return 42} fun main(){return helper()}` end-to-end → binario rc=42. **Gaps para fixpoint completo (stage1 compila stage1)**: (a) EX_VAR con `inner!=nil` (struct field access `msg.ptr`, `lx.src`) no lowerado — requiere resolución de layout de struct/str durante lowering; (b) EX_DEREF con `inner+rhs` (indexing `arr[i]`) no lowerado; (c) resolución de tipos en `type_width` runtime para struct fields. Reproductor: `./build/main tests/macos_hello.tt` segfaultea al llegar a `msg.ptr`. Deferred |

Con eso el bootstrap **estructural** completo. Stage1 emite binarios ejecutables reales (rc=42 e2e y a través de main.tt). Full self-host requiere cerrar los 3 gaps de hito 19.

## Verify actual (35/35 verde)

Bloque completo de `bootstrap/verify.sh` — todos verdes en macOS arm64:

- Base: argv=4, nil=7, nil2=7, parens=9, sizeof=16, str_test=3, fmt_test=4, vec_test=20, ast_test=33, type_test=9, primary_test=42, expr_test1=146, stmt_test=5, prog_test=42.
- Runtime: `write_test.tt` crea `/tmp/tetsuo_write_test.txt` con `vec\n`; `macos_hello.tt` imprime + exit=0.
- Hito 14: equivalencia numérica lexer stage1↔stage0 sobre 6 samples.
- Hito 15.7-8: parser stage1 sobre 6 samples reales rc=55 sin SEGV.
- Hito 16: ir smokes (ir=3, lower_int=3, lower_ret=2, lower_let=4, lower_if=9, lower_while=6, lower_cmp=4, lower_call=2, lower_mem=8, lower_prog=2, lower_regalloc=3, lower_str=7).
- Hito 16.9: `parse_locals_test.tt` rc=1 (resolución `var_index`).
- Hito 17: `hex4_test.tt`=4, `emit_movi_test.tt`=24, `emit_prologue_test.tt`=174, `emit_instr_test.tt`=59, `codegen_e2e_build.sh` **rc=42**.
- Hito 18: `main_e2e_build.sh` **rc=42** (stage1 driver argv-driven → binario ejecutable).

## Gaps pendientes para fixpoint completo (hito 19.b)

Stage1 emite binarios ejecutables reales, pero NO puede aún compilarse a sí mismo. Reproductor: `./build/main tests/macos_hello.tt` segfaultea al llegar a `msg.ptr`. Los 3 gaps identificados:

1. **`EX_VAR` con `inner!=nil`** (struct/str field access como `msg.ptr`, `lx.src`) — `lower_expr` ignora `inner`; hay que computar offset de campo dentro del struct base y emitir `IR_ADDR_LOCAL + IR_LOAD_MEM`.
2. **`EX_DEREF` con `rhs!=nil`** (array indexing `arr[i]`) — `lower_expr` no combina `inner` (base) con `rhs` (índice) para calcular dirección.
3. **Resolución de layout de struct** durante lowering — necesita mirar `type.decl.fields[k]` para saber offset y width. Hoy `type_width` sólo maneja tipos primitivos.

Cerrar los 3 = **hito 19.b fixpoint completo** con diff bit-a-bit `.s` stage1 vs stage0 sobre el combined de 2517 líneas.

## Notas históricas

- **Hito 15.7-8**: bug bloqueante SEGV en parser stage1 sobre `return IDENT` — causa raíz en stage0 `lookup_local` (devolvía primera coincidencia por nombre en lugar de la más reciente). Fix: walk-backwards. Detalle completo en `git log --grep="lookup_local"`.
- **Hito 17.3**: fix crítico en stage0 `src/codegen.c` — literales str en `__TEXT,__cstring` requieren null-termination (`.byte 0x00` extra); sin ello el linker macOS mergea sufijos y corrompe `.ptr` de literales cuando hay >60. Bug latente hasta que codegen.tt lo destapó.

## Contexto del contract (para retomar)

- `.github/copilot-instructions.md`: contract con prelude+cierre. Cada reply que mute archivos debe abrir graph session.
- Modo caveman ultra desde turn 1, español.
- Graft-first cuando aplique.
- No comentarios en código nuevo salvo petición explícita.

## Sesiones graph consumidas

Todas cerradas en `finish@1` salvo la rechazada:

- `gs-ea141b5a` (15.1), `gs-deb2f01f` (15.2), `gs-a5bba9f7` (15.2b), `gs-1bfdc82a` (15.3), `gs-56c3e7e7` (15.4), `gs-506069e5` (15.5), `gs-29f0d69f` (15.6), `gs-f8e64546` (15.7-8 pausada)
- `gs-37de64f2` (16.7), `gs-c8678b3c` (16.8), `gs-8dcbda90` (16.9 var_index)
- `gs-16f8c90e` (17 rechazada por gate como high-risk → subdividida en 17.1-17.5)
- `gs-7dbec489` (17.1), `gs-ab7adf09` (17.2), `gs-e6d13e5a` (17.3), `gs-440e6cd7` (17.4), `gs-a4749e6a` (17.5)
- `gs-54ea6dec` (18), `gs-f2dd654b` (19 P1)
- `gs-d35ed973` (limpieza state doc)
