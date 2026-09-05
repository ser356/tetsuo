# tetsuo self-hosting state (verified 2026-09-05)

Convergent macOS ARM64 seed: `bootstrap/tetsuoc.macho`, 214766 bytes,
SHA-256 `d1cb27187332344e6f5f2d800005fc7043f15506b6d6ef59dc0c041d3f5eff83`.

## Native Linux AArch64 — 2026-09-05

`--emit=elf` generates a direct AArch64 ELF64 with an `argc/argv` entry point,
RX/RW segments and Linux syscalls with no shim. `bootstrap/tetsuoc.elf` is the
native seed; the ELF fixpoint and the rc=42 smoke test run with no
assembler/linker whenever `qemu-aarch64` is available. Seed: 196608 bytes,
SHA-256 `495986b6473348e0fae0c400003ea99cc47ff44784fa3dcac1667a8d553a64b0`.

## Windows ARM64 — 2026-09-05

`--emit=pe-arm64` generates an ARM64 PE32+ with `.text/.idata/.bss`, an entry
point that obtains `argc/argv`, and an fd runtime through `msvcrt.dll` imports.
Seed `bootstrap/tetsuoc-arm64.exe`: 196608 bytes, SHA-256
`716fc3b0e57ddf09f2651279e97bfcef6903231664eb099ef1f986b0707bd290`.
Headers, IAT and calls are validated structurally; execution/fixpoint requires
real Windows ARM64.

## Windows x64 — 2026-09-05

`--target=windows-x64` covers the whole IR, the Windows x64 ABI, strings, BSS
and an fd runtime through `msvcrt.dll`. `tools/link_pe_x64.py` converts AMD64
COFF into a deterministic PE32+ with no external Python dependencies. Seed
`bootstrap/tetsuoc-x64.exe`: 596480 bytes, SHA-256
`e97127e9c37bfaed2ec60912b0bc1a3e3c665aabd69e4c9f5a27b60963c27502`.
Headers, entry point, relocations, IAT and imports are validated structurally;
execution/fixpoint requires real Windows x64.

## Diagnostics for agents — 2026-09-05

`--diagnostics=json` emits JSON Lines in English with a stable code, path, line,
column, absolute byte span, message and a `fix` field. Seed: 181742 bytes,
SHA-256 `24fb45607836e393d5501436717f866b92d9864206a07344cde985f73552f573`.
Parser, checker, preprocessor and fatal errors share the same schema with no
mixed text.

The checker is closed for arguments, `return` with and without a value, `let`,
assignment, store, dereference, indexing and arithmetic; every critical class
has a stable JSON code and a positioned negative test.

The anti-interference productions E0201-E0208 detect `fn`, `pub`, `mut`, `int`,
`printf`, `malloc`, `#include` and `/* */`, with a literal replacement and no
false positives inside strings or line comments. Seed: 181742 bytes, SHA-256
`f7a16abf966ac5d92dfe9a7bd2cbcabd6c4d3d6ccf5a656f2062f17bd719ef15`.

## Semantic checking 1.a — 2026-09-04

Added a `parse -> check -> lower` pass to reject undeclared functions and
incorrect arity, `syscall` and `syscall_checked` included. The negative suite
checks code 2, path, line, column and message. Seed regenerated from the
convergent stage2: 148718 bytes, SHA-256
`7e26556b7acb3ba1c2747774bdcbd671a56ce0056a8275d6a81da647ba75e2bd`.

## Type compatibility 1.b — 2026-09-04

Validated arguments, returns with and without a value, explicit `let` and
assignments by type class, dereference, indices and arithmetic; integers keep
their existing width conversions.
Seed regenerated from the convergent stage2: 148718 bytes, SHA-256
`7745158eeb68e491b3480c0de477cbee432a1d17605c72f1dcfe7abc43e79bed`.

## Semantic diagnostics 1.c — 2026-09-04

`Expr` stores a source span and the checker preserves path, line and column
after expanding imports. Added literal and import tests; non-assignable targets
are rejected before lowering. Seed: 165230 bytes, SHA-256
`bbfbcdf82c93c63a0923be24eed45ade8d63317656fcd95884c6e7f3ff91101c`.

## Structural allocations 2.a — 2026-09-04

Every allocation of AST, parser and IR structs uses `sizeof(T)`. The only
numeric `arena_take` calls left in `src/` are arrays and capacities. The
`compiler_sizeof_test.tt` test pins 16 layouts; lexer, codegen and Mach-O
allocate no structs in the arena. A mechanical change: seed and fixpoint remain
identical.

## Preprocessed buffer 3.2 — 2026-09-04

`PP_OUT` goes from 1 MiB to 4 MiB. `pp_large_build.sh` expands five imports up
to 1.15 MiB and compiles the result with stage1. Seed: 165230 bytes, SHA-256
`58d2770934c022ca86588b47b7cce08d8c81bf11803f616bad147812ee334288`.

