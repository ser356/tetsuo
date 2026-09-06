# Backend readiness

Verified 2026-09-05.

## Matrix

| Backend | Codegen | Container | Runtime | Native CI | Status |
|---|---|---|---|---|---|
| macOS ARM64 | direct AArch64 bytes | signed Mach-O | BSD syscalls | yes | production bootstrap |
| Linux AArch64 | direct AArch64 bytes | ELF64 | Linux syscalls | yes | production bootstrap |
| Windows ARM64 | direct AArch64 bytes | PE32+ | msvcrt IAT | structural | complete, hardware untested |
| Windows x64 | textual AMD64 → COFF | deterministic PE32+ linker | msvcrt IAT | yes | production bootstrap |
| macOS ARM64 object | textual AArch64 | external object link | caller | ABI smoke | FFI-ready |
| Linux ARM64 object | textual AArch64 | external object link | caller | smoke | FFI-ready |
| Windows x64 object | textual AMD64 | external COFF assembly | caller | smoke | FFI-ready |
| QEMU virt | textual AArch64 | external bare-metal link | PL011/MMIO | separate | experimental |

## Shared frontend

All native backends consume the same checked IR. Supported operations include
integer widths/signs, casts, memory by width, natural struct offsets, arrays,
comparisons, control flow, calls with ABI stack arguments, strings, BSS,
syscalls, and returns.

## AArch64 byte backend

`src/codegen_bytes.tt` selects macOS, Linux, or Windows runtime behavior. The
same instruction encoder feeds `src/macho.tt`, `src/elf.tt`, and `src/pe.tt`.
Target-specific writers own headers, segments/sections, entry points, fixups,
imports, and string/BSS layout.

## Windows x64 backend

`src/codegen_x64.tt` emits GAS-compatible AMD64 COFF assembly using Windows x64
calling convention, shadow space, excess stack arguments, natural aggregate
stack slots, and page-by-page probing for large frames.

`tools/link_pe_x64.py` resolves AMD64 REL32 relocations, emits import thunks and
`msvcrt.dll` tables, and writes deterministic `.text`, `.rdata`, `.idata`, and
`.bss` sections. Empty programs still receive distinct nonempty virtual
sections so Windows accepts the PE.

## FFI object mode

`--emit=obj` omits process startup. It preserves AAPCS64 on macOS/Linux ARM64
and the Windows x64 ABI with `--target=windows-x64`. `lib/freestanding.tt` has
no global scratch. `lib/release_name.tt` provides a tested C ABI example.

## Verification

- `bootstrap/verify.sh`: full macOS-hosted suite.
- `bootstrap/linux/verify_native_elf.sh`: native Linux fixpoint and smoke.
- `bootstrap/windows/verify_native_x64.ps1`: native Windows fixpoint and smoke.
- `tests/pe_arm64_build.sh`: ARM64 PE structural validation.
- `tests/x64_coff_build.sh` and `tests/x64_pe_build.sh`: x64 assembly/linker
  coverage, including arrays, large frames, imports, and empty data sections.

## Remaining platform extensions

These are future products, not unfinished current milestones:

- Native Windows ARM64 execution in CI when suitable runners are available.
- Direct x64 machine-code emission without Clang COFF assembly.
- Linux x64 and macOS x64 backends.
- Dynamic libraries and richer platform APIs.
