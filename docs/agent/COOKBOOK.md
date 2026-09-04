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
