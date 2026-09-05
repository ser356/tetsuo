# Mach-O plan — milestones 24.a → 24.f

> **Status: closed (24.a–24.f).** stage1 emits a directly executable ad-hoc
> signed AArch64 Mach-O, with zero external tools. Verified on Linux through
> `bootstrap/linux/verify_linux.sh` (bit-for-bit fixpoint + 24.a–24.f smoke
> tests): the shifts (24.a), the encoder (24.b) against `aarch64-linux-gnu-as`,
> SHA-256 (24.c) against `hashlib`, and the signed Mach-O (24.d/24.f) whose page
> hashes are recomputed and compared (what `codesign -v` does), and which also
> parses cleanly with `llvm-objdump`/`macholib`. The byte codegen (24.e)
> compiles real programs (calls, recursion, comparisons, string literals) into a
> signed Mach-O that runs under qemu and returns the expected value.
> Minor item pending: bss in `__DATA` through the byte route (24.g), already
> supported by the textual route.

Goal: **stage1 emits self-signed AArch64 Mach-O executables directly**, with no `clang`, no `as`/`ld` and no `codesign`. macOS 11+ (Apple Silicon).

Current state: stage1 emits textual `.s` → `clang -c` + `clang -e` produces the binary. clang acts as `as`+`ld`; the resulting executable is signed implicitly by clang.

Desired output: `stage1 → signed Mach-O binary, directly executable`.

## Real state of the submilestones (2026-08-25)

| Milestone | Status      | Pieces in the repo                                              |
|-------|-------------|-----------------------------------------------------------------|
| 24.a  | 🔴 pending  | Neither `TK_LSHIFT`/`TK_RSHIFT` nor `OP_SHL`/`OP_SHR` in `src/lexer.tt`/`src/parser.tt`. `grep '<<\|>>'` over `src/*.tt` finds nothing. It is a prerequisite of 24.b and 24.c. |
| 24.b  | 🔴 pending  | Neither `src/asm.tt` nor `tests/asm_test.tt` exists.            |
| 24.c  | 🔴 pending  | Neither `lib/sha256.tt` nor `tests/sha256_test.tt` exists.       |
| 24.d  | 🟡 in progress | `src/macho.tt` exists with `out_u32_le`, `out_u64_le`, `out_zeros`, `out_segname` + a `write_macho_exit42` skeleton (header + `LC_SEGMENT_64` + `LC_MAIN`). The smoke test `tests/macho42_test.tt` produces `/tmp/tt_macho42`; it runs after an external `codesign -s -`. Still to close: the rest of the LCs (`LC_LOAD_DYLINKER`, `LC_SYMTAB`, `LC_DYSYMTAB`, `LC_UUID`, `LC_BUILD_VERSION`, `LC_CODE_SIGNATURE`) and the automated smoke test in `bootstrap/verify.sh`. |
| 24.e  | 🔴 pending  | `src/codegen_bytes.tt` does not exist.                           |
| 24.f  | 🔴 pending  | It depends on 24.c and 24.d being complete.                      |

This block rules: if a submilestone in the following sections contradicts this table, the table wins.


Structure of the target binary:

```
[mach_header_64                              32B]
[LC_SEGMENT_64  __PAGEZERO                   72B]
[LC_SEGMENT_64  __TEXT (1 section __text)   152B]
[LC_SEGMENT_64  __LINKEDIT                   72B]
[LC_LOAD_DYLINKER /usr/lib/dyld              32B]
[LC_SYMTAB (nsyms=0)                         24B]
[LC_DYSYMTAB (all zero)                      80B]
[LC_UUID                                     24B]
[LC_BUILD_VERSION macos 11.0                 24B]
[LC_MAIN entryoff                            24B]
[LC_CODE_SIGNATURE dataoff/datasize          16B]
[padding up to 0x1000                          ]
[__TEXT code                                   ]
[__cstring (literals)                          ]
[padding to 0x4000                             ]
[__LINKEDIT: CS_SuperBlob                      ]
  [CS_CodeDirectory hdr]
  [ident "adhoc\0"]
  [SHA-256 slot 0]
  [SHA-256 slot 1]
  [...]
```

## Phase A — language infrastructure and encoder

### 24.a — `<<` and `>>` shifts

