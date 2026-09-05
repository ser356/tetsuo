# tetsuo

## Agent context

Use [AGENT-CONTEXT.md](AGENT-CONTEXT.md) as the single versioned context pack.
It contains the language reference, idioms, twenty recipes, stable diagnostic
catalog, source hashes, and tokens-to-competence metric. Regenerate with
`python3 tools/build_agent_context.py` and verify with `--check`.

Compiler for a minimal general-purpose language aimed at CLI and systems
programming, **fully self-hosted**: written in and compiled by itself. It
includes signed/unsigned integers, casts, functions, structured control flow,
lexical scopes, pointers, structs, local arrays, imports and files. It emits
AArch64 for:

- **virt** — bare metal on QEMU `-M virt` (Cortex-A72), I/O through a PL011 UART.
- **macos** — user-mode executable on macOS arm64, I/O through `syscall`.
- **linux** — AArch64 ELF assembly through `--target=linux` and a syscall shim.

## Repository layout

```
src/            stage1 compiler in pure tetsuo
  lexer.tt        tokenizer
  parser.tt       recursive descent parser + AST + types
  ir.tt           lowering to linear IR + linear regalloc
  codegen.tt      textual AArch64 emission (.s, macos target)
  macho.tt        binary Mach-O writer + embedded ad-hoc signature
  main.tt         argv-driven CLI: `import` preprocessor + parse + lower + codegen
  runtime/
    io.tt         syscall wrappers (macos target)
lib/            runtime in tetsuo: str.tt, fmt.tt, vec.tt, ast.tt
tests/          .tt test sources + per-target build scripts
bootstrap/
  tetsuoc.s       golden seed asm: stage1's output over itself (~20 kL).
                  Bootstraps the compiler with no dependency on external code.
  verify.sh       smoke test battery + bit-for-bit fixpoint
  linux/          qemu-aarch64 harness to verify the fixpoint on Linux
test.sh         virt pipeline: compile, assemble, link and boot under QEMU
docs/MACHO-PLAN.md  plan of the Mach-O writer + ad-hoc signature (milestones 24.a → 24.f)
LANGUAGE.md     language reference and correct-usage guide
idioms.md       idiomatic patterns observed in real code
SELFHOST-STATE.md  log of the self-hosting progress
```

## Bootstrap

The native bootstrap needs no `gcc`, `clang`, `cc`, `as`, `ld`, `codesign` and
no dynamic libraries. It starts from the signed arm64 Mach-O seed committed in
`bootstrap/tetsuoc.macho`. `tests/macos_build.sh` copies it to `build/main`
when the compiler does not exist.

The seed compiles tetsuo sources directly into arm64 Mach-O executables with an
embedded ad-hoc signature. The historical route from `bootstrap/tetsuoc.s` is
still available to verify the textual backend, but it is not part of the
self-contained bootstrap.

## Using the compiler

```bash
build/main --emit=macho source.tt -o output      # signed Mach-O executable
build/main --emit=obj source.tt -o module.s      # linkable asm, no entry point
build/main source.tt -o output.s                 # legacy textual backend
build/main --dump-tokens source.tt               # prints tokens
build/main --dump-ir     source.tt               # prints the linear IR
```

The driver first runs the `import` preprocessor over the source (a line
`import 'relative/path.tt'` inlines the quoted file recursively; already seen
paths are skipped → no cycles and no duplicates). It then parses, lowers and
emits AArch64. macOS is the default target; Linux is selected with
`--target=linux`.

The `--emit=macho` mode requires no further steps. The textual backend can be
assembled externally for debugging:

```bash
clang -c output.s -o output.o
clang -e _tt_start -o output output.o
./output
```

`--emit=obj` preserves the macOS arm64 C ABI and omits `_tt_start`. Convert its
output with `clang -c module.s -o module.o` and link the object from C or Rust.

## Running programs

### macos target (arm64)

```bash
bash tests/macos_build.sh tests/macos_hello.tt [args...]
```

It generates an entry point with the runtime and compiler imports, invokes
`build/main --emit=macho` and runs the resulting signed Mach-O. It invokes no
external assembler, linker or signing tool.

### virt target (bare metal, QEMU)