## Dynamic imports 3.1 — 2026-09-04

The fixed 32-path guard was replaced by a `Vec` in the arena. Global state is
reset per compilation and malformed imports fail explicitly. Tested with 40
imports. Seed: 165230 bytes, SHA-256
`20a59f5fe76ebbc23760893adec7c51bd033d3591611ad40b2ab7870c0ccf433`.

## Dynamic loop stacks 3.4 — 2026-09-04

The `break` and `continue` stacks grow in the arena; the limit of 16 is gone.
Tested with 20 nested `while` loops. Seed: 165230 bytes, SHA-256
`4b6cda3e85664dd1351948cd368deff54ecaa8a3f3f6e9251fe0444c1c1bbc04`.

## Performance baseline 4.a — 2026-09-04

Three ABI kernels compare tetsuo, Clang `-O0` and `-O2`, with shared oracles.
Local sample: tetsuo 0.163/0.240/0.130 s; O0 0.156/0.235/0.109 s; O2
0.023/0.203/0.019 s for bytes/arithmetic/calls. Fixpoint: 0.76 s.
Tetsuo lands close to O0; bytes and calls justify later optimization.

## Struct layout 2.b(i) — 2026-09-04

`Field.offset` and `StructDecl.size/align` compute natural alignment capped at
8. A mixed test confirms offsets 0/4/8, size 16 and alignment 8. This submilestone
is metadata only: `type_width` and accesses change in later steps. Seed:
165230 bytes, SHA-256
`26bf507b8df6deea3024751af49c2098bd71b6c70375277e4ac8ae7efda9d0e6`.

## Struct widths 2.b(iii) — 2026-09-04

`type_width(T_STRUCT)` uses `StructDecl.size`; `sizeof(Mixed)` returns 16.
Access offsets stay isolated for 2.b(iv). Seed: 165230 bytes, SHA-256
`e62938aa631cf4f7e990697c3db11cb42bece99994415075060afe5e17bf97d0`.

## Field offsets 2.b(iv) — 2026-09-04

Access through `*struct` and local structs uses `Field.offset`, not `index*8`.
AST and runtime tests cover mixed fields; `gp_acceptance` keeps its result.
Seed: 165230 bytes, SHA-256
`19626fdb176490c60a813e2de5575a79547df11c7e578223514281d52bbbdf28`.

## Field widths and the C ABI 2.b(v) — 2026-09-04

Loads and stores use the field width in both backends. A C harness confirms
layout 0/4/8, size 16, a C→tetsuo read and a tetsuo→C write.

## Constant folding 4.b.1 — 2026-09-04

`lower_expr` collapses safe constant `u64` binaries into a single `IR_MOVI`;
div/mod by zero and out-of-range shifts keep the runtime path. Seed: 165230
bytes, SHA-256 `84f2fb4e2d90e2cef32979ef94115b406acb2fc20fc497522a7268ed30d4ea59`.

## Register bank 4.b.2 — 2026-09-04

Regalloc uses x9-x15 and x19-x28. Values live across calls use callee-saved
registers; both backends save/restore only the necessary pairs. Seed: 165230
bytes, SHA-256 `fe3372391b31eec242f0c8994288cced35c0a6bca1cf75a9411dd7ba7cfc937a`.

## Plan closure — 2026-09-04

The final audit added the rejection of a non-pointer store and runs the C ABI
against stage1. Definitive seed: 165230 bytes, SHA-256
`068aaa2fa1265ed3fd6aa89f82b3fd0767b5073e4d711d91c8ab6f1e26138e2e`.

## Non-8 arrays 2.c — 2026-09-04

Local arrays allocate by total byte width; `[N]u8` and `[N]u32` work.
Seed SHA-256 `7e43d5cc5080ab94bb023838299f7cfd1c21721279437337aabde56bac2cdc87`.

## AAPCS64 stack parameters — 2026-09-04

AST/IR accept dynamic arity; x0-x7 carry the first eight arguments and the rest
use an aligned stack in both backends. A 12-argument call returns 78. Seed
SHA-256 `c6054883539be2bbe360e4692194a346815fea97d44dfda7f24c964171eb4b15`.

## Deterministic BSS order — 2026-09-04

`cgb_bss_layout` assigns offsets by name without mutating AST indices. Reversed
declarations produce identical Mach-O binaries and run with rc=42.

## Volatility and peephole — 2026-09-04

The `@` operator marks loads/stores volatile in the AST and the IR. The peephole
removes consecutive overwritten local stores; it does not rewrite memory.

## Compact frames — 2026-09-04

`stack_of` assigns slots only to locals and spilled temporaries. Both backends
use the map; `frame_bytes` no longer reserves space for temporaries held in
registers.

