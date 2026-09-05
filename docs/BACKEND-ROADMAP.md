# Implementation guide: taking tetsuo into parts of the backend

## Status — 4 September 2026

- ✅ Phase 0: `--emit=obj`, C linking and the AArch64 ABI verified.
- ✅ Phase 1: `lib/freestanding.tt`, caller-supplied arena and a two-thread smoke
  test.
- ✅ Phase 2: strict UTF-8 decoder with valid and invalid vectors.
- ✅ Checkpoint: release parser in `lib/release_name.tt`, ABI v1 and the
  assembly integrated into Videodrome for `aarch64-apple-darwin`; Rust remains
  the fallback and the differential oracle.
- ✅ Phase 3: `%`, `!`, `&&` and `||`, short circuiting checked included.
- ⏸ Phase 4: deferred. The parser already works with cascades; a real table
  requires a global layout, relocations and 16-byte `str` loads with no consumer.

An operational companion to `docs/BACKEND-READINESS.md`. That one says *what* is
portable and why; this one says *how* to get there, in what order and with what
closing criterion per milestone.

A concrete, bounded goal: **have `videodrome/src/torrents/release_name.rs`
compile in tetsuo and link into the Rust binary**, with the Rust implementation
alive as a differential reference. Not "tetsuo for the backend". That goal is
what orders the phases; anything that does not serve it goes last.

---

## 0. The constraint that orders everything: the bootstrap ratchet

There is no stage0 in C. `find . -name '*.c'` returns nothing: **the compiler is
`bootstrap/tetsuoc.s`**, the assembly of a previous version of itself, and
`bootstrap/tetsuoc.macho` its signed binary. Every `src/*.tt` is compiled with
that seed.

Hence the rule that governs any language change:

> A new feature **cannot be used in the compiler itself** until a committed seed
> exists that understands it.

That forces a cadence of **two commits** per feature you want to dogfood:

| | Content | State of the tree when finished |
|---|---|---|
| **Commit A** | Implement the feature in `src/*.tt` writing **only in the old language**. Regenerate `bootstrap/tetsuoc.s`. Fixpoint green. | The seed understands the feature; the compiler does not use it yet. |
| **Commit B** | You can now use the feature inside `src/*.tt` and `lib/*.tt`. Regenerate the seed again. | Dogfooding closed. |

Mixing A and B into one commit breaks the bootstrap: the old seed cannot compile
the new `src` and you are left with no way of generating the new seed. If that
happens, the way out is a `git checkout` of `src/` to the last good seed and a
redo.

Commit `d973032` (milestone 24.a, shifts) is a textbook commit A. Use it as a
literal template.

---

## 1. Anatomy of a language change

What 24.a touched, updated: when the shifts were added, `codegen_bytes.tt` and
`asm.tt` **did not exist yet** (they arrived in 24.b/24.e). Today there are
**two backends** and any new operator has to land in both, or `--emit=macho`
silently diverges from the textual path.

| # | File | What gets touched |
|---|---|---|
| 1 | `src/lexer.tt` | a new `const TK_*` + recognition in `lex_next` |
| 2 | `src/parser.tt` | `const OP_*` + precedence in `bin_prec` + mapping in `parse_expr` |
| 3 | `src/ir.tt` | only if the operation does not fit in `IR_BINOP` |
| 4 | `src/codegen.tt` | mnemonic in `out_binop_mnemonic` (textual backend) |
| 5 | `src/asm.tt` + `src/codegen_bytes.tt` | encoder + a case in `cgb_alu` (byte backend) |
| 6 | `tests/*_test.tt` + `bootstrap/verify.sh` + `bootstrap/linux/verify_linux.sh` | smoke test with a distinct rc per failure case |
| 7 | `bootstrap/tetsuoc.s` | regenerated seed |
| 8 | `LENGUAJE.md` | precedence / operator table |

**The `TK_*` and `OP_*` tokens are a numeric contract.** Always add at the end
of the series. Inserting in the middle renumbers everything after it, and
milestone 15.2b already documents what fixing that desynchronization costs.

---

## 2. Three things that change the plan

### 2.1 Global state is the real problem, not the syntax

`grep '^bss ' lib/ src/` returns ~48 MB of mutable global state:

```
lib/ast.tt:24:        bss AST_BUF: 16777216
src/runtime/io.tt:40: bss IO_BUF: 16777216
src/main.tt:63:       bss PP_ARENA_BUF: 16777216
```

plus the lexer and parser state (`LX_STATE`, `TOK_CUR`, `CUR_FUNC`,
`STR_HEAD`…). For a one-shot compiler that is correct. For code that links
inside videodrome it has two serious consequences:

