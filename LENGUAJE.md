# tetsuo — language reference and correct usage

Describes the language **exactly as the current compiler accepts it** (stage0,
`src/*.c`). Wherever there is room to write code that compiles but misbehaves,
it is marked with **⚠**. For idiomatic patterns see `idioms.md`.

## Lexical structure

- Comments: `// up to the end of the line`. There are no block comments.
- Identifiers: `[A-Za-z_][A-Za-z0-9_]*`.
- Integers: decimal (`42`) or hexadecimal (`0x40100000`). No signed literals:
  `-1` does not exist as a literal (`-` is always a binary operator).
- Strings: **single** quotes `'hello\n'`. Escapes: `\n \t \\ \' \0 \xNN`.
- Reserved words: `fun let const return if else loop while break struct bss nil
  sizeof continue as`.
- `;` is optional and ignored as a separator.

## Types

| type    | width | description                                   |
|---------|-------|-----------------------------------------------|
| `u8`    | 1     | unsigned byte                                 |
| `u32`   | 4     | 32-bit unsigned integer                       |
| `u64`   | 8     | 64-bit unsigned integer                       |
| `i8`    | 1     | 8-bit signed integer                          |
| `i32`   | 4     | 32-bit signed integer                         |
| `i64`   | 8     | 64-bit signed integer                         |
| `bool`  | 1     | boolean stored as 0/1                         |
| `*T`    | 8     | pointer to `T` (nestable: `**Expr`)           |
| `str`   | 16    | (pointer, length) pair; two 8-byte slots      |
| structs | 8·n   | declared with `struct`; every field takes 8   |

- Signed types use signed division and signed comparisons. Unary negation and
  the postfix casts `expr as T` normalize `i8/i32/u8/u32`.
- `[N]T` declares fixed local arrays. It currently requires 8-byte elements.
- Comparisons return a `u32` 0/1.
- The width of an integer literal is decided by the context (the `let` or the
  parameter that receives it).

## Top-level declarations

A program is a sequence of `const`, `bss`, `struct` and `fun` in any order
**within the same file** (names are resolved after the whole file has been
read, so mutual recursion between functions is valid).

### const

```
const K: u64 = 3
const UART_DR: *u8 = 0x09000000
```

Only an integer literal is admitted as a value. A `const` of pointer type is
the idiom for MMIO registers. In an expression, the name is replaced by its
value.

### bss

```
bss IO_BUF: 65536
```

Reserves a zeroed buffer of N bytes. In an expression, the name evaluates to a
`*u8` pointing at the first byte of the buffer. It is the basis of the arenas
(see `idioms.md`).

### struct

```
struct Node {
    kind: u32,
    lhs:  *Node,
    rhs:  *Node,
}
```

- Commas between fields are optional.
- The name is registered before the fields are read → recursive types through a
  pointer.
- **Layout: every field takes 8 bytes**, whatever its declared type.
  `sizeof(Node)` = number of fields × 8. Use `sizeof(T)` instead of counting by
  hand.

### fun

```
fun putc(c: u8) { ... }             // no return value
fun add(a: u64, b: u64) -> u64 { return a + b }
```

- At most 8 effective parameters (a `str` parameter counts as 2).
- The declared return type decides the width of the `return` and propagates to
  the call sites, including forward and recursive calls. `syscall` returns
  `u64`.

## Statements

```
let x: u64 = 0          // the type annotation is ALWAYS mandatory; init optional
x = x + 1               // assignment to a local
@p = v                  // store through a pointer
if cond { } else if c2 { } else { }
while cond { }
loop { ... break ... }
return                  // or return expr
expr                    // a call as a statement
```

- A `let` with no initializer can be assigned later; reading it first fails to
  compile.
- Taking `&x` marks `x` initialized so as to allow out-params; there is no
  check that the callee writes to it.
- `continue` jumps to the next iteration of the innermost loop.
- `break` only leaves the innermost loop (`loop` or `while`).

### `let` shadowing

Every `let` creates a new slot and **every use resolves to the most recent
declaration preceding it in the text of the function**. This makes the pattern
of one `let e` per branch valid:

