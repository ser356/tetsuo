# Tetsuo agent context pack

Version: `2026.09.05`

Canonical lexical tokens to competence: **4149**

UTF-8 bytes: **14370**

Estimated model tokens (`ceil(bytes/4)`): **3593**

## Source integrity

- `LANGUAGE.md`: `0e710a032333b0809024bfc33da433b5df29924265ad1193aa1887f8d634b326`
- `idioms.md`: `23338a1c9249e8a0b0bef5c518bafeaa0fe1e613bb8f4d2d2131d662e3a86ce7`
- `docs/agent/COOKBOOK.md`: `7a02d5490c9f2e3f966c1a2bab22b08ee0746837a3de1a6e45fc5c10f5baee46`
- `docs/agent/ERRORS.md`: `48504ffb65727433534d45f9a481486cc76b79aeb4e06adfaa4a25a793b56c59`
- `docs/agent/METRICS.md`: `774adae11c9e109c4b5a13332437341c88b2cc044cdc05b93fc4534cc45960a8`

---

<!-- source: LANGUAGE.md -->

# tetsuo language reference

Current accepted syntax and semantics.

## Lexical structure

- Comments: `//` through end of line. Block comments are rejected.
- Identifiers: `[A-Za-z_][A-Za-z0-9_]*`.
- Integers: decimal or hexadecimal. Unary `-` forms negative values.
- Strings: single quoted; escapes include `\n`, `\t`, `\\`, `\'`, `\0`, and `\xNN`.
- Keywords: `fun let const return if else loop while break continue struct bss nil sizeof as`.
- Semicolons are optional separators.

## Types and layout

| Type | Width |
|---|---:|
| `u8`, `i8`, `bool` | 1 |
| `u32`, `i32` | 4 |
| `u64`, `i64`, `*T` | 8 |
| `str` | 16 |
| `[N]T` | `N * sizeof(T)` |
| struct | natural field layout, maximum alignment 8 |

Struct fields align naturally, capped at 8; final size rounds to the largest
field alignment. Arrays support primitive, pointer, and struct elements and
index by `sizeof(T)`. Aggregates use local storage or pointers; aggregate
copy, arguments, and returns by value are unsupported.

Signed types use signed comparison, division, remainder, and right shift.
`expr as T` normalizes integer width and signedness.

## Declarations

```text
const PAGE: u64 = 4096
bss BUFFER: 65536
struct Pair { tag: u8, value: u64 }
fun add(a: u64, b: u64) -> u64 { return a + b }
```

- `const` accepts an integer literal and may have pointer type.
- `bss` declares zero-filled bytes and evaluates as `*u8`.
- Recursive struct pointers work.
- Function order is unrestricted within the expanded translation unit.
- Argument lists are dynamic. Backends follow AAPCS64 or Windows x64 ABI,
  placing excess arguments on the stack.

## Statements and scopes

```text
let x: u64 = 0
x = x + 1
@ptr = x
if x != 0 { } else { }
while x < 10 { x = x + 1; continue }
loop { break }
return x
```

Every `let` requires a type. Reading an uninitialized local is rejected.
Blocks create lexical scopes. `break` and `continue` target the innermost loop;
loop stacks grow dynamically.

## Expressions

From strongest to weakest:

| Level | Operators |
|---|---|
| unary | `@`, `&`, `!`, unary `-` |
| postfix | call, `.field`, `[index]`, `as T` |
| multiplicative | `* / %` |
| additive | `+ -` |
| shifts | `<< >>` |
| bitwise | `&`, then `^`, then `\|` |
| comparison | `== != < <= > >=` |
| logical | `&&`, then `\|\|` |

Logical operations short-circuit. Comparisons produce 0 or 1. `nil` is null.
`sizeof(T)` is compile-time. String literals have type `str`; native images
store a trailing zero not counted by `.len`.

`.ptr` and `.len` access strings. Struct fields use computed offsets through
locals or pointers. `p[i]` accesses `p + i * sizeof(T)`.

## Imports

```text
import 'lib/std.tt'
```

Imports are whole-line preprocessor directives before declarations. Expansion
is recursive, cwd-relative, dynamically deduplicated, and cycle safe. Imported
text shares one global namespace; there is no fixed import count.

## Runtime

`syscall` and `syscall_checked` are compiler intrinsics behind
`src/runtime/io.tt`. Native backends map operations to macOS traps, Linux
syscalls, or `msvcrt.dll`. Programs should call `io_*` wrappers.

