# Is tetsuo ready to implement parts of the videodrome backend?

Research dated 2026-09-03. It contrasts the capabilities of tetsuo **verified in
the code** (`src/*.tt`, `lib/*.tt`, `SELFHOST-STATE.md`) against the Rust
backend of `ser356/videodrome` (54 `.rs` files, 29,101 LOC).

## Verdict

**Not yet, except for one module.** Of the 29,101 LOC of the backend, there are
**770 LOC (2.6%)** portable to tetsuo today with bounded effort:
`src/torrents/release_name.rs`. The rest is blocked by three things that are not
"write more tetsuo code", but gaps in the language itself and in its compilation
model.

And even that 2.6% **cannot be plugged into the current backend** until tetsuo
knows how to emit a linkable object with no entry point. That is the first piece
of work, not the port.

## Why: the dependency profile of the backend

Measured per file, counting the LOC of every file that touches each family:

| Family | LOC affected | % of the backend |
|---|---|---|
| `async` / `.await` | 23,908 | 82% |
| Networking (`reqwest`, `axum`, `hyper`, `TcpListener`) | 21,560 | 74% |
| Floating point (`f32`/`f64`) | 23,805 | 82% |
| Heap collections (`String`, `Vec`, `HashMap`, `Box`) | 27,775 | 95% |

Tetsuo has none of the four:

- **No async and no threads.** There is no runtime, no futures, no `Mutex` and
  no atomics. `syscall(n,a,b,c)` is the only door to the system.
- **No networking.** `SELFHOST-STATE.md` says it explicitly: "Networking, child
  processes, environment and clock have no stable API yet". `lib/std.tt` covers
  files, bytes, strings, parsing, formatting, stdout/stderr and `Vec`. Nothing
  else.
- **No floating point.** There is no `f32`/`f64` in the lexer or in `PrimType`.
  All the HLS arithmetic (`Vec<(f64,f64)>` of segments, playhead, throttle,
  progress) would have to be rewritten in fixed point — a behavior change, not a
  port.
- **No heap.** `arena_take` is bump-only, there is no `free`. Fine for a batch
  compiler that dies when it finishes; not for a long-lived streaming server.

Files with zero dependencies on the four families: five, 931 LOC. Of those,
`main.rs` (57), `gui/commands/mod.rs` (14), `kiosk/mod.rs` (29) and
`embed_player.rs` (61) are Tauri glue and module declarations, with no portable
logic. One is left.

## The three structural blockers

### 1. There is no linking route (the hard blocker)

For Rust to call tetsuo code, a linkable `.o` is needed. Today tetsuo emits two
things and neither serves:

- `--emit=macho` → a complete Mach-O executable, ad-hoc signed, with `LC_MAIN`.
  It is not relocatable.
- textual `.s` output → it can indeed go through `clang -c`, **but**
  `codegen()` in `src/codegen.tt:codegen` calls `emit_macos_start(o)`
  unconditionally for `TGT_MACOS`, which emits:

  ```
  .globl   _tt_start
  _tt_start:
      bl      _main
  ```

  A global `_tt_start` symbol referencing `_main`. When linked into a Rust
  binary: either it fails with `_main` undefined, or it collides. It cannot be
  dead-stripped because it is `.globl`.

**The good news**: the ABI is already compatible. The prologue
(`src/codegen.tt:emit_prologue`) does the standard `stp x29, x30, [sp, #-16]!`,
the parameters arrive in x0–x7, the return value leaves through x0/w0, and the
regalloc uses `NREGS = 7` mapped to **x9–x15** (`src/ir.tt:718`) plus x16 as
scratch — all caller-saved in AAPCS64, so there are no callee-saved registers to
preserve. A `fun f(p: *u8, n: u64) -> u64` is binary-identical to a Rust
`extern "C" fn(*const u8, u64) -> u64`, and a `str` parameter expands into two
registers (ptr, len), which matches `(*const u8, usize)`.

That is: **what is missing is an `--emit=obj` / `--no-entry` flag suppressing
`emit_macos_start`**. It is a change of a few lines in `codegen()`, plus
regenerating the seed and re-verifying the fixpoint. That unblocks everything
else.

### 2. Platform coverage