```
if k == TK_NUM  { let e: *Expr = mk_expr(ar, EX_INT); e.ival = t.ival; return e }
if k == TK_IDENT { let e: *Expr = mk_expr(ar, EX_VAR); e.var_start = s; return e }
```

Blocks create lexical scopes. An inner name shadows the outer one inside the
block and stops being visible on the way out.

(Historical note: until the `lookup_local` fix, uses resolved to the *first*
declaration of the name — a `let e` in the IDENT branch wrote its own slot but
`e.field` read the slot of the NUM branch, uninitialized. It was the cause of
the stage1 parser segfault with `return IDENT`.)

## Expressions

Precedences, from strongest to weakest:

| level | operators                        |
|-------|----------------------------------|
| unary | `@expr` (deref), `&var` (address), `!expr`, `-expr` |
| postfix | `f(args)`, `.field`, `[i]`, `as T` |
| 6     | `*` `/` `%`                      |
| 5     | `+` `-`                          |
| 4     | `&` (bitwise AND)                |
| 3     | `^`                              |
| 2     | `\|`                             |
| 3     | `==` `!=` `<` `<=` `>` `>=`      |
| 2     | `&&`                             |
| 1     | `\|\|`                           |

- `(expr)` groups.
- `nil` is sugar for the literal `0` (null pointer). Compare it only with
  `==`/`!=`.
- `sizeof(T)` is resolved at compile time (`u64`).
- `&` only on a local variable; `@` only on an expression of pointer type.
- `p[i]` on `p: *T` scales by `sizeof(T)` and dereferences: it is equivalent to
  `@(p + i*sizeof(T))`. As an lvalue: `p[i] = v`.
- `[N]T` declares a fixed local array. The MVP admits 8-byte elements, indexing
  and indexed writes; it admits neither copying nor aggregate initializers.
- `.field`:
  - on `s: str` → `.ptr` (`*u8`) and `.len` (`u64`), **on locals only**;
  - on a local struct → direct access to the slot;
  - on `p: *Struct` → loads/stores at `p + 8*field_index`.
- String literal: **only** as the initializer of `let s: str = '...'`.
  ⚠ There is no implicit null terminator; for syscalls add `\0` by hand.

## Intrinsics

- `syscall(n, a, b, c)` — the only door to the system. On macOS it emits the
  BSD trap; with `--target=linux` it calls the ELF shim. Wrap it in named
  functions (`io_write`, `io_exit`, …). ⚠ **Never** in code for
  `--target=virt`: it compiles, but an `svc` with no handler hangs the machine.
- `@` on a pointer `const` is the MMIO access (virt target). Today it compiles
  to plain ldr/str; it is "volatile" only because there is no optimizer.

## Primitive library

Tetsuo does not link libc and has no `stdio.h` or `stdlib.h` headers. Its
current library is a set of importable `.tt` modules:

- `src/runtime/io.tt`: file and basic process syscalls; also `Arena`,
  `arena_init` and `arena_take`. The arena is bump-only: there is no `free`.
- `lib/arena.tt`: `Arena`, `arena_init` and `arena_take` with no global storage.
- `lib/str.tt`: `bytes_eq` and `mem_copy`; `str` is still just `(ptr, len)`.
- `lib/string.tt`: equality, prefix, byte search and strict UTF-8 decoding with
  `str_next_codepoint`.
- `lib/parse.tt`: `parse_u64` and `parse_i64`, rejecting empty input, invalid
  characters and overflow. They return 1 on success and 0 on error.
- `lib/fmt.tt`: buffered `Out` output, bytes, decimal `u64`, four-digit
  hexadecimal and fatal errors.
- `lib/stdio.tt`: stdout/stderr through `print`, `println`, `print_u64` and the
  `e*` variants. It requires `stdio_init` and an explicit flush.
- `lib/vec.tt`: a vector of opaque elements over an arena, with no bounds
  checking.
- `lib/ast.tt`: a specialized arena used by the compiler, not a general API.

