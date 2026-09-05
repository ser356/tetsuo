# Backend roadmap — closed

The planned backend roadmap is complete as of 2026-09-05.

## Delivered

- Linkable macOS ARM64 object mode with C/Rust ABI smoke.
- Freestanding library subset with caller-owned scratch.
- Signed integers, casts, modulo, shifts, logical short-circuiting, and UTF-8.
- Natural struct layout and non-8-byte arrays.
- Arbitrary call arity and ABI stack arguments.
- Direct signed Mach-O ARM64 executable writer.
- Direct ELF64 AArch64 executable writer and Linux runtime.
- Direct PE32+ ARM64 writer and msvcrt runtime.
- Complete Windows x64 textual backend and deterministic COFF→PE linker.
- Native macOS/Linux/Windows fixpoints in GitHub Actions where runners exist.
- Deterministic BSS/string layouts and reproducible seeds.

## Architecture decision

One frontend/checker/lowering pipeline feeds one IR. Backend-specific code owns
calling convention, instruction selection, runtime mapping, and executable
container. No platform conditionals leak into parser or semantic checker.

## Acceptance criteria

A backend is complete when it:

1. covers every IR opcode and scalar width/sign;
2. implements target call ABI including excess arguments;
3. emits strings and BSS deterministically;
4. maps runtime I/O and process exit;
5. creates a loadable executable with argc/argv entry;
6. compiles the compiler twice to identical output;
7. compiles and runs an rc=42 smoke when hardware exists;
8. has structural tests when native hardware does not exist.

Current readiness is in `docs/BACKEND-READINESS.md`; exact seed hashes are in
`SELFHOST-STATE.md`.

## Future ideas

Not scheduled: direct AMD64 byte encoding, Linux/macOS x64, dynamic libraries,
debug information, unwind tables, richer OS APIs, and separate compilation.
