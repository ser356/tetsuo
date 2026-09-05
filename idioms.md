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