videodrome's `.github/workflows/ci.yml` builds on `macos-latest` **and**
`windows-latest`, and `Cargo.toml` declares `crate-type = ["staticlib",
"cdylib", "rlib"]` for Tauri Mobile (Android). There is a `src/winutil.rs` and
`[target.'cfg(windows)'.dependencies]` blocks.

Tetsuo emits **AArch64 only**, and only macOS (native Mach-O) or Linux (through
the `bootstrap/linux/shim.s` shim, which translates BSD→Linux syscalls). There
is no x86_64 backend and no PE/COFF.

Practical consequence: any module ported to tetsuo would have to be
**maintained twice** — a tetsuo version under `cfg(all(target_os = "macos",
target_arch = "aarch64"))` and a Rust version for the rest. Two implementations
of the same logic that have to be kept in sync is worse than one. This only pays
off if the module is stable and rarely touched.

### 3. Expressiveness gaps that make any port more expensive

Verified against `src/lexer.tt` and `LENGUAJE.md`:

- **There is no `%`.** There is no `TK_PERCENT` and no `OP_MOD`. You have to
  write `a - (a / b) * b` by hand at every site.
- **There is no `&&`, `||` or `!`.** `&` and `|` are bitwise; the only token
  with `!` is `!=`. Every compound condition unfolds into nested `if`s.
- **There are no constant tables.** `const` only admits an integer literal, and
  string literals are only valid as the initializer of `let s: str = '...'`.
  The `RESOLUTIONS` / `SOURCES` / `CODECS` tables of `release_name.rs` (32
  string→string pairs) cannot be declared; they have to be encoded as a cascade
  of `if`s inside a function, or built in the arena at startup.
- **Structs with every field 8 bytes.** `sizeof(T)` = number of fields × 8,
  whatever the declared type. A `ParsedRelease` wastes space, but it works.
- **No generics, no enums, no `Option`.** `lib/vec.tt` stores opaque elements
  and does no bounds checking. `Option<u16>` is modeled with a sentinel
  (`0xFFFF`) and you have to be disciplined.
- **No UTF-8 and no Unicode.** Bytes only. See the concrete case below.
- At most 8 parameters, nested loops ≤ 16, at most 32 imports, no namespaces and
  no incremental builds.

## The real candidate: `src/torrents/release_name.rs`

770 LOC. A parser of scene/P2P release names. Zero async, zero networking, zero
floating point, zero serde, zero processes, zero clock. Only `String`/`Vec` (34
occurrences) — and all of them are relocatable to an arena.

It fits because it is exactly what tetsuo does well and has been doing since
milestone 15: **tokenize bytes and decide on the structure**. It is the same
pattern as `src/lexer.tt` and `src/parser.tt`.

Translation map, function by function:

| Rust | tetsuo | Note |
|---|---|---|
| `tokenize() -> Vec<String>` | a `Vec` of `(start, len)` over the input buffer | no byte copying; faster than the original |
| `to_ascii_lowercase()` | byte arithmetic | trivial |
| `parse_sxxeyy` / `parse_sxx` / `parse_episode_only` | a digit loop + `parse_u64` from `lib/parse.tt` | direct |
| `parse_year` | a range comparison | direct |
| `match_tag` against tables | a cascade of `if`s with `string_eq` (`lib/string.tt`) | verbose; see the constant table gap |
| `split('-').next()` | `string_find_byte` (`lib/string.tt`) | already exists |
| `Option<u16>` | a `0xFFFF` sentinel | manual discipline |
| `tokens[..cut].join(" ")` | a write into an arena buffer | direct |
| `ParsedRelease` | a `struct` of 7 fields (56 B) | 8 B per field |

**The only real behavior gap**: `normalize_title` uses
`char::is_alphanumeric()` and `char::to_lowercase()` over **Unicode
codepoints**, and there is a test that locks it in:

```rust
assert_eq!(normalize_title("流浪地球 2019"), "流浪地球 2019");
assert_eq!(normalize_title("千と千尋の神隠し"), "千と千尋の神隠し");
assert_eq!(normalize_title("기생충 2019"), "기생충 2019");
```

