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