Requires `qemu-system-aarch64` and an `aarch64-elf-*` cross toolchain. Note:
the current self-contained CLI offers macOS and Linux; the virt route keeps its
separate pipeline in `test.sh`.

## Primitive library

There is a small library written in tetsuo, with no links against
libc/libSystem. For CLI programs the umbrella module is enough:

```text
import 'lib/std.tt'
```

| module | rough equivalent | current API |
|---|---|---|
| `src/runtime/io.tt` | `stdio` + part of `stdlib` | `io_open_read`, `io_open_write`, `io_read`, `io_write`, `io_close`, `io_exit`, `io_getpid`, `io_unlink`, `io_chdir`, `io_mkdir`, `Arena`, `arena_init`, `arena_take` |
| `lib/arena.tt` | freestanding allocation | `Arena`, `arena_init`, `arena_take` over caller-supplied memory |
| `lib/str.tt` | minimal `string.h` | `bytes_eq`, `mem_copy` |
| `lib/string.tt` | `str` operations | `string_eq`, `string_has_prefix`, `string_find_byte`, `str_next_codepoint` |
| `lib/parse.tt` | numeric conversion | `parse_u64`, `parse_i64` with validation and overflow detection |
| `lib/fmt.tt` | formatting/buffered output | `Out`, `out_init`, `out_flush`, `out_byte`, `out_bytes`, `out_u64`, `out_hex4`, `die_line` |
| `lib/stdio.tt` | stdout/stderr | `stdio_init`, `print`, `println`, `print_u64`, the `e*` variants, `flush`, `eflush` |
| `lib/vec.tt` | dynamic container | `Vec`, `vec_init`, `vec_push`, `vec_get` |
| `lib/ast.tt` | internal support | global AST arena through `ast_init` |

`lib/freestanding.tt` imports arena, bytes, strings, parsing and vector without
adding any `bss`. It is meant for linkable objects; every caller supplies its
own scratch.

`stdio_init` must run before writing and the buffers require `flush` or
`eflush`. `parse_u64`/`parse_i64` return 1 on success and write through the
pointer; they return 0 without modifying the output on invalid input or
overflow.

There is as yet no `printf`, `malloc/free`, `fopen/FILE`, tokenized input,
sockets, processes, environment or clock. `arena_take` replaces `malloc` for
single-lifetime workloads and frees everything when the process ends.

### Verification battery

```bash
bash bootstrap/verify.sh
```

Runs every smoke test plus the bit-for-bit `s0==s1==s2` fixpoint over the
compiler's own combined source. macOS arm64 only: the generated binaries are
AArch64 Mach-O.

To verify on Linux x86_64 without macOS:

```bash
bash bootstrap/linux/verify_linux.sh
```

It uses `qemu-user` plus a BSD→Linux shim to run the emitted Mach-O binaries.

## Modules: `import` as a preprocessor

tetsuo has no separate module system. A "library" is a `.tt` file and
"importing" is a line directive of the preprocessor built into the driver:

```
import 'lib/str.tt'
import 'lib/fmt.tt'

fun main() -> u64 { ... }
```

Rules:

- The directive takes a whole line and comes **before** any declaration.
- The path is relative to the cwd `build/main` is invoked from.
- The expander deduplicates by path: importing the same file twice is a no-op,
  and cycles resolve trivially.
- Backward references (mutual recursion) remain valid only **within** a single
  file; across imported files the order must respect the dependencies exactly
  as if you concatenated them by hand.

Details and idiomatic patterns are in `LANGUAGE.md` and `idioms.md`.

## Status

A minimal general-purpose language for CLI and local systems programs. It does
not yet aim to replace a complete production environment: namespaces,
arrays/structs by value, child processes, networking, environment, clock and
incremental builds are missing.

100% self-hosted. The Mach-O seed produces a compiler identical to itself and
the produced compiler reproduces exactly the same binary again:
`seed == stage1 == stage2`, bit for bit. The `--emit=macho` route includes the
AArch64 encoder, the Mach-O layout, the fixups, SHA-256 and the ad-hoc
signature; it depends on no external toolchain. Most recent native
verification: 2026-09-03. The detailed log is in `SELFHOST-STATE.md`.