Tetsuo does not decode UTF-8 and has no Unicode tables. The reasonable
approximation — decoding UTF-8 by hand and treating every codepoint ≥ U+0080 as
alphanumeric — passes those three tests, but **is not equivalent**: it will
diverge on non-ASCII punctuation (typographic dashes, CJK quotes, `·`), which
the original turns into a separator and the approximation would preserve. Given
that `normalize_title` feeds the title matching in `torrents/mod.rs:602` and
`:676` and in `gui/mod.rs:1099`/`:1281`, a divergence there silently degrades
search results. It is an acceptable risk but it has to be decided deliberately,
not discovered.

**A point in favor**: the module brings **34 tests** that serve as a port
oracle. It can be ported and validated against them by running both
implementations over the same corpus.

## Partial candidates (not today)

- **`src/keyframes.rs`** (838 LOC) — the EBML/MKV parsing (`SeekHead`, `Cues`,
  varints) and the `stss`/`stts` tables of MP4 are pure byte crunching that
  tetsuo would do well. But the module is interwoven with `reqwest` Range
  requests (10 occurrences), `async` (23) and `f64` (19) for timestamps. A pure
  `bytes -> Vec<u64>` core would have to be extracted in Rust first and only
  then ported. That refactor has value in itself, with or without tetsuo.
- **`src/stream/hls/argv.rs`** (726 LOC) — argv construction for ffmpeg, with no
  async and no networking. But it uses `Command::new` (4) and synchronization
  (15), and the result is a `Vec<String>` passed to `std::process`. The benefit
  of porting it is nil.
- **`lib/sha256.tt`** already exists in tetsuo and is verified against
  `hashlib`. If the backend needed pure hashing, that piece is ready — but
  videodrome does not need it today.

## What would have to land in tetsuo, in order

1. **`--emit=obj` (or `--no-entry`)**: suppress `emit_macos_start` in
   `codegen()`. Without this there is no possible integration. It requires
   regenerating the seed and re-running the fixpoint.
2. **The `%` operator**: `TK_PERCENT` + `OP_MOD` + `udiv`/`msub` in both
   codegens. Cheap, and it removes noise from every arithmetic port.
3. **Constant string tables**: some way of declaring an array of `str` at the
   top level. It is the gap that generates the most artificial code.
4. **`&&` / `||` / `!`** with short circuiting. Quality of life, but it changes
   the IR (short-circuit labels).
5. **A UTF-8 decoder in `lib/string.tt`**: `str_next_codepoint`. Necessary for
   anything that touches movie titles.
6. Only afterwards: talk about networking, clock or concurrency — and for that,
   the videodrome backend is not the right proving ground.

## Recommendation

Tetsuo crossed a real, verified threshold in August: it self-compiles bit for
bit, emits a signed Mach-O with no external toolchain, and `bootstrap/verify.sh`
is 35/35 on macOS arm64. That is a serious compiler. But "serious compiler" and
"ready to replace parts of a cross-platform streaming backend" are two different
thresholds, and the second is far off: 82% of the backend is async and floating
point, 74% is networking, and there is no x86_64 or Windows backend.

What does make sense **as an exercise in validating the language, not as a
product improvement**:

1. Add `--emit=obj`.
2. Port `release_name.rs` to tetsuo, with the 34 tests as an oracle.
3. Link it into videodrome under `cfg(all(target_os = "macos", target_arch =
   "aarch64"))`, with the Rust implementation intact as a fallback and as a
   differential reference.

That exercises the complete route — ABI, linking, arenas, strings — over real
code and with a safety net, and produces a concrete list of frictions for the
next language milestone. What you should **not** do is replace the Rust
implementation: as long as videodrome ships Windows binaries, the tetsuo module
is always the secondary copy.

---

**Scope of this research**: a static reading of the code of both repositories.
Neither `bootstrap/verify.sh` was run nor anything compiled with tetsuo — the
container of this session is Linux x86_64 with no `qemu-aarch64` and no AArch64
cross assembler, and the `bootstrap/tetsuoc.macho` seed is an arm64 binary. The
claims about the ABI, the entry point and the operators come from reading
`src/codegen.tt`, `src/ir.tt` and `src/lexer.tt`; those about backend coverage,
from counting over videodrome's 54 `.rs` files.