`lib/std.tt` is the CLI umbrella. `lib/freestanding.tt` is global-state-free
for C/Rust linking. Arena allocation checks capacity and overflow and exits 70
on exhaustion.

## Diagnostics and exits

`--diagnostics=json` emits JSON Lines with stable `E####` code, English
message, path, line, column, absolute byte span, and suggested fix. Parser and
checker report multiple errors before stopping.

| Code | Meaning |
|---:|---|
| 0 | success |
| 2 | bad arguments, syntax, or semantic error |
| 3 | empty or unreadable input |
| 4 | output open failure |
| 70 | arena exhausted or arithmetic overflow |

## Known limits

- No namespaces or visibility modifiers.
- No aggregate values across assignments/calls/returns.
- No general allocator or `free`.
- No exceptions, threads, processes, sockets, environment, or clock API.
- No incremental or separate compilation.
- Bare-metal `virt` is separate from native CLI targets.

---

<!-- source: idioms.md -->

# tetsuo idioms

Current patterns used by compiler and libraries.

## Imports

Use `import 'lib/std.tt'` for CLI programs and
`import 'lib/freestanding.tt'` for FFI code with caller-owned scratch. Imports
share one namespace; prefix public symbols (`io_`, `arena_`, `string_`).

## Strings

`str` carries pointer and byte length. Native images include a trailing zero,
but `.len` excludes it.

```text
let message: str = 'hello\n'
io_write(1, message.ptr, message.len)
```

Use `string_eq`, `string_has_prefix`, `string_find_byte`, and
`str_next_codepoint` rather than C-style scans.

## Checked parsing

```text
let value: u64 = 0
if parse_u64(text, &value) == 0 { return 2 }
```

Invalid or overflowing input leaves output unchanged.

## Arenas

```text
bss SCRATCH: 65536
let arena: Arena
arena_init(&arena, SCRATCH, 65536)
let bytes: *u8 = arena_take(&arena, 4096)
```

Overflow exits 70. Use one arena per concurrent operation and discard its whole
lifetime; no individual free exists.

## Arrays and vectors

Use `[N]T` for bounded locals and `Vec` for runtime capacity:

```text
let values: [16]u32
values[3] = 42
```

Indexing scales by element width. Manual `i * 8` belongs only in raw layouts.

## Structs

Layout is natural, not `field_index * 8`:

```text
struct Item { kind: u8, count: u32, next: *Item }
```

Allocate with `sizeof(Item)` and pass aggregates by pointer.

## Signed arithmetic

Use `i8`, `i32`, or `i64` when ordering, division, remainder, or right shift
must be signed. Narrow explicitly with `as`.

## Control flow

Use `while`, `loop`, `break`, and `continue` directly. `&&` and `||`
short-circuit. Blocks are lexical scopes.

## I/O

`io_*` preserves one API across macOS, Linux, and Windows:

```text
let err: u64 = 0
let fd: u64 = io_open_read_checked(path.ptr, &err)
if err != 0 { return 2 }
let n: u64 = io_read(fd, buffer, capacity)
io_close(fd)
```

Call `stdio_init()` before buffered output and `flush()`/`eflush()` afterward.

## Bare metal

The separate `virt` route uses typed MMIO pointer constants:

```text
const UART_DR: *u8 = 0x09000000
@UART_DR = byte
```

Dereferences preserve volatility through AST and IR. Do not use native syscall
wrappers in bare-metal code.

## Many arguments

Argument counts are dynamic; backends place excess values on ABI stack space.
Keep APIs small for readability, not compiler limits.

## Agent diagnostics

Compile with `--diagnostics=json`. Consume complete JSON Lines and match stable
codes and byte spans, not message text. See `docs/agent/ERRORS.md`.

## Self-hosting

- Allocate compiler structs with `sizeof(T)`.
- Prefer checked arenas and explicit errors.
- After compiler changes, produce three generations and compare stage2/stage3.
- Replace all platform seeds only after convergence.
- Run `bash bootstrap/verify.sh`; CI then executes native ELF and PE fixpoints.

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

## 19. Byte search in a string

```tetsuo
let at: u64 = string_find_byte(text, byte)
```
Source: `lib/string.tt`.

## 20. C ABI export

```tetsuo
fun tt_add(a: u64, b: u64) -> u64 { return a + b }
```
Source: `tests/obj_link_test.tt`.

