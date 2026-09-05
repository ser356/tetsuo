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
