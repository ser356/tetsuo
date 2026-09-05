# Tetsuo agent context pack

Version: `2026.09.05`

Canonical lexical tokens to competence: **8847**  
UTF-8 bytes: **30918**  
Estimated model tokens (`ceil(bytes/4)`): **7730**

## Source integrity

- `LANGUAGE.md`: `d28d6f8e3f2dd1665c4565f1562c928bd217c5ab501572f35eb76ac006413343`
- `idioms.md`: `dbee0bb956d9669e28b9c372792e6cb328711c75781a2f0e78a5b141d6ab9485`
- `docs/agent/COOKBOOK.md`: `b4a16c48ba48888a6bf8876459c66613f1ced7ea8aa368659fc11e3b61d86ee9`
- `docs/agent/ERRORS.md`: `0ee20e3cb5ebbc9e57be0ac73a49761611ea4858ce293aecc01a53de155adc45`
- `docs/agent/METRICS.md`: `4105c90b2bab693c3de36520daa8d5352b8ecc64c01a00ef90a3e1830aa6e2d0`

---

<!-- source: LANGUAGE.md -->

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

---

<!-- source: idioms.md -->

# tetsuo — idioms

Idiomatic patterns observed in the real tetsuo code of the repo
(`tests/uart.tt`, `tests/io.tt`, `tests/cat.tt`, `tests/hello.tt`,
`tests/macos_hello.tt`, `tests/lexer.tt`, `tests/parser.tt`,
`tests/expr.tt`), exactly as the current compiler accepts them.
A living document: it is also the friction log of milestone 11 —
every pattern marked (workaround) is a candidate to disappear once the
language grows.

## MMIO

Mapped register: a typed pointer constant, in uppercase, once per file. The
width of the access travels in the type.

```
const UART_DR: *u8  = 0x09000000
const UART_FR: *u32 = 0x09000018
```

`@` reads and writes through the pointer:

```
return @UART_FR & 32     // 4-byte read
@UART_DR = c             // 1-byte write
```

Status note: the `reg UART_DR: u8 at 0x09000000` form decided in the audit is
not implemented; the current idiom is a `const` of pointer type. Semantic note:
today `@` compiles to plain ldr/str — it is "volatile" only because there is no
optimizer. Once there is one, the guarantee must move into the IR (a marked
instruction), not be lost.

## Waiting on a peripheral

A polling loop with the condition in a named function — the name documents the
bit:

```
fun uart_ready() -> u32 {
    return @UART_FR & 32
}

fun putc(c: u8) {
    while uart_ready() != 0 {}
    @UART_DR = c
}
```

Existing comparisons: `== != < <= > >=` (all unsigned). Idiomatic counted
loops:

```
let i: u64 = 0
while i < s.len {
    putc(s.ptr[i])
    i = i + 1
}
```

There are no `i32/i64` signed types yet; every computation goes through `u*`
and loop turns use equality or exact ordering.

## Strings

`str` is pointer + length; the fields are read with `.ptr` and `.len`. There is
no implicit null terminator.

```
let greeting: str = 'hola\n'
print(greeting)
```

(workaround) Syscalls that expect a C string need the null added by hand:

```
let path: str = 'tests/hello.tt\0'
let fd: u64 = io_open_read(path.ptr)
```

Current restrictions: a string literal can only appear as the initializer of a
`let`; `.ptr`/`.len` only on locals.

## Dynamic memory

The arena is a library, never a primitive. The base block changes per target:

- **virt** (bare metal): a fixed address after the loaded image.
  ```
  const HEAP_BASE: *u8 = 0x40100000
  ```
- **macos**: a static buffer declared with `bss`. The compiler emits
  `.zerofill __DATA,__bss,_NAME,N,3` on macos and `.comm NAME,N,8` on virt.
  ```
  bss IO_BUF: 65536
  ```

A `bss` name resolves in an expression to a pointer to the first byte of the
buffer (equivalent to `&io_buf[0]` in C). Typical use:

```
let ar: Arena
arena_init(&ar, IO_BUF, 65536)
let buf: *u8 = arena_take(&ar, 4096)
```

The arena struct and functions, unchanged since the first design:

```
struct Arena { base: *u8, pos: u64, cap: u64 }

fun arena_init(a: *Arena, base: *u8, cap: u64) {
    a.base = base
    a.pos = 0
    a.cap = cap
}

fun arena_take(a: *Arena, n: u64) -> *u8 {
    let p: *u8 = a.base + a.pos
    a.pos = a.pos + n
    return p
}
```

Structs are always passed by pointer (`a: *Arena`, called with `&ar`); the
`.field` access works both on the local and on the pointer.

(workaround) `arena_take` does not check `cap` — with no error handling decided
yet, arena overflow is silent.

## Dynamic buffers

