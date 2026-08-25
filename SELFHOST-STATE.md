# Estado del autohospedaje tetsuo (fixpoint cerrado 2026-08-25)

## FIXPOINT COMPLETO ✅

Hito 19.b cerrado: stage1 se compila a sí mismo con salida **bit a bit idéntica** a stage0
(`cmp s0.s s1.s` y `cmp s1.s s2.s` limpios sobre el combined de 3157 líneas), verificado
end-to-end en Linux x86_64 vía qemu-aarch64 (`bootstrap/linux/verify_linux.sh`) junto con
los 33 smokes del verify (todos con el rc esperado) y el reproductor `macos_hello.tt`
(msg.ptr) compilado por stage1. Pendiente una pasada de `bootstrap/verify.sh` en macOS
arm64 nativo (nuevo bloque hito 19 → `tests/fixpoint_build.sh`).

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

| 19.b | ✅ | **Fixpoint completo.** Paridad total stage1↔stage0: (1) parser.tt con propagación de tipos en Expr, desugar de `x.campo` (str → var_index/+1; struct valor → var_index+fi; *struct → DEREF(ADD(base, 8*fi))) y de `p[i]` (escala por type_width del pointee), resolución de const→EX_INT / bss→EX_EXTERN, unescape de literales (\n,\t,\\,\',\0,\xNN), captura real de args en EX_CALL, tipo u32 en calls (u64 syscall), `else if`, asignación a lvalue DEREF → ST_STORE, locals extra para str (+1) y struct por valor (nfields-1), nparams+=2 en params str, ConstItem.value evaluado (solo literal). (2) ir.tt: slots base en nlocals (temps ya no pisan locals), slot_types/param_types/nlocals poblados, widths por tipo en LOAD/STORE_LOCAL/MEM, BINOP (4 por defecto) y CMP (width del lhs), contador de labels compartido entre funciones (bss IR_NEXT_LABEL, reset en lower()), labels de ST_IF asignados en orden stage0 (else tras body), let str → LABEL_ADDR+STORE+MOVI len+STORE, expansión de args str en CALL (ptr+len), EX_EXTERN → LABEL_ADDR con nombre, RET void sin MOVI (flag imm=1). (3) codegen.tt: regs w/x según width (ldrb/strb, ldr/str w), cset a w, cbz w, syscall (x16 + svc #0x80 + BSD), bl via emit_sym, LABEL_ADDR modo símbolo (_NAME@PAGE/@PAGEOFF), spill de params por ancho (strb/str w/str x), RET x0/w0 según ret_type y omitido en void, _tt_start tras la sección de texto (orden stage0). (4) Frames >4095 bytes: `movz x16` + `sub/add sp, sp, x16` en ambos codegens (stage0 codegen.c y codegen.tt). Arenas AST/IR ampliadas a 16 MB |

Con eso el bootstrap **completo**: `tests/fixpoint_build.sh` construye stage1 con stage0, stage1 compila su propio combined (s1.s idéntico a s0.s), stage2 reproduce s1.s, y stage1 compila macos_hello.tt.

## Hito 24 (a–f): Mach-O firmado ad-hoc — CERRADO

Plan en `docs/MACHO-PLAN.md`. stage1 emite un Mach-O AArch64 firmado ad-hoc
ejecutable directo, sin `clang`/`as`/`ld`/`codesign`.

| # | Cerrado | Notas |
|---|---------|-------|
| 24.a | ✅ | Shifts `<<`/`>>`: tokens `TK_LSHIFT/TK_RSHIFT`, `OP_SHL/OP_SHR` (prec 5), mnemónicos `lsl/lsr` en codegen (vía IR_BINOP). **Seed regenerada**, fixpoint re-verificado. Smoke `shifts_test.tt` |
| 24.b | ✅ | `src/asm.tt`: 28 encoders AArch64 (`enc_movz`…`enc_ret`). Smoke `asm_test.tt` contra tabla dorada verificada con `aarch64-linux-gnu-as` |
| 24.c | ✅ | `lib/sha256.tt`: SHA-256 en u64 enmascarado a 32 bits. Smoke `sha256_test.tt`, vectores `'a'*n` (n∈{0,1,55,56,63,64,120,128}) contra `hashlib` — cubre las dos rutas de padding |
| 24.d+f | ✅ | `src/macho.tt`: imagen completa en memoria, 10 load commands requeridos + firma ad-hoc embebida (CS_SuperBlob + CS_CodeDirectory v0x20400, hashes SHA-256 de páginas de 4KB). `emit_macho_signed` (exit N) y `emit_macho_image` (código arbitrario). Smoke `macho42_test.tt`; `bootstrap/linux/check_macho.py` recomputa y compara los hashes de página (equivalente a `codesign -v`) y valida estructura; parsea limpio con `llvm-objdump`/`macholib` |
| 24.e | ✅ | `src/codegen_bytes.tt`: codegen a bytes ARM64 (dos pasadas vía tabla de labels + fixups), reutilizando `asm.tt`. Cobertura: prólogo/epílogo, params, MOVI, locals x/w/b, mem, todos los binops, comparaciones+cset, bl (resuelto por offset), recursión, syscall, control de flujo y literales de cadena (adrp+add en `__cstring`, reubicados contra las vaddr finales en `emit_macho_code`). Smoke `codegen_bytes_test.tt`: programa con llamada + comparación + literal → Mach-O firmado que corre bajo qemu (`bootstrap/linux/macho_run.py` salta a `main`) y devuelve 42. **Pendiente (24.g)**: bss en `__DATA` por la ruta de bytes (hooks FX_ADRPB/FX_PGOFB cableados); la ruta textual ya la soporta |

Verificación Linux ampliada en `bootstrap/linux/verify_linux.sh` (fixpoint +
smokes 24.a–24.f) y entradas paralelas macOS en `bootstrap/verify.sh`
(`tests/macho_build.sh`, `tests/codegen_bytes_build.sh` ejecutan los binarios
firmados nativamente). Nuevo harness Linux: `run_tt.sh` (compila+ejecuta un .tt
bajo qemu), `check_macho.py`, `macho_run.py`.

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

## Gaps del hito 19.b — CERRADOS

Los 3 gaps (field access, indexing, layout de structs) se cerraron espejando la estrategia
de stage0: el **parser** desugariza `x.campo` y `p[i]` a EX_VAR reindexado / DEREF(ADD)
con tipos propagados, de modo que el lowering no necesita conocer layouts. `parse_postfix`
en parser.tt es ahora un port 1:1 de parser.c. El diff bit a bit `.s` stage1 vs stage0
sobre el combined (3157 líneas tras los cambios) es limpio.

## Verificación en Linux (nuevo)

`bootstrap/linux/verify_linux.sh` permite verificar el fixpoint sin macOS: traduce el asm
Mach-O emitido a ELF aarch64 (`bootstrap/linux/macho2elf.sh`: secciones, @PAGE/@PAGEOFF →
:lo12:, .zerofill → .comm, `svc #0x80` → `bl _tt_sys`) y enlaza `bootstrap/linux/shim.s`
(traducción de syscalls BSD→Linux + entry `_linux_start` que carga argc/argv). Ejecutado
bajo qemu-aarch64: fixpoint bit a bit + hello + los 33 smokes + parser sobre 6 samples
(rc=55) + equivalencia numérica del lexer, todo verde el 2026-08-25.

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