- **It is not reentrant.** `release_name::parse` is called from the search
  pipeline in `torrents/mod.rs:637`, which runs under tokio with several
  workers. Two threads entering a tetsuo function that uses a global arena at
  the same time corrupt the arena. It is not a theoretical risk: it is memory
  corruption.
- **48 MB of `__DATA,__bss`** in every videodrome binary that links the module.

**The solution needs no language change at all.** The reentrant idiom already
exists and is proven in `tests/cat.tt`, `tests/hello.tt` and
`tests/expr_main.tt`:

```
let ar: Arena
arena_init(&ar, buf, buflen)
```

`Arena` as a local by value, `&ar` to pass it. The buffer is supplied by the
caller. Applied to the port:

```
fun tt_release_parse(scratch: *u8, scratch_len: u64,
                     name: *u8, name_len: u64,
                     out: *ParsedOut) -> u64 {
    let ar: Arena
    arena_init(&ar, scratch, scratch_len)
    ...
}
```

Rust reserves the scratch (a `Vec<u8>` or a stack buffer), passes it, and the
call is pure and reentrant. Zero `bss`, zero shared state, zero mutexes.

**Rule for all tetsuo code meant to be linked: `bss` is forbidden.**

### 2.2 A reentrant subset of the stdlib already exists

Crossing the `bss` `grep` with what `release_name.rs` needs:

| Module | `bss` | Linkable? |
|---|---|---|
| `lib/str.tt` — `bytes_eq`, `mem_copy` | no | ✅ |
| `lib/string.tt` — `string_eq`, `string_has_prefix`, `string_find_byte` | no | ✅ |
| `lib/parse.tt` — `parse_u64`, `parse_i64` | no | ✅ |
| `lib/vec.tt` — `Vec` over an arena passed as an argument | no | ✅ |
| `lib/fmt.tt` | `DIGITS`, `ERR_*` | ❌ |
| `lib/stdio.tt` | `STDOUT_*`, `STDERR_*` | ❌ |
| `src/runtime/io.tt` | `IO_BUF` | ❌ partially |

The green subset is **exactly the one the port needs**. There is no new stdlib
to write; the subset has to be documented and not stepped outside of. Concrete
action: add a `lib/freestanding.tt` importing only those four modules, as the
counterpart of `lib/std.tt`.

### 2.3 The MVP is smaller than it looks

Going over what `release_name.rs` really needs:

| Feature | Does the port need it? |
|---|---|
| `--emit=obj` | **Yes — blocking** |
| Freestanding discipline (§2.1) | **Yes — blocking** |
| UTF-8 decoder | **Yes**, so as not to degrade `normalize_title` |
| The `%` operator | No |
| `&&` / `\|\|` / `!` | No — verbosity only |
| Constant string tables | No — there is a workaround |
| Generics | No |
| Allocator interface | No |

And of the three blockers, **two do not touch the compiler**: they are library
discipline. The only real compiler change needed to reach the goal is
`--emit=obj`, and it is about 15 lines.

This reorders the work completely: the path to the goal is **short**. What is
long is everything that comes afterwards, and that part is optional.

---

## 3. Phase 0 — `--emit=obj`

**Problem.** `codegen()` in `src/codegen.tt` calls `emit_macos_start`
unconditionally for `TGT_MACOS`, which emits a global `_tt_start` with
`bl _main`. When linking into Rust: `_main` undefined, or a collision.

**What NOT to do.** Write a relocatable Mach-O writer (`MH_OBJECT` + symbol
table + relocation entries) in `macho.tt`. That is a whole milestone and it is
not needed: the textual path already produces a `.s` that `clang -c` turns into
a `.o`. `--emit=obj` only has to mean "the same `.s`, without the entry stub".

**Implementation.** Following the `set_target`/`get_target` pattern that already
exists in `codegen.tt`:

```
bss G_NO_ENTRY: 8

fun set_no_entry(v: u64) { let p: *u64 = G_NO_ENTRY  p[0] = v }
fun get_no_entry() -> u64 { let p: *u64 = G_NO_ENTRY  return p[0] }
```

and in `codegen()`:

```
if target == TGT_MACOS {
    if get_no_entry() == 0 { emit_macos_start(o) }
}
```

In `src/main.tt`, next to `flag_macho` and `flag_linux`:

```
let flag_obj: str = '--emit=obj'
let is_obj: u64 = cstr_eq(a1, flag_obj.ptr, flag_obj.len)
```

and `set_no_entry(is_obj)` before calling `codegen`. Mind this: `main` reads the
arguments **from the end** (`argv[argc-3]` input, `argv[argc-1]` output)
precisely so that the flags at the front do not shift positions — respect that
convention.

**Symbol prefix.** The tetsuo symbols are global, with no namespaces, and they
come out with a leading `_`. A `fun parse(...)` becomes `_parse` and collides
with any C `parse` in the final binary. Two ways out:

- a manual convention: name everything `tt_release_*` in the source (zero code,
  and it is what I recommend to start with);
- a `--symbol-prefix=` flag: cleaner, but it touches `emit_sym` in both
  backends.

**Milestone closure.** A `.tt` with no `main` compiles with `--emit=obj`,
`clang -c` turns it into a `.o`, and a three-line `main.c` calls it and returns
the expected value. Add it as `tests/obj_link_build.sh` to
`bootstrap/verify.sh`. And the fixpoint stays green: `--emit=obj` does not
change the default output.

---

## 4. Phase 1 — Freestanding discipline

No compiler changes.

1. Create `lib/freestanding.tt` importing `str.tt`, `string.tt`, `parse.tt`,
   `vec.tt` in that order (the preprocessor requires every reference to point at
   an already expanded file).
2. Document the "caller's arena" pattern in `idioms.md`: `let ar: Arena` +
   `arena_init(&ar, buf, len)`, with the explicit prohibition of `bss` in
   linkable code.
3. Smoke test: a `.tt` that uses the subset, compiles with `--emit=obj`, and is
   called **from two C threads** over distinct scratch buffers. It is the
   reentrancy test, and it is what justifies this whole phase.

**Closure.** The two-thread smoke test passes with a clean ThreadSanitizer.

---

## 5. Phase 2 — UTF-8 in `lib/string.tt`

No compiler changes. It is the port's only *behavior* gap.

`normalize_title` uses `char::is_alphanumeric()` over Unicode codepoints, and
`normalize_title_preserves_cjk` locks it in with Chinese, Japanese and Korean
titles.

```
fun str_next_codepoint(p: *u8, len: u64, i: u64, out_cp: *u64) -> u64
```

It returns the number of bytes consumed (0 if the sequence is invalid) and
writes the codepoint into `out_cp`. Standard UTF-8 decoding; with the shifts of
milestone 24.a already available, it is direct arithmetic.

**A decision to be made deliberately, not discovered.** The rule "every
codepoint ≥ U+0080 counts as alphanumeric" passes the three CJK tests but
**diverges** on non-ASCII punctuation: typographic dashes, CJK quotes and `·`
would still be separators in Rust and would stop being so in tetsuo. That
function feeds the title matching in `torrents/mod.rs:602`, `:676` and
`gui/mod.rs:1099`/`:1281`.

Recommendation: implement the approximation **and** add a differential test to
the port over a corpus of real titles comparing both implementations field by
field. If the divergence shows up in <0.1% of the corpus, it is acceptable and
it is measured. If not, a table of Unicode punctuation ranges is needed (about
30 entries cover what appears in release names).

**Closure.** `tests/utf8_test.tt` with 1–4 byte vectors, truncated and overlong
sequences. Plus the corpus differential on the port side.

---

## 6. Checkpoint: the port is possible from here

With phases 0–2 closed, `release_name.rs` is portable. **Everything that follows
is quality of life and does not block the goal.** If the port reveals frictions
different from the expected ones, that list rules over this one.

---

## 7. Phase 3 — Arithmetic and logic

### 7.1 The `%` operator — do it in the IR, not in the parser or the codegen

It looks like the trivial change on the list. It is not, and the two obvious
routes are wrong:

**Wrong: desugaring in the parser** to `a - (a / b) * b`. It duplicates the `a`
and `b` subtrees, and the lowering lowers them **twice**. If `a` is a call, it
runs twice. A silent semantic bug.

**Wrong: one more case in `cgb_alu` / `out_binop_mnemonic`.** AArch64 has no
modulo instruction: it is two (`udiv tmp, ra, rb` + `msub rd, tmp, rb, ra`) and
a temporary register is needed. Both emitters assume today that "one binop = one
instruction of the form `mnemonic rd, ra, rb`" (look at `emit_i_binop` and
`cgb_alu`). Breaking that invariant touches both backends and needs a free
scratch — and `x16`/`x17` are already used to materialize the sources, and `x18`
is **reserved by the platform on macOS**, so it will not do.

**Right: desugar in `lower_expr`**, in `src/ir.tt`. You lower each operand
**once** into its slot and emit three already existing `IR_BINOP`s:

```
sa = lower(lhs)          // only once
sb = lower(rhs)          // only once
t1 = IR_BINOP(OP_DIV, sa, sb)
t2 = IR_BINOP(OP_MUL, t1, sb)
d  = IR_BINOP(OP_SUB, sa, t2)
```

Correct semantics, zero new encoders, zero changes in either backend, and the
signed variant comes for free because `OP_DIV` already distinguishes
`is_signed`. It costs one instruction more than the optimum; that is the right
price for not touching the codegen.

Files: `lexer.tt` (`TK_PERCENT`), `parser.tt` (`OP_MOD`, precedence 6 alongside
`*` and `/`), `ir.tt` (the desugaring). **Not** `codegen.tt` and not
`codegen_bytes.tt`.

