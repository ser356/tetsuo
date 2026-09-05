# Direct Mach-O plan — completed

Closed 2026-09-04.

## Goal

Emit self-contained, ad-hoc-signed AArch64 Mach-O executables directly from
tetsuo with no assembler, linker, or codesign dependency.

## Completed milestones

| Milestone | Result |
|---|---|
| 24.a | `<<` and `>>` lexer/parser/IR/codegen support |
| 24.b | AArch64 instruction encoder in `src/asm.tt` |
| 24.c | SHA-256 implementation and vectors in `lib/sha256.tt` |
| 24.d | Mach-O headers, segments, sections, entry, and smoke writer |
| 24.e | Direct IR→AArch64 byte backend in `src/codegen_bytes.tt` |
| 24.f | Embedded ad-hoc code signature with page hashes |
| 24.g | Multi-page text, deterministic BSS, string/BSS fixups, stable UUID |

## Current layout

The writer emits `__PAGEZERO`, executable `__TEXT`, zero-filled `__DATA`,
`__LINKEDIT`, `LC_MAIN`, `LC_BUILD_VERSION`, `LC_UUID`, and `LC_CODE_SIGNATURE`.
Strings live in `__TEXT,__cstring`; BSS lives in `__DATA,__bss`. PC-relative
fixups resolve after final layout. UUID derives from code hash to avoid stale
macOS cache identity.

## Verification

- `tests/macho_build.sh`: minimal signed executable.
- `tests/codegen_bytes_build.sh`: calls, comparisons, strings.
- `tests/codegen_bytes_bss_build.sh`: BSS relocation and execution.
- `tests/codegen_bytes_bigtext_build.sh`: multi-page text.
- `tests/macho_multipage_build.sh`: large BSS/container isolation.
- `tests/fixpoint_macho_build.sh`: byte-route compiler convergence.
- `bootstrap/verify.sh`: complete integrated suite.

This file is retained as architecture history. There are no open Mach-O
milestones.