## Optional items closed — 2026-09-04

Completed non-8 arrays including structs, AAPCS64 stack parameters, stable BSS
order, explicit volatility, a safe peephole and compact frames. Definitive seed:
165230 bytes, SHA-256
`f74fbae3b43a9fd834710b698322b62d923e8704d4269d1556ffb8c00a858b89`.
Extreme coverage includes 520 arguments, an outgoing area larger than 4095 bytes
and a syscall under the compact stack map.

## Videodrome backend — 2026-09-04

Added `--emit=obj`, a freestanding arena with no `bss`, strict UTF-8, `%`, `!`,
`&&` and `||`. `lib/release_name.tt` exposes a reentrant C ABI of eight `u64`
values and is integrated into Videodrome for macOS arm64 with a Rust
implementation as a fallback and differential oracle. Concurrent C smoke tests,
34 Rust tests, Clippy, the tetsuo suite and both fixpoints are green. Constant
tables are deferred: the port does not need them.

## Base library for CLI — 2026-09-03

Added `lib/std.tt`, `lib/string.tt`, `lib/parse.tt` and `lib/stdio.tt`.
`std.tt` gathers runtime, bytes, strings, parsing, formatting, stdio and vector
in the correct import order. Strings covers equality, prefix and search; parsing
accepts decimal `u64`/`i64` with overflow validation; stdio offers buffered
stdout/stderr with explicit initialization and flush. `string_parse_build.sh`
and `stdio_build.sh` are part of `bootstrap/verify.sh`; the suite and both
fixpoints are green.

## Minimal general purpose — 2026-09-03

Tetsuo crosses the threshold of minimal general purpose for CLI and local
systems: functions, recursion, structured control flow, lexical scopes, signed
and unsigned integers, casts, pointers, structs, local arrays, imports and a
basic filesystem. `gp_acceptance.tt` combines these capabilities and
`gp_runtime_fs_test.tt` tests writing, reading and deletion. Both backends, the
suite and the fixpoints remain green. Left as future evolution: namespaces,
aggregates by value, processes, networking, environment, clock and incremental
builds.

## Native verification with no external toolchain — 2026-09-03

Test run on macOS arm64 with `PATH=/nonexistent`, using only the committed seed
`bootstrap/tetsuoc.macho` as the initial compiler:

1. the seed emits stage1 with `--emit=macho`;
2. stage1 emits stage2 with `--emit=macho`;
3. `seed == stage1 == stage2` bit for bit, 115694 bytes, SHA-256
   `362ad21cc18f74900f1381af6aa0b83986245f6831344b1dbb34c222cd00278b`;
4. stage2 compiles a signed Mach-O smoke test that runs with rc=42;
5. the embedded signatures pass the SHA-256 recomputation of all their pages;
6. `otool -L` lists no dynamic libraries.

Conclusion: the bootstrap and the native compilation invoke neither `gcc`,
`clang`, `cc`, `as`, `ld` nor `codesign`. The complete `bootstrap/verify.sh`
battery also finished with `VERIFY OK`. Some textual backend tests keep
deliberate external invocations; they do not belong to the self-contained
`--emit=macho` route.

## COMPLETE FIXPOINT ✅

Milestone 19.b closed: stage1 compiles itself with output **bit-for-bit
identical** to stage0 (`cmp s0.s s1.s` and `cmp s1.s s2.s` clean over the
3157-line combined source), verified end to end on Linux x86_64 through
qemu-aarch64 (`bootstrap/linux/verify_linux.sh`) together with the 33 verify
smoke tests (all with the expected rc) and the `macos_hello.tt` reproducer
(msg.ptr) compiled by stage1. A pass of `bootstrap/verify.sh` on native macOS
arm64 is still pending (new milestone 19 block → `tests/fixpoint_build.sh`).