Code aimed at `--emit=obj` declares no `bss`. It receives the block from the
caller, builds an `Arena` as a local and passes `&ar`. One scratch per call
allows concurrent use with no shared state; `lib/freestanding.tt` gathers this
subset.

With an arena, runtime-sized buffers come for free and replace the
struct-of-u64 trick:

```
let nl: NameList
nl.starts = arena_take(ar, cap * 8)
nl.lens   = arena_take(ar, cap * 8)
```

Element-by-element writing with pointer arithmetic:

```
let slot: *u64 = nl.starts + i * 8
@slot = start
```

(workaround) `[N]T` still does not exist; the compiler writes `@ptr` and the
programmer counts the element size by hand.

## Control flow

- `if cond { ... } else if cond2 { ... } else { ... }` with `else if` and no
  braces in between.
- `return` with no value (for functions with no `->` or for an early exit).
- `while cond { ... }` and `loop { ... }` with `break`.

```
fun classify(c: u8) -> u32 {
    if c >= 48 {
        if c <= 57 { return 1 }
    } else if c == 32 { return 2 }
    return 0
}
```

(workaround) No `continue`; the pattern is an `if` wrapping the body of the
loop.

## Recursive structs

Structs are registered with the name available before their fields, which
allows recursive types through a pointer:

```
struct Node {
    kind: u32,
    ival: u64,
    lhs:  *Node,
    rhs:  *Node,
}
```

It is the AST idiom in tetsuo (used in `tests/expr.tt`).

## Token peeking

The lexer has no native lookahead; the parser emulates it with a "parser state"
that holds the last token read ahead:

```
struct PState {
    lx:         *Lexer,
    has_peek:   u32,
    peek_kind:  u32,
    peek_start: u64,
    peek_tlen:  u64,
    peek_ival:  u64,
    peek_tline: u64,
}
```

(workaround) A field-by-field copy of the `Tok` because there is no inline
`memcpy`; discipline until `[N]T` or pointers to struct as the source of an
assignment by value appear.

## Syscalls and I/O (macos target)

`syscall(n, a, b, c)` is the only intrinsic besides `@`. It is wrapped
immediately in named functions, prefixed by a manual module name:

```
fun io_write(fd: u64, buf: *u8, len: u64) { syscall(4, fd, buf, len) }
fun io_exit(code: u64) { syscall(1, code, 0, 0) }
```

"Importing" is a line directive of the preprocessor built into the driver:
`import 'relative/path.tt'`, one per line at the start of the file. The
preprocessor expands recursively and deduplicates by path, so importing the
same file twice (or closing a cycle) is harmless. A typical example:

```
import 'src/runtime/io.tt'
import 'lib/str.tt'

fun main() -> u64 { ... }
```

The `io_`/`arena_`/`lex_` prefix in the names remains the convention that
stands in for a namespace — there is no per-file scoping.

Hard rule: no `syscall` in code aimed at `--target=virt` — it compiles all the
same, but an `svc #0x80` with no handler hangs the machine.

## General conventions

- Constants in UPPERCASE, functions and fields in snake_case.
- A type annotation on every `let` (mandatory today; the inference decided in
  the audit is not implemented).
- Integer literals: the width is decided by the context of the `let`/parameter
  that receives them; no casts (neither `as` nor `u8(x)` exist yet).
- `loop {}` as the final hang of `main` on bare metal.
- One file = one "library" (uart.tt, io.tt); the user concatenates.
- `fun` with no `->` when it returns no value; `main() -> u32` on macos (the
  runner checks the exit code), a bare `main()` on virt.

## Conventions for self-hosting (stage1)

The patterns in this section are not opinion: they are the only way stage1 has
of reproducing stage0's behavior without signed types, without `sizeof` and
without explicit forward resolution.

### Null pointer = literal `0` (with `nil` as sugar)

Verified in `tests/nil.tt` and `tests/nil2.tt`: `let p: *T = 0` and `p == 0`
compile and behave as expected. The reserved word `nil` already exists and is
exact sugar for the literal `0` — use `nil` in a pointer context and `0` in a
numeric one. The comparison is always by equality:

```
if p == nil { return }      // ok
if p != nil { ... }         // ok
if p < 0 { ... }            // FORBIDDEN — every comparison is
                            // unsigned, so this is always false
```

### One `let` per branch: shadowing to the most recent declaration

With no block scope, the stage1 parser pattern is to declare the same local in
every mutually exclusive branch:

```
if k == TK_NUM {
    let e: *Expr = mk_expr(ar, EX_INT)
    e.ival = t.ival
    return e
}
if k == TK_IDENT {
    let e: *Expr = mk_expr(ar, EX_VAR)
    e.var_start = name_start
    return e
}
```