- **Goal**: binary `<<` and `>>` operators. Without them, SHA-256 and AArch64 encoding are unfeasible.
- **Files**: `src/lexer.tt` (new `TK_LSHIFT` `TK_RSHIFT` tokens), `src/parser.tt` (`OP_SHL` `OP_SHR` constants, `bin_prec` prec 5, `parse_expr` mapping), `src/codegen.tt` (`out_binop_mnemonic` gains `lsl` and `lsr`), `src/ir.tt` (nothing — `IR_BINOP` already covers it).
- **Smoke test**: `tests/shifts_test.tt` with `let x: u64 = 1 << 5; if x != 32 { return 1 }; if (1024 >> 3) != 128 { return 2 }; return 0`. verify.sh: rc=0.
- **LOC**: ~30. Regenerate the seed (+/-500L).
- **Deps**: none.

### 24.b — AArch64 instruction encoder

- **Goal**: for every mnemonic we emit today in `.s`, return the encoded `u32`. It is the key to jumping from text to bytes.
- **Files**: a new `src/asm.tt`. One function per instruction family:
  - `enc_movz(rd, imm16, hw) -> u32`
  - `enc_movk(rd, imm16, hw) -> u32`
  - `enc_mov_reg(rd, rm) -> u32`  (alias of `orr xd, xzr, xm`)
  - `enc_stp_pre(rt, rt2, rn, imm7) -> u32`
  - `enc_ldp_post(rt, rt2, rn, imm7) -> u32`
  - `enc_add_imm(rd, rn, imm12) -> u32`
  - `enc_sub_imm(rd, rn, imm12) -> u32`
  - `enc_add_reg(rd, rn, rm) -> u32`, `enc_sub_reg`, `enc_mul`, `enc_udiv`, `enc_and`, `enc_orr`, `enc_eor`
  - `enc_ldr_x(rt, rn, imm12) -> u32`, `enc_ldr_w`, `enc_ldrb`, `enc_str_x`, `enc_str_w`, `enc_strb`
  - `enc_adrp(rd, imm21) -> u32`, `enc_add_pageoff(rd, rn, imm12)`
  - `enc_bl(imm26) -> u32`, `enc_b(imm26) -> u32`, `enc_cbz_w(rt, imm19)`
  - `enc_cmp_reg(rn, rm) -> u32`, `enc_cset(rd, cond) -> u32`
  - `enc_svc(imm16) -> u32`
  - `enc_ret() -> u32`
- **Smoke test**: `tests/asm_test.tt` validates 8 cases against known encodings (`enc_movz(0,42,0)==0xD2800540`, `enc_ret()==0xD65F03C0`, etc). bytes_eq against a golden table.
- **LOC**: ~250.
- **Deps**: 24.a (it uses shifts for packing).

### 24.c — SHA-256

- **Goal**: `sha256(msg: *u8, mlen: u64, out: *u8)` writing 32 bytes of hash. The foundation of the ad-hoc signature.
- **Files**: a new `lib/sha256.tt`.
- **Smoke test**: `tests/sha256_test.tt` — the hash of `''` (`e3b0c44298fc1c149afbf4c8996fb924...`), of `'abc'` (`ba7816bf8f01cfea414140de5dae2223...`), and of a 128-byte input. bytes_eq against the expected `.byte` array.
- **LOC**: ~250 (K constants table + h init + message schedule + compression + padding).
- **Deps**: 24.a (shifts).

## Phase B — Mach-O writer

### 24.d — Headers and load commands

- **Goal**: emit a valid Mach-O with EVERY LC required by macOS 11+ arm64, with a `__text` section holding dummy `exit(42)` code. The binary must pass `otool -l` and accept `codesign -s -`. With external `codesign`, it must run with rc=42.
- **Files**: a new `src/macho.tt`. Functions:
  - `mo_write_header(o, ncmds, sizeofcmds)`
  - `mo_write_seg_pagezero(o)`
  - `mo_write_seg_text(o, text_size, text_offset, cs_offset, ...)`
  - `mo_write_seg_linkedit(o, offset, size)`
  - `mo_write_load_dylinker(o)`
  - `mo_write_symtab(o)` (nsyms=0, still required)
  - `mo_write_dysymtab(o)`
  - `mo_write_uuid(o, uuid16)`
  - `mo_write_build_version(o)`
  - `mo_write_main(o, entryoff)`
  - `mo_write_code_signature(o, dataoff, datasize)` (placeholder LC)
- **Smoke test**: `tests/macho42_test.tt` emits the binary with only `exit(42)`. `tests/macho42_build.sh` runs an external `codesign -s -`, executes it and verifies rc=42.
- **LOC**: ~400.
- **Deps**: 24.a, 24.b (the encoder for the 3 instructions of the body).

### 24.e — Two-pass byte codegen