## Closed and verified milestones
| # | Closed | Notes |
|---|---|---|
| 12 (a-d) | ✅ | argv shim, nil, sizeof(T), optional parens |
| 13 (a-d) | ✅ | runtime lib/str.tt, lib/fmt.tt, lib/vec.tt, io_open_write in tests/io.tt |
| 14 (a-c) | ✅ | KIND_NAMES stage0 fixed; numeric lexer equivalence stage1↔stage0 over 6 samples |
| 15.1 | ✅ | `lib/ast.tt`, separate 8 MB AST arena (`AST_BUF` + `ast_init`) |
| 15.2 | ✅ | `src/parser.tt` with `PrimType`, `Type`, `mk_prim`, `mk_ptr`, `type_width` |
| 15.2b | ✅ | stage1 lexer parity with stage0: `TK_BSS=11`, `TK_NIL=12`, `TK_SIZEOF=13` (every later TK_* +3) + kw_kind |
| 15.3 | ✅ | `EX_*` + `OP_*` enums + `struct Expr` (15 fields, 120 bytes) + bss `LX_STATE`/`TOK_CUR` + `ps_init/advance/kind` + `mk_expr` + `parse_primary` (NUM/NIL/IDENT/STRING) |
| 15.4 | ✅ | `parse_unary` (`@`,`&`) + `bin_prec` + Pratt `parse_expr` with precedences 6..1 |
| 15.5 | ✅ | `Stmt`, `parse_stmt` (LET/RETURN/IF/WHILE/LOOP/BREAK/EXPR/ASSIGN), `parse_block`, `parse_type` (`*T`, u8/u32/u64/str, T_STRUCT fallback) + `ps_expect`/`ps_accept`/`bytes_eq_at` |
| 15.6 | ✅ | `Program/Func/Param/ConstItem/BssItem/StructDecl/Field` structs + `parse_fun/parse_const_decl/parse_bss_decl/parse_struct_decl` + `parse(ar,src,len)` driver |
| 15.7-8 | ✅ | `lookup_local` walk-backwards fix (lexical shadowing). `parser_test` runs with no SEGV over 6 real samples; smoke test added to `bootstrap/verify.sh` with an rc=55 sentinel |
| 16.1 | ✅ | `src/ir.tt` skeleton: 4 MB IR arena + 19 `IR_*` constants + `struct Ins` (15 fields, 120 B) + `struct IrFn` (14 fields, 112 B with head+tail) + `mk_ins/mk_ir_fn/ir_emit`. Smoke test `ir_test.tt` walks 3 instructions, rc=3 |
| 16.2 | ✅ | `struct B` builder (48 B, `slot_types` fixed cap 4096 over the arena, no realloc) + `mk_builder` + `ir_new_slot` + `lower_expr` for EX_INT and arithmetic EX_BIN (ADD/SUB/MUL/DIV/AND/OR/XOR). Smoke test `lower_int_test.tt` `EX_BIN(3+4)` → 3 instructions, rc=3 |
| 16.3a | ✅ | `lower_stmt` for ST_RETURN + ST_EXPR + `lower_block`. Smoke test `lower_ret_test.tt` `return 5` → 2 instructions, rc=2 |
| 16.3b | ✅ | Expr gains `var_index:u64` (sizeof 128), Stmt gains `local_index:u64` (sizeof 96). `lower_expr` EX_VAR emits `IR_LOAD_LOCAL`; `lower_stmt` ST_LET/ST_ASSIGN emit `IR_STORE_LOCAL`. Smoke test `lower_let_test.tt` `let x=7; return x` → 4 instructions, rc=4. **Note**: the name→`var_index` resolution is still pending; the tests preset the index by hand |
| 16.4 | ✅ | Control flow. `struct B` gains `next_label` + `break_stack` (cap 16 over the arena) + `break_top` (72 B). Helpers `ir_new_label/ir_emit_label/ir_emit_jmp/ir_emit_jz`. `lower_stmt` gains ST_IF (with and without else), ST_WHILE, ST_LOOP, ST_BREAK. Smoke tests `lower_if_test.tt` (if 1 { ret 5 } else { ret 6 } → 9 instructions) and `lower_while_test.tt` (while 0 { break } → 6 instructions) |
| 16.5 | ✅ | Expression and memory batch. `lower_expr`: EX_EQ..EX_GE (helper `lower_cmp` → IR_CMPEQ..CMPGE), EX_ADDR (IR_ADDR_LOCAL), EX_DEREF (IR_LOAD_MEM), EX_CALL (arg_slots reserved in the arena + IR_CALL). `lower_stmt` ST_STORE emits IR_STORE_MEM (`expr`=ptr, `init`=val). Smoke tests cmp rc=4, call rc=2, mem rc=8 |
| 16.6 | ✅ | Driver `lower_one_fn(ar,sf) → *IrFn` + `lower(ar,prog) → *IrFn` head. It walks `Program.funcs`, creates one IrFn per Func, `lower_block(body)`, populates `nslots=max_slot`. Smoke test `lower_prog_test.tt` Program{return 42} → head IrFn with 2 instructions, rc=2 |
| 16.7 | ✅ | Linear regalloc + `frame_bytes`. `const NREGS:u64=7` + helpers `ir_count_ins`, `ir_has_dst`, `collect_uses(i,buf:*u64)->nu`. `regalloc(ar,fn)`: reserves arr/last_use/def_idx/cross/call_ix/reg_of in the arena, sentinel=n for last_use/def_idx and NREGS for reg_of, cross-CALL through call_ix, linear scan with `is_free:[u64;NREGS]` (no bitshift and no ~, unsupported). `finalize_frame(fn)`: `nslots*8` rounded up to 16 with div/mul. `lower` invokes `regalloc(ar,f) + finalize_frame(f)` per function. IR_RET convention: `.a` is always a valid slot → `lower_stmt ST_RETURN` emits MOVI 0 when `ret_val==nil`. Smoke test `lower_regalloc_test.tt` Program{return 3+4} → nslots=3, frame_bytes=32, reg_of!=nil, rc=3 |
| 16.8 | ✅ | EX_STRLIT + a shared `str_id` table. Expr gains `str_id:u64` (17 fields, 136 B). Program gains `strs:*StrLit`+`nstrs:u64` (48 B). New `struct StrLit{id,bytes,slen,next}` (32 B) + bss `STR_HEAD`/`STR_COUNT`/`STR_TAIL` + `str_table_init`/`str_table_add`. `parse_primary` TK_STRING extracts `str_bytes = LX_STATE.src+t.start+1`, `str_len = t.tlen-2`, invokes `str_table_add` and stores `str_id`. `parse()` initializes the table and dumps `STR_HEAD/COUNT` into `p.strs/p.nstrs`. `lower_expr` EX_STRLIT emits IR_LABEL_ADDR with `str_id`. Smoke test `lower_str_test.tt` builds `EX_STRLIT(str_id=7)` by hand → rc=7 |
| 16.9 | ✅ | `var_index`/`local_index` resolution in the parser. New `struct Local{name_start,name_len,type}` (24 B). Func gains `locals:**Local`+`nlocals:u64` (72 B, fixed cap 256). bss `CUR_FUNC` + helpers `cur_func_set/get`, `bytes_eq_off`, `add_local`, `lookup_local` (walk-backwards). `parse_fun` sets CUR_FUNC and adds the params as locals 0..nparams-1. `parse_stmt` ST_LET calls `add_local` and sets `local_index`. `parse_stmt` (assign): if the lhs is EX_VAR it copies `var_index → local_index`. `parse_primary` TK_IDENT resolves `var_index = lookup_local(...)`. The Stmt/Param/Local/Func structures were reordered before parse_primary to satisfy stage0's forward refs. Smoke test `parse_locals_test.tt` parses+lowers `fun main()->u64{let a:u64=1;let b:u64=2;return b}` → the first IR_LOAD_LOCAL.local = 1 (b) |
| 17.1 | ✅ | `out_hex4(o,v)` + `out_nibble(o,n)` in `lib/fmt.tt`. 4 lowercase hex digits MSB→LSB through div (no bitshift and no AND). Smoke test rc=4, bytes_eq against `'002a'` |
| 17.2 | ✅ | `src/codegen.tt` skeleton. `TGT_VIRT`/`TGT_MACOS` constants, bss `G_TARGET` + `set_target`/`get_target`, helpers `out_reg_x`/`out_reg_w`, and `emit_movi(o,xreg_r,imm)` (movz/movk chain through div by 65536). Smoke test rc=24, bytes_eq against `'    movz    x9, #0x002a\n'` |
| 17.3 | ✅ | `emit_prologue(o,fn)` (`.globl name`+`stp x29,x30`+`mov x29,sp`+`sub sp` when frame_bytes>0) + `emit_epilogue(o,fn,epi_label)` (`.L{n}:`+`add sp`+`ldp x29,x30`+`ret`). Smoke test rc=174, bytes_eq. **Bonus critical stage0 fix**: `src/codegen.c` now null-terminates str literals in `__TEXT,__cstring` (an extra `.byte 0x00`) — without it `ld` merges literals that share suffixes and corrupts `s.ptr` with >60 literals |
| 17.4 | ✅ | `emit_instr(o,fn,i,epi_label)` chain over IR_MOVI/LABEL_ADDR/ADDR_LOCAL/LOAD_LOCAL/STORE_LOCAL/LOAD_MEM/STORE_MEM/BINOP/CMPxx/CALL/RET/JMP/JZ/LABEL. Helpers `out_binop_mnemonic`, `out_cc`, `emit_load_slot_to_x`, `emit_spill_x`, `ensure_src_x`, `emit_i_*`. Smoke test `emit_instr_test.tt` IR_MOVI(dst=0,imm=99)+IR_RET(a=0) → exactly 59 bytes |
| 17.5 | ✅ | Driver `codegen(o,target,prog,funcs)` + `emit_fn`, `emit_text_section`, `emit_strings` (with null termination), `emit_macos_start`, `emit_string_byte`. `codegen_e2e_test.tt` parses+lowers+codegens `fun main()->u64{return 42}` → `/tmp/tt_stage1.s`; clang -c + clang -e _tt_start + run → **rc=42**. stage1 emits real executables |
| 18 | ✅ | `src/main.tt`, an argv-driven driver (37 lines): `read_all(path,buf,cap)` through `io_open_read`+a loop of `io_read`+`io_close`. `main(argc,argv)` takes input.tt from `argv[argc-3]` and output.s from `argv[argc-1]`, parse+lower+codegen to a file. Bonus: `codegen()` computes `max_label` by walking IR_LABEL/JMP/JZ to avoid colliding with control flow labels. Smoke test `main_e2e_build.sh`: compiles `src/main.tt` as a stage1 binary, runs it with `/tmp/tt_return42.tt -o /tmp/tt_stage1.s`, clang links → rc=42 |
| 19 | 🟡 P1 | **Structural completeness.** Added `emit_bsses` to the codegen (`__DATA,__bss,_name,size,3` per macos). Critical fix: `emit_i_call` used an uninitialized `get_src()` bss → segfault on any CALL; migrated to `LX_STATE.src`. Functional smoke test: stage1 compiles `fun helper(){return 42} fun main(){return helper()}` end to end → an rc=42 binary. **Gaps for the complete fixpoint (stage1 compiling stage1)**: (a) EX_VAR with `inner!=nil` (struct field access `msg.ptr`, `lx.src`) not lowered — it requires resolving the struct/str layout during lowering; (b) EX_DEREF with `inner+rhs` (indexing `arr[i]`) not lowered; (c) type resolution in a runtime `type_width` for struct fields. Reproducer: `./build/main tests/macos_hello.tt` segfaults on reaching `msg.ptr`. Deferred |