`lib/std.tt` imports, in order, runtime, bytes, strings, parsing, formatting,
stdio and vector. It is the recommended entry point for CLI programs; `ast.tt`
is left out because it is internal. `lib/freestanding.tt` imports only arena,
bytes, strings, parsing and vector. It declares no `bss`; the caller must
supply a distinct scratch buffer per call.

`lib/release_name.tt` exposes `tt_release_parse_v1` for FFI. It takes bytes,
caller-supplied scratch and a `TTParsedRelease` of eight `u64` fields; it uses
no `bss`.

Practical equivalences:

| need | tetsuo API |
|---|---|
| allocate memory | `arena_take` |
| compare/copy bytes | `bytes_eq`, `mem_copy` |
| compare/search strings | `string_eq`, `string_has_prefix`, `string_find_byte` |
| convert integers | `parse_u64`, `parse_i64` |
| open/read/write/close | `io_open_*`, `io_read`, `io_write`, `io_close` |
| stdout/stderr | `stdio_init`, `print*`, `eprint*`, `flush`, `eflush` |
| dynamic vector | `Vec` + `vec_*` |
| terminate the process | `io_exit` |

`printf`, `malloc/free`, `FILE` streams, sort, networking, child processes,
environment and clock are missing. The syscall API returns raw values and does
not yet expose `errno` in a typed way.

## Compilation model

- **`import` preprocessor**: the driver (`src/main.tt`) recognizes
  `import 'relative/path.tt'` lines **before** the lexer and replaces them with
  the content of the quoted file. It applies recursively: the `import`s of the
  imported file are expanded too. Rules:
  - the directive takes a **whole line** and comes before any top-level
    declaration;
  - the path is relative to the cwd `build/main` is launched from;
  - there is **dedup by path**: a second `import` of the same file is a no-op
    → cycles and diamond imports are harmless;
  - `import` is **not** a reserved word of the language: it is a line token the
    preprocessor consumes before it reaches the lexer.
- Canonical stage1 order (equivalent to what the driver's `pp_expand` produces
  over `src/main.tt`):
  `io.tt → str.tt → fmt.tt → vec.tt → ast.tt → lexer.tt → parser.tt →
   ir.tt → codegen.tt → main`.
- Within a file the order of the functions is free (mutual recursion is valid).
  ⚠ Across imported files it is not: every reference must point at a file
  already expanded in the preprocessor stream.
- Conventions: constants in UPPERCASE; functions and fields in snake_case; a
  manual "module" prefix in the names (`io_`, `arena_`, `lex_`).
- At most 32 imported paths. Symbols are global; there are no namespaces, no
  public/private visibility and no incremental builds.

## Compiler errors

Public codes: `0` success, `2` arguments or syntax, `3` empty or unreadable
input, `4` output that cannot be opened, and `70` arena exhausted/overflowed.
Codes `90` and above are reserved for scripts and harnesses.

The parser accumulates up to 20 errors, recovering at statement, block or
top-level declaration boundaries. After expanding imports it preserves the
original path and line and shows column, token, source and cursor:
`path:line:column: error: message`. If any error exists it does not run the
lowering and exits with code 2.

## Known limits (⚠ summary)

- `arena_take` checks capacity and arithmetic overflow; exhausting the arena
  exits with code 70.
- Initialization analysis is conservative and scalar; taking `&array` allows
  later initialization by index.
- `[]` and `.` require the type of the receiver to be known; there is no
  inference.
- Arrays: only local `[N]T` with `sizeof(T) == 8`; no copy by value and no
  aggregate initializers.
- At most 8 arguments/parameters; nested loops ≤ 16 (`break_stack`).

The macOS runtime offers basic files, `getpid`, `mkdir`, `chdir` and `unlink`.
Networking, child processes, environment and clock have no stable API yet.

`--emit=obj` emits macOS arm64 assembly without `_tt_start`, suitable for
producing a linkable object with `clang -c` from C or Rust. The exported
functions use the AAPCS64 ABI and must carry a manual prefix to avoid
collisions.