- **Goal**: replace the textual `.s` route with ARM64 bytes directly. `codegen.tt` (text) and `codegen_bytes.tt` (bytes) coexist until the byte route is complete.
- **Files**: a new `src/codegen_bytes.tt` with the same surface as `codegen.tt` but with byte output.
  - Two passes:
    1. Pass 1: compute the absolute positions of every function and label. Walk every Ins keeping track of the current offset.
    2. Pass 2: emit bytes. For `bl _sym` compute `(target_offset − current_offset) / 4` and encode it in imm26. For `b .LN`, the same with a local label.
  - Emission of string literals into a `__cstring` segment inside `__TEXT`. `IR_LABEL_ADDR` → `adrp` + `add` with internal relocations.
  - Emission of bss as part of `__DATA,__bss` with `LC_SEGMENT_64 __DATA`.
- **Smoke test**: `tests/codegen_bytes_test.tt` emits the equivalent of `fun main(){return 42}` as bytes, runs an external `codesign -s -`, executes it, rc=42.
- **LOC**: ~800 (mostly displacement + relocation logic).
- **Deps**: 24.b, 24.d.

### 24.f — Embedded ad-hoc signature

- **Goal**: remove the external `codesign`. Write the complete `CS_SuperBlob` into `__LINKEDIT` and hash the 4KB pages.
- **Files**: `src/macho.tt` gains:
  - `mo_write_code_signature_full(o, page_hashes[], nhashes, ident)`.
  - `mo_compute_page_hashes(binary_bytes, code_limit) -> [nhashes][32]`.
  - CS_SuperBlob structure:
    ```
    magic = 0xFADE0CC0
    length = total_bytes
    count = 1
    [blob_index]
      type = CSSLOT_CODEDIRECTORY (0)
      offset = 20
    [CS_CodeDirectory]
      magic = 0xFADE0C02
      length
      version = 0x20400
      flags = 0x20002 (adhoc | linkerSigned) or just adhoc 0x2
      hashOffset = size_of_hdr + ident_len
      identOffset = size_of_hdr
      nSpecialSlots = 0
      nCodeSlots = ceil(codeLimit / 4096)
      codeLimit = fileoff up to just before the CS
      hashSize = 32
      hashType = 2 (SHA-256)
      hashPageShift = 12
      spare1 = 0
      spare2 = 0
    [ident bytes "adhoc\0" 6B]
    [slot_hashes, 32B each]
    ```
- **Ordering challenge**: the hash of every page includes bytes that depend on the LC_CODE_SIGNATURE itself (dataoff/datasize) but NOT on the body of the signature. That is why the layout first writes everything with correct placeholders for the CS_SuperBlob's dataoff/datasize (computable a priori, once `codeLimit` is known), and only the CS_SuperBlob part is filled in at the end.
- **Algorithm**:
  1. Compute every size a priori: text_size, linkedit_size (including the CS_SuperBlob size), signature_offset, signature_size.
  2. Write the headers with the correct signature_offset/size.
  3. Write __TEXT.
  4. Pad up to signature_offset.
  5. Write the CS_SuperBlob header + the CodeDirectory header + ident (with correct hashOffset/identOffset).
  6. **At this point, every byte from 0 to signature_offset+hashOffset is final.**
  7. Re-read/re-hash the complete buffer up to `codeLimit` in 4KB chunks with SHA-256 (24.c) and write 32 bytes for each one where it belongs.
- **Smoke test**: `tests/macho_signed_test.tt` generates a signed binary. `codesign -v` accepts it. `spctl -a` (optional) evaluates it. Run → rc=42. **Zero external tools.**
- **LOC**: ~200 (on top of 24.d and 24.c).
- **Deps**: 24.c, 24.d, 24.e.

## Merge path

With the 6 submilestones:

1. It is possible to **stop at 24.d + external codesign** — functional, a single external tool.
2. It is possible to **close 24.f for a total MVP** — zero externals beyond the kernel.
3. **24.g byte fixpoint**: the committed seed goes from `.s` (18KL of text) to `.macho` (~300KB binary). The diff is done with a bit-for-bit `cmp`.

## Aggregate estimate

| Milestone | LOC  | Risk   | Gain |
|-------|------|--------|----------|
| 24.a  | 30   | low    | Enables 24.b, 24.c |
| 24.b  | 250  | medium | Foundation of the writer |
| 24.c  | 250  | medium | Foundation of the signature |
| 24.d  | 400  | high   | MVP with external codesign |
| 24.e  | 800  | high   | Real byte codegen |
| 24.f  | 200  | medium | Delivers on the promise |
| **Total** | **~1930** | | **stage1 → signed .macho, zero tools** |

Every submilestone with its own smoke test + an intermediate fixpoint. Regenerate `bootstrap/tetsuoc.s` (or `.macho` after 24.g) in each one.