| 23 | ✅ | **`import 'path'` preprocessor.** `src/main.tt` recognizes `import '<path>'` lines before the lexer and inlines them recursively with dedup by path (bss `PP_SEEN_PTRS`/`PP_SEEN_LENS`, a 4 MB `PP_ARENA_BUF` arena, a 512 KB `PP_OUT` output buffer). Smoke test `tests/import_build.sh`: `tests/import_b.tt` imports `tests/import_a.tt` (`a()→41`) and `main()` returns `a()+1` = **42**. It removes the need to concatenate files by hand from the build scripts |
| 24.d 🟡 | In progress | **Binary Mach-O writer.** `src/macho.tt` brings in the `out_u32_le`/`out_u64_le`/`out_zeros`/`out_segname` primitives plus a `write_macho_exit42` skeleton that emits headers + the minimal LC_SEGMENT_64/LC_MAIN for an `exit(42)` executable. Smoke test `tests/macho42_test.tt` writes the binary to `/tmp/tt_macho42` (it still requires an external `codesign -s -` before running; the embedded ad-hoc signature is 24.f). Earlier milestones of the Mach-O plan (`docs/MACHO-PLAN.md`): 24.a `<<`/`>>` shifts **pending**, 24.b AArch64 encoder **pending**, 24.c SHA-256 **pending** |
| 19.b | ✅ | **Complete fixpoint.** Full stage1↔stage0 parity: (1) parser.tt with type propagation in Expr, desugaring of `x.field` (str → var_index/+1; struct by value → var_index+fi; *struct → DEREF(ADD(base, 8*fi))) and of `p[i]` (scaled by the pointee's type_width), const→EX_INT / bss→EX_EXTERN resolution, literal unescaping (\n,\t,\\,\',\0,\xNN), real argument capture in EX_CALL, u32 type in calls (u64 for syscall), `else if`, assignment to a DEREF lvalue → ST_STORE, extra locals for str (+1) and struct by value (nfields-1), nparams+=2 for str params, ConstItem.value evaluated (literal only). (2) ir.tt: base slots at nlocals (temporaries no longer trample locals), slot_types/param_types/nlocals populated, widths by type in LOAD/STORE_LOCAL/MEM, BINOP (4 by default) and CMP (the lhs width), label counter shared between functions (bss IR_NEXT_LABEL, reset in lower()), ST_IF labels assigned in stage0 order (else after body), let str → LABEL_ADDR+STORE+MOVI len+STORE, str argument expansion in CALL (ptr+len), EX_EXTERN → LABEL_ADDR with a name, void RET with no MOVI (imm=1 flag). (3) codegen.tt: w/x registers by width (ldrb/strb, ldr/str w), cset to w, cbz w, syscall (x16 + svc #0x80 + BSD), bl through emit_sym, LABEL_ADDR in symbol mode (_NAME@PAGE/@PAGEOFF), param spilling by width (strb/str w/str x), RET x0/w0 depending on ret_type and omitted for void, _tt_start after the text section (stage0 order). (4) Frames >4095 bytes: `movz x16` + `sub/add sp, sp, x16` in both codegens (stage0 codegen.c and codegen.tt). AST/IR arenas raised to 16 MB |

With that the bootstrap is **complete**: `tests/fixpoint_build.sh` builds stage1
with stage0, stage1 compiles its own combined source (s1.s identical to s0.s),
stage2 reproduces s1.s, and stage1 compiles macos_hello.tt.

## Milestone 24 (a–f): ad-hoc signed Mach-O — CLOSED

The plan is in `docs/MACHO-PLAN.md`. stage1 emits a directly executable ad-hoc
signed AArch64 Mach-O, with no `clang`/`as`/`ld`/`codesign`.

| # | Closed | Notes |
|---|---------|-------|
| 24.a | ✅ | `<<`/`>>` shifts: `TK_LSHIFT/TK_RSHIFT` tokens, `OP_SHL/OP_SHR` (prec 5), `lsl/lsr` mnemonics in the codegen (through IR_BINOP). **Seed regenerated**, fixpoint re-verified. Smoke test `shifts_test.tt` |
| 24.b | ✅ | `src/asm.tt`: 28 AArch64 encoders (`enc_movz`…`enc_ret`). Smoke test `asm_test.tt` against a golden table verified with `aarch64-linux-gnu-as` |
| 24.c | ✅ | `lib/sha256.tt`: SHA-256 in u64 masked to 32 bits. Smoke test `sha256_test.tt`, vectors `'a'*n` (n∈{0,1,55,56,63,64,120,128}) against `hashlib` — it covers both padding paths |
| 24.d+f | ✅ | `src/macho.tt`: the complete image in memory, the 10 required load commands + the embedded ad-hoc signature (CS_SuperBlob + CS_CodeDirectory v0x20400, SHA-256 hashes of 4KB pages). `emit_macho_signed` (exit N) and `emit_macho_image` (arbitrary code). Smoke test `macho42_test.tt`; `bootstrap/linux/check_macho.py` recomputes and compares the page hashes (equivalent to `codesign -v`) and validates the structure; it parses cleanly with `llvm-objdump`/`macholib` |
| 24.e | ✅ | `src/codegen_bytes.tt`: codegen to ARM64 bytes (two passes through a label table + fixups), reusing `asm.tt`. Coverage: prologue/epilogue, params, MOVI, x/w/b locals, memory, every binop, comparisons+cset, bl (resolved by offset), recursion, syscall, control flow and string literals (adrp+add in `__cstring`, relocated against the final vaddr in `emit_macho_code`). Smoke test `codegen_bytes_test.tt`: a program with a call + a comparison + a literal → a signed Mach-O that runs under qemu (`bootstrap/linux/macho_run.py` jumps to `main`) and returns 42. **Pending (24.g)**: bss in `__DATA` through the byte route (the FX_ADRPB/FX_PGOFB hooks are wired); the textual route already supports it |

Extended Linux verification in `bootstrap/linux/verify_linux.sh` (fixpoint +
24.a–24.f smoke tests) and parallel macOS entries in `bootstrap/verify.sh`
(`tests/macho_build.sh`, `tests/codegen_bytes_build.sh` run the signed binaries
natively). New Linux harness: `run_tt.sh` (builds+runs a .tt under qemu),
`check_macho.py`, `macho_run.py`.

## Current verify (35/35 green)

The complete `bootstrap/verify.sh` block — all green on macOS arm64:

- Base: argv=4, nil=7, nil2=7, parens=9, sizeof=16, str_test=3, fmt_test=4, vec_test=20, ast_test=33, type_test=9, primary_test=42, expr_test1=146, stmt_test=5, prog_test=42.
- Runtime: `write_test.tt` creates `/tmp/tetsuo_write_test.txt` with `vec\n`; `macos_hello.tt` prints + exit=0.
- Milestone 14: numeric lexer equivalence stage1↔stage0 over 6 samples.
- Milestone 15.7-8: stage1 parser over 6 real samples, rc=55, no SEGV.
- Milestone 16: ir smoke tests (ir=3, lower_int=3, lower_ret=2, lower_let=4, lower_if=9, lower_while=6, lower_cmp=4, lower_call=2, lower_mem=8, lower_prog=2, lower_regalloc=3, lower_str=7).
- Milestone 16.9: `parse_locals_test.tt` rc=1 (`var_index` resolution).
- Milestone 17: `hex4_test.tt`=4, `emit_movi_test.tt`=24, `emit_prologue_test.tt`=174, `emit_instr_test.tt`=59, `codegen_e2e_build.sh` **rc=42**.
- Milestone 18: `main_e2e_build.sh` **rc=42** (argv-driven stage1 driver → an executable binary).
- Milestone 23: `tests/import_build.sh` **rc=42** (`import 'tests/import_a.tt'` inlined into `tests/import_b.tt`, `main() = a() + 1 = 42`).

## Milestone 19.b gaps — CLOSED

The 3 gaps (field access, indexing, struct layout) were closed by mirroring
stage0's strategy: the **parser** desugars `x.field` and `p[i]` into a reindexed
EX_VAR / DEREF(ADD) with propagated types, so that the lowering does not need to
know about layouts. `parse_postfix` in parser.tt is now a 1:1 port of parser.c.
The bit-for-bit `.s` diff of stage1 vs stage0 over the combined source (3157
lines after the changes) is clean.

## Verification on Linux (new)

`bootstrap/linux/verify_linux.sh` allows verifying the fixpoint without macOS:
it translates the emitted Mach-O asm into aarch64 ELF
(`bootstrap/linux/macho2elf.sh`: sections, @PAGE/@PAGEOFF → :lo12:, .zerofill →
.comm, `svc #0x80` → `bl _tt_sys`) and links `bootstrap/linux/shim.s` (BSD→Linux
syscall translation + a `_linux_start` entry point that loads argc/argv). Run
under qemu-aarch64: bit-for-bit fixpoint + hello + the 33 smoke tests + the
parser over 6 samples (rc=55) + the numeric lexer equivalence, all green on
2026-08-25.

## Verification of the `--emit=macho` path on Linux (milestone 24.g C3a)

`bootstrap/linux/verify_macho_linux.sh` closes the remaining gap: it checks the
**binaries emitted as bytes**, not only the asm. For every `verify.sh` test:

1. stage1 emits the ad-hoc signed Mach-O with `--emit=macho`;
2. `check_macho.py` recomputes the SHA-256 hashes of every 4KB page against the
   final file (the same thing `codesign -v` does);
3. `bootstrap/linux/macho_exec.py` builds an ELF whose PT_LOAD entries **trace
   the LC_SEGMENT_64 of the Mach-O** — `__TEXT` r-x at 0x100000000 from the
   file, `__DATA/__bss` rw- anonymous at its real vmaddr and with its full
   vmsize — and runs it under qemu-aarch64 (rewriting `svc #0x80` to a BSD→Linux
   shim).

Since the addresses are the same as on macOS, the PC-relative adrp/add pairs and
the fixups against `__bss` are exercised as they are. It serves to separate the
two worlds when an emitted binary dies on macOS: if it fails here the problem is
the codegen or the fixups; if it passes, the code and the layout are correct and
the failure is in the container (signature, load commands, kernel cache).

State on 2026-08-26: 36 green `--emit=macho` binaries (including `vec_test` with
a 7-page `__TEXT`), a green `macho_multipage` reproducer and a green byte
fixpoint `s1 == s2`.

## Historical notes

- **Milestone 24.g C3a**: `pp_expand` read every `.tt` into a fixed 128KB buffer without checking the cap: any larger source was truncated **silently** and the error showed up much later as a syntax failure in the middle of the file (`verify_linux.sh` over the 134KB combined source uncovered it). It now reserves 1MB, returns the leftover to the arena and aborts with a message if the file does not fit.
- **Milestone 24.g C3a**: `LC_UUID` was a hardcoded constant, identical across every emitted binary. It is now derived from the SHA-256 of the code (with the RFC 4122 version/variant bits), so that two different binaries never share an identity as far as the macOS caches are concerned.
- **Milestone 15.7-8**: blocking SEGV bug in the stage1 parser on `return IDENT` — root cause in stage0's `lookup_local` (it returned the first match by name instead of the most recent one). Fix: walk backwards. Full detail in `git log --grep="lookup_local"`.
- **Milestone 17.3**: critical fix in stage0's `src/codegen.c` — str literals in `__TEXT,__cstring` require null termination (an extra `.byte 0x00`); without it the macOS linker merges suffixes and corrupts the `.ptr` of literals once there are >60. A latent bug until codegen.tt uncovered it.

## Contract context (for picking this back up)

- `.github/copilot-instructions.md`: the contract with a prelude+closing. Every reply that mutates files must open a graph session.
- Ultra caveman mode from turn 1, in Spanish.
- Graft-first where applicable.
- No comments in new code unless explicitly requested.

## Graph sessions consumed

All closed at `finish@1` except the rejected one:

- `gs-ea141b5a` (15.1), `gs-deb2f01f` (15.2), `gs-a5bba9f7` (15.2b), `gs-1bfdc82a` (15.3), `gs-56c3e7e7` (15.4), `gs-506069e5` (15.5), `gs-29f0d69f` (15.6), `gs-f8e64546` (15.7-8 paused)
- `gs-37de64f2` (16.7), `gs-c8678b3c` (16.8), `gs-8dcbda90` (16.9 var_index)
- `gs-16f8c90e` (17 rejected by the gate as high-risk → split into 17.1-17.5)
- `gs-7dbec489` (17.1), `gs-ab7adf09` (17.2), `gs-e6d13e5a` (17.3), `gs-440e6cd7` (17.4), `gs-a4749e6a` (17.5)
- `gs-54ea6dec` (18), `gs-f2dd654b` (19 P1)
- `gs-d35ed973` (state doc cleanup)