Every `let` creates a slot of its own and every use resolves to the most recent
declaration preceding it in the text (`lookup_local` searches backwards).
Hygiene rule: use the pattern only in branches that end in `return`/`break`;
after a block with an inner `let x`, the name `x` keeps shadowing in the rest of
the function and its slot may be uninitialized if the branch did not run.

(Historical note: until the milestone 15.7-8 fix, `lookup_local` resolved to the
*first* declaration: the `let e` of a later branch wrote its new slot but
`e.field` read the slot of the first branch, uninitialized — the stage1 parser
segfault with `return IDENT`.)

### Sentinels: 1-based indices

stage0 (C) uses `-1` as "unassigned" in `reg_of`, `last_use`, `def_idx` and
similar fields. Since tetsuo has no signed types, `-1` would become
`0xFFFF…FFFF` and any `<` would invert the sense of the comparisons. Mechanical
solution when translating:

| stage0 (C)             | stage1 (tetsuo)              |
| ---------------------- | ---------------------------- |
| `reg_of[s] = -1`       | `reg_of[s] = 0`              |
| `reg_of[s] = r`        | `reg_of[s] = r + 1`          |
| `if reg_of[s] >= 0`    | `if reg_of[s] != 0`          |
| `x_pool[reg_of[s]]`    | `x_pool[reg_of[s] - 1]`      |
| `last_use[s] = -1`     | `last_use[s] = 0`, 1-based   |
|                        | instruction indices          |

Rule: any table that in stage0 uses `-1` as "empty" switches to `0` in stage1,
and the real indices shift by 1.

### Struct sizes: `sizeof(T)`

The compiler resolves `sizeof(T)` at parse time through `type_width`. It works
for primitives, pointers and declared structs:

```
let n:  u64 = sizeof(u64)     // 8
let sp: u64 = sizeof(*u8)     // 8
let sn: u64 = sizeof(N)       // 8 * number of fields of N
```

Current backend layout: every field takes an 8-byte slot, so `sizeof(N)` =
`nfields(N) * 8`. When the layout changes, the constant recomputes itself
without touching user code.

### One file = one mutually recursive set

Verified in `tests/io.tt`: `arena_take` calls `io_exit`, defined further down in
the same file. `parse` completes the recognition of the whole file before
resolving names, so within a single `.tt` the order of the functions is free.

Practical corollary: the recursive descent parser of stage1 lives in a single
`parser.tt` because `parse_expr` ↔ `parse_primary` is mutually recursive.
Recursion **across** different files is forbidden: `io.tt`, `str.tt`, `fmt.tt`,
`vec.tt`, `ast.tt`, `lexer.tt`, `parser.tt`, `ir.tt`, `codegen.tt`, `main.tt`
are imported in that order (through `import` in the driver or expanded by
`pp_expand` in `src/main.tt`) and every backward reference must be closed within
the same file.

---

<!-- source: docs/agent/COOKBOOK.md -->

# Agent cookbook

Twenty copy-ready patterns. Canonical implementations live in `lib/` and executable examples in `tests/`.

## 1. Program entry

```tetsuo
fun main() -> u64 { return 0 }
```
Source: `tests/hello.tt`.

## 2. Print a line

```tetsuo
import 'lib/std.tt'
fun main() -> u64 { stdio_init(); println('hello'); flush(); return 0 }
```
Source: `tests/stdio_test.tt`.

## 3. Parse an unsigned integer

```tetsuo
let value: u64 = 0
if parse_u64(text, &value) == 0 { return 2 }
```
Source: `lib/parse.tt`.

## 4. Read a file

```tetsuo
let err: u64 = 0
let fd: u64 = io_open_read_checked(path, &err)
let n: u64 = io_read_checked(fd, buf, cap, &err)
io_close(fd)
```
Source: `src/runtime/io.tt`.

## 5. Write a file

```tetsuo
let err: u64 = 0
let fd: u64 = io_open_write_checked(path, &err)
io_write(fd, bytes, len)
io_close(fd)
```
Source: `tests/write_test.tt`.

## 6. Grow a vector

```tetsuo
let v: Vec
let first: *u8 = arena_take(ar, 8)
vec_init(&v, 8, first, 1)
vec_push(ar, &v, &value)
```
Source: `lib/vec.tt`.

## 7. Decode UTF-8

```tetsuo
let cp: u64 = 0
let width: u64 = str_next_codepoint(bytes, len, offset, &cp)
```
Source: `lib/string.tt`.

## 8. Loop with continue

```tetsuo
while i < n {
    i = i + 1
    if i == skip { continue }
}
```
Source: `tests/continue_test.tt`.

## 9. Infinite loop with break

```tetsuo
loop {
    if done != 0 { break }
}
```
Source: `tests/lower_while_test.tt`.

## 10. Fixed array