### 7.2 Unary `!` — desugar in the parser, here it is fine

`!x` → `EX_EQ(x, 0)`. A single operand, lowered once, no duplication. Zero
changes in the IR and the codegen.

### 7.3 `&&` / `||` — the most expensive of the three

They need short circuiting, and that means **labels inside `lower_expr`**, which
today emits none (only `lower_stmt` does, through `ir_new_label`). The shape for
`a && b`:

```
d = 0
sa = lower(a)
JZ sa -> Lend
sb = lower(b)
d = (sb != 0)
Lend:
```

`IR_JZ` and `ir_new_label` already exist; what is new is that an expression
gains control flow, which interacts with the linear regalloc (`cross`-label, not
just `cross`-CALL). **Review `regalloc` in `ir.tt` before considering this
closed**: a value live across a branch needs the same treatment a value live
across a `CALL` gets today. It is the point where it is easiest to introduce a
bug that only shows up under high register pressure.

Suggestion: a milestone of its own, with a smoke test that forces >7
simultaneously live values (`NREGS = 7`) around an `&&`.

---

## 8. Phase 4 — Constant string tables

**Decision after the port: deferred as YAGNI.** The current cascades are
encapsulated in `tt_release_tag_id`; they have not blocked the port or its
integration. It reopens only if another real table appears and justifies layout,
relocations and loading 16-byte aggregates in both backends.

It is the gap that generates the most artificial code: the 32 pairs of
`RESOLUTIONS`/`SOURCES`/`CODECS` end up as a cascade of `if`s.

**Start with the workaround, not with the feature.** A generated function:

```
fun codec_canon(tok: *u8, n: u64, out: *str) -> u64 {
    let k1: str = 'x265'
    if string_eq(tok, n, k1.ptr, k1.len) == 1 { ... return 1 }
    ...
}
```

Ugly, but it works today and it can be generated with a script from the Rust
table, which additionally guarantees that the two implementations do not
desynchronize.

If it still hurts after the port, the real feature is
`const NAMES: [str] = ['a', 'b']` at the top level. A non-obvious detail in its
favor: in the byte backend it is **easier** than in the textual one.
`--emit=macho` produces a final image with known vaddr, so the table is written
with already resolved absolute addresses; the textual path needs `.quad _Lstr0`
and has to delegate to the linker. The opposite of what one would expect.

---

## 9. Phase 5 — What you should not do yet

- **Generics / `Vec[T]`.** The byte-generic `Vec` (`esz` + `*u8` + a cast in the
  caller) covers the entire port. Generics are a big milestone and they do not
  serve the goal.
- **Allocator interface.** Necessary the day you want long-lived code (a server
  that cannot leak memory on every growth). A pure parser called from Rust with
  a caller-supplied scratch does not need it.
- **Networking, clock, concurrency.** The videodrome backend is not the right
  proving ground: they are exactly the parts where Rust and tokio already do a
  job tetsuo is not going to match.
- **An x86_64 or PE/COFF backend.** Only if you decide the tetsuo module should
  be the default path instead of the secondary copy. As long as videodrome ships
  Windows binaries, it is not.

---

## 10. Verification

Every milestone closes with **all** of these green, not some:

1. `bootstrap/verify.sh` — 35/35 on macOS arm64, plus the milestone's new smoke
   test.
2. `bootstrap/linux/verify_linux.sh` — fixpoint and smoke tests under qemu.
3. `bootstrap/linux/verify_macho_linux.sh` — the binaries emitted as bytes, not
   just the asm. It is the one that separates "bad codegen" from "bad
   container".
4. **Bit-for-bit fixpoint**: `tests/fixpoint_build.sh` → `cmp s0.s s1.s` and
   `cmp s1.s s2.s` clean. If a language change breaks this, the change is wrong,
   not the fixpoint.
5. Seed regenerated and committed in the same commit as the feature.

A milestone with a green suite and a broken fixpoint **is not closed**: it means
the compiler no longer reproduces itself, and the next change starts from a base
that cannot be rebuilt.

---

## Summary of the order

| Phase | Work | Touches the compiler? | Blocks the goal? |
|---|---|---|---|
| 0 | `--emit=obj` | yes (~15 lines) | **yes** |
| 1 | Freestanding discipline + `lib/freestanding.tt` | no | **yes** |
| 2 | `str_next_codepoint` in `lib/string.tt` | no | **yes** |
| — | **Port `release_name.rs`** | — | — |
| 3 | `%`, `!`, `&&`/`\|\|` | yes | no |
| 4 | Constant string tables | yes | no |
| 5 | Generics, allocator, networking, x86_64 | yes | no |

The path to the goal is three phases, and two of them do not touch the compiler.