## Build recipes

```text
tetsuoc --emit=macho app.tt -o app
tetsuoc --emit=elf app.tt -o app
tetsuoc --emit=pe-arm64 app.tt -o app.exe
tetsuoc --target=windows-x64 app.tt -o app.s
tetsuoc --diagnostics=json app.tt -o app.s
```

For Windows x64, assemble with Clang's COFF target and link with
`tools/link_pe_x64.py`. Prefer `io_*` wrappers so one source works on all
native targets.

---

<!-- source: docs/agent/ERRORS.md -->

# Stable diagnostic catalog

Codes are API. Messages can improve; code identity does not change. `--diagnostics=json` emits one JSON object per line.

| Code | Meaning | Fix | Language reference | Emitter |
|---|---|---|---|---|
| E0001 | Generic compilation error | — | [diagnostics](../../LANGUAGE.md#diagnostics-and-exits) | `diagnostic_code()` in `lib/fmt.tt` |
| E0007 | Invalid primary expression | inspect token | [expressions](../../LANGUAGE.md#expressions) | `parse_primary()` in `src/parser.tt` |
| E0101 | Undeclared function | declare or rename call | [declarations](../../LANGUAGE.md#declarations) | `check_expr()` in `src/check.tt` |
| E0102 | Incorrect call arity | match parameter count | [declarations](../../LANGUAGE.md#declarations) | `check_expr()` in `src/check.tt` |
| E0103 | Incompatible argument type | cast or change type | [types](../../LANGUAGE.md#types-and-layout) | `check_expr()` in `src/check.tt` |
| E0104 | Incompatible return type | cast or change return | [declarations](../../LANGUAGE.md#declarations) | `check_stmt()` in `src/check.tt` |
| E0105 | Return value required | add value | [declarations](../../LANGUAGE.md#declarations) | `check_stmt()` in `src/check.tt` |
| E0106 | Incompatible initializer type | cast or change type | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0107 | Incompatible assignment type | cast or change target | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0108 | Invalid assignment target | assign to lvalue | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0109 | Dereference requires pointer | use pointer | [expressions](../../LANGUAGE.md#expressions) | `check_expr()` in `src/check.tt` |
| E0110 | Store requires pointer | use pointer | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0111 | Incompatible arithmetic operands | cast operands | [expressions](../../LANGUAGE.md#expressions) | `check_expr()` in `src/check.tt` |
| E0201 | Rust `fn` interference | `fun` | [declarations](../../LANGUAGE.md#declarations) | `check_interference()` in `src/check.tt` |
| E0202 | Rust `pub` interference | remove | [declarations](../../LANGUAGE.md#declarations) | `check_interference()` in `src/check.tt` |
| E0203 | Rust `mut` interference | remove | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_interference()` in `src/check.tt` |
| E0204 | C `int` interference | `u64` | [types](../../LANGUAGE.md#types-and-layout) | `check_interference()` in `src/check.tt` |
| E0205 | C `printf` interference | `print` | [I/O](../../idioms.md#io) | `check_interference()` in `src/check.tt` |
| E0206 | C `malloc` interference | `arena_take` | [arenas](../../idioms.md#arenas) | `check_interference()` in `src/check.tt` |
| E0207 | C `#include` interference | `import 'path'` | [imports](../../LANGUAGE.md#imports) | `check_interference()` in `src/check.tt` |
| E0208 | C block comment interference | `//` | [lexicon](../../LANGUAGE.md#lexical-structure) | `check_interference()` in `src/check.tt` |

---

<!-- source: docs/agent/METRICS.md -->

# Context metrics

**Tokens to competence** means tokens an agent must ingest before receiving language specification, idioms, twenty executable recipes, and stable error catalog.

Canonical measurement is deterministic lexical tokens, counted as Unicode word runs or single non-whitespace punctuation characters with Python regex `\w+|[^\w\s]`. It is provider-independent and reproducible without network or packages. UTF-8 bytes and `ceil(bytes/4)` are also reported for rough model-window planning; the latter is explicitly an estimate, not a tokenizer claim.

Run `python3 tools/build_agent_context.py --metrics`.

The generated pack concatenates `LANGUAGE.md`, `idioms.md`, this directory's
cookbook/catalog/metrics, and records SHA-256 for every source. CI runs
`python3 tools/build_agent_context.py --check`; any source edit requires
regeneration with `python3 tools/build_agent_context.py`.