```tetsuo
let bytes: [16]u8
bytes[0] = 42
```
Source: `tests/array_width_test.tt`.

## 11. C-compatible struct

```tetsuo
struct Header { tag: u8, size: u32, data: *u8 }
```
Source: `tests/struct_c_abi.tt`.

## 12. Read a struct field

```tetsuo
fun size_of_header(p: *Header) -> u32 { return p.size }
```
Source: `tests/struct_mixed_runtime_test.tt`.

## 13. Pointer dereference

```tetsuo
let value: u64 = @ptr
@ptr = value + 1
```
Source: `tests/lower_mem_test.tt`.

## 14. Address of a local

```tetsuo
let value: u64 = 42
let ptr: *u64 = &value
```
Source: `tests/outparam_test.tt`.

## 15. Explicit cast

```tetsuo
let small: u8 = wide as u8
```
Source: `tests/cast_test.tt`.

## 16. Checked syscall

```tetsuo
let err: u64 = 0
let pid: u64 = syscall_checked(20, 0, 0, 0, &err)
```
Source: `tests/syscall_checked_test.tt`.

## 17. Function with many arguments

```tetsuo
fun sum9(a:u64,b:u64,c:u64,d:u64,e:u64,f:u64,g:u64,h:u64,i:u64) -> u64 {
    return a+b+c+d+e+f+g+h+i
}
```
Source: `tests/call_many_runtime_test.tt`.

## 18. BSS storage

```tetsuo
bss BUFFER: 4096
let bytes: *u8 = BUFFER
```
Source: `tests/codegen_bytes_bss_test.tt`.

## 19. String search

```tetsuo
let at: u64 = string_find(haystack, needle)
```
Source: `lib/string.tt`.

## 20. C ABI export

```tetsuo
fun tt_add(a: u64, b: u64) -> u64 { return a + b }
```
Source: `tests/obj_link_test.tt`.

---

<!-- source: docs/agent/ERRORS.md -->

# Stable diagnostic catalog

Codes are API. Messages can improve; code identity does not change. `--diagnostics=json` emits one JSON object per line.

| Code | Meaning | Fix | Language reference | Emitter |
|---|---|---|---|---|
| E0001 | Generic compilation error | — | [errors](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#compiler-errors) | [registry](https://github.com/ser356/tetsuo/blob/main/lib/fmt.tt#L261) |
| E0007 | Invalid primary expression | inspect token | [expressions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#expressions) | [parser](https://github.com/ser356/tetsuo/blob/main/src/parser.tt#L744) |
| E0101 | Undeclared function | declare or rename call | [functions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L222) |
| E0102 | Incorrect call arity | match parameter count | [functions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L222) |
| E0103 | Incompatible argument type | cast or change type | [types](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#types) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L222) |
| E0104 | Incompatible return type | cast or change return | [functions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0105 | Return value required | add value | [functions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0106 | Incompatible initializer type | cast or change type | [statements](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#statements) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0107 | Incompatible assignment type | cast or change target | [statements](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#statements) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0108 | Invalid assignment target | assign to lvalue | [statements](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#statements) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L340) |
| E0109 | Dereference requires pointer | use pointer | [expressions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#expressions) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L285) |
| E0110 | Store requires pointer | use pointer | [statements](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#statements) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0111 | Incompatible arithmetic operands | cast operands | [expressions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#expressions) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L263) |
| E0201 | Rust `fn` interference | `fun` | [functions](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#fun) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0202 | Rust `pub` interference | remove | [declarations](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#top-level-declarations) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0203 | Rust `mut` interference | remove | [statements](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#statements) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0204 | C `int` interference | `u64` | [types](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#types) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0205 | C `printf` interference | `print` | [I/O](https://github.com/ser356/tetsuo/blob/main/idioms.md#syscalls-and-io-macos-target) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0206 | C `malloc` interference | `arena_take` | [memory](https://github.com/ser356/tetsuo/blob/main/idioms.md#dynamic-memory) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0207 | C `#include` interference | `import 'path'` | [compilation](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#compilation-model) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0208 | C block comment interference | `//` | [lexicon](https://github.com/ser356/tetsuo/blob/main/LANGUAGE.md#lexical-structure) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |

---

<!-- source: docs/agent/METRICS.md -->

# Context metrics

**Tokens to competence** means tokens an agent must ingest before receiving language specification, idioms, twenty executable recipes, and stable error catalog.

Canonical measurement is deterministic lexical tokens, counted as Unicode word runs or single non-whitespace punctuation characters with Python regex `\w+|[^\w\s]`. It is provider-independent and reproducible without network or packages. UTF-8 bytes and `ceil(bytes/4)` are also reported for rough model-window planning; the latter is explicitly an estimate, not a tokenizer claim.

Run `python3 tools/build_agent_context.py --metrics`.
