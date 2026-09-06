# tetsuo

Self-hosted systems language and compiler. Written in tetsuo, it reproduces
itself bit for bit and emits native executables for four targets.

## Platform support

| Platform | CLI | Output | Bootstrap | CI |
|---|---|---|---|---|
| macOS ARM64 | `--emit=macho` | signed Mach-O | `bootstrap/tetsuoc.macho` | native full suite |
| Linux AArch64 | `--emit=elf` | ELF64 | `bootstrap/tetsuoc.elf` | native fixpoint + smoke |
| Windows ARM64 | `--emit=pe-arm64` | PE32+ | `bootstrap/tetsuoc-arm64.exe` | structural |
| Windows x64 | `--target=windows-x64` | GAS/COFF assembly | `bootstrap/tetsuoc-x64.exe` | native fixpoint + smoke |
| macOS ARM64 C ABI | `--emit=obj` | linkable assembly | macOS seed | C/Rust ABI smoke |
| Linux ARM64 C ABI | `--emit=obj --target=linux` | linkable assembly | Linux seed | object smoke |
| Windows x64 C ABI | `--emit=obj --target=windows-x64` | linkable GAS/COFF assembly | x64 seed | COFF smoke |

Bare-metal QEMU `virt` remains a separate experimental route in `test.sh`.

## CLI

```text
tetsuoc --emit=macho input.tt -o output
tetsuoc --emit=elf input.tt -o output
tetsuoc --emit=pe-arm64 input.tt -o output.exe
tetsuoc --target=windows-x64 input.tt -o output.s
tetsuoc --emit=obj input.tt -o module.s
tetsuoc --emit=obj --target=linux input.tt -o module.s
tetsuoc --emit=obj --target=windows-x64 input.tt -o module.s
tetsuoc --target=linux input.tt -o output.s
tetsuoc --diagnostics=json input.tt -o output.s
tetsuoc --dump-tokens input.tt
tetsuoc --dump-ir input.tt
```

Direct Mach-O, ELF, and PE ARM64 emission needs no external assembler or
linker. Windows x64 assembly becomes deterministic PE32+ with Clang's COFF
assembler and `python3 tools/link_pe_x64.py input.obj output.exe`.

## Bootstrap and verification

```bash
bash bootstrap/verify.sh
bash bootstrap/linux/verify_native_elf.sh
pwsh bootstrap/windows/verify_native_x64.ps1
```

GitHub Actions runs macOS ARM64, Linux AArch64, and Windows x64 jobs from
`.github/workflows/verify.yml`. OS scripts print generations, artifacts,
hashes, and smoke exits. Seed hashes live in `SELFHOST-STATE.md`.

## Language

Tetsuo supports signed and unsigned 8/32/64-bit integers, booleans, pointers,
strings, naturally laid-out structs, fixed local arrays of supported element
widths, functions, recursion, lexical scopes, casts, structured control flow,
imports, filesystem I/O, and stable JSON diagnostics.

It intentionally lacks garbage collection, general heap allocation,
namespaces, aggregate values, threads, child processes, networking,
environment, clock, and incremental builds. Checked bump arenas cover
single-lifetime allocation.

See `LANGUAGE.md` for semantics and `idioms.md` for working patterns.

## Imports and libraries

```text
import 'lib/std.tt'
```

Imports expand recursively and deduplicate by path. Symbols share one namespace
and use prefixes such as `io_`, `arena_`, and `string_`.

| Module | Purpose |
|---|---|
| `lib/std.tt` | CLI umbrella |
| `src/runtime/io.tt` | files, exit, pid, directories |
| `lib/arena.tt` | checked bump arena over caller memory |
| `lib/str.tt` | byte equality and copy |
| `lib/string.tt` | string operations and UTF-8 decode |
| `lib/parse.tt` | checked integer parsing |
| `lib/fmt.tt` | buffered formatting and diagnostics |
| `lib/stdio.tt` | buffered stdout/stderr |
| `lib/vec.tt` | arena-backed vector |
| `lib/freestanding.tt` | global-state-free FFI subset |

## Repository

```text
src/                 compiler and native backends
lib/                 language libraries
tests/               source tests and build harnesses
bootstrap/           committed seeds and OS verifiers
tools/               PE linker and context generator
docs/                architecture and agent guides
.github/workflows/    multiplatform CI
```

## Agent context

`AGENT-CONTEXT.md` is generated from normative docs and diagnostics:

```bash
python3 tools/build_agent_context.py
python3 tools/build_agent_context.py --check
```

## Status

Compiler, optional optimization, agent-diagnostic, and multiplatform bootstrap
milestones are closed. `SELFHOST-STATE.md` records current verified state and
history.
