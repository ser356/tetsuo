# tetsuo self-hosting state

Verified 2026-09-05.

## Current seeds

| Platform | File | Bytes | SHA-256 |
|---|---|---:|---|
| macOS ARM64 | `bootstrap/tetsuoc.macho` | 214766 | `3992ce7e0d6f3dbe3aa50c35747014974e9b205c1470591eff08e0e64eda00f7` |
| Linux AArch64 | `bootstrap/tetsuoc.elf` | 200704 | `7017bab5c5eab6ddf6702a16bd292b2c2f91f911091564b7474faa67ec652ef1` |
| Windows ARM64 | `bootstrap/tetsuoc-arm64.exe` | 198144 | `02972c3b6401afdc44b634d67891fd01f8698e726e8dd4aed14233f561f08132` |
| Windows x64 | `bootstrap/tetsuoc-x64.exe` | 589312 | `ba85f95f1e42206b9453590f11b3dafb34f43b6eec7ffaca971913c36c1c5589` |

## Verified invariants

- macOS seed emits stage1/stage2/stage3 Mach-O; converged generations match.
- Linux ARM64 seed executes natively in CI, reproduces its ELF, and runs rc=42.
- Windows x64 seed executes natively in CI, reproduces its PE, and runs rc=42.
- Windows ARM64 PE headers, entry, sections, IAT, imports, and calls pass
  structural validation. Native execution requires ARM64 Windows.
- `bootstrap/verify.sh` passes the full compiler, runtime, negative diagnostic,
  ABI, writer, and fixpoint battery.
- `AGENT-CONTEXT.md` matches its generated inputs.

## Native output paths

- Mach-O ARM64: direct byte codegen, fixups, BSS, string layout, SHA-256 page
  hashes, and embedded ad-hoc signature.
- ELF64 AArch64: direct byte codegen, Linux syscalls, RX/RW segments, BSS, and
  argc/argv entry.
- PE32+ ARM64: direct byte codegen and `msvcrt.dll` IAT runtime.
- PE32+ x64: complete textual x64 backend, COFF assembly, deterministic stdlib
  linker, `msvcrt.dll` runtime, natural aggregate stack layout, and guard-page
  probing for large frames.

## Language/compiler closure

Closed work includes semantic checking, positioned multi-error diagnostics,
JSON Lines diagnostics with stable codes/fixes, structs with natural layout,
non-8-byte arrays, signed arithmetic/casts, arbitrary call arity, dynamic
imports and loop stacks, compact AArch64 frames, callee-saved allocation,
constant folding, volatile memory, peephole optimization, and agent
anti-interference diagnostics.

## Verification commands

```bash
bash bootstrap/verify.sh
bash bootstrap/linux/verify_native_elf.sh
pwsh bootstrap/windows/verify_native_x64.ps1
python3 tools/build_agent_context.py --check
```

CI definition: `.github/workflows/verify.yml`.

## Historical milestones

1. Stage0 assembly established lexer/parser/runtime behavior.
2. Stage1 compiler reached textual AArch64 fixpoint.
3. Direct Mach-O generation removed assembler, linker, and signing dependencies.
4. General-purpose CLI subset added signed integers, arrays, structs, imports,
   filesystem, standard library, checker, and diagnostics.
5. Optional backend work added stack arguments, compact frames, regalloc,
   constant folding, volatility, and deterministic BSS.
6. Agent work added stable JSON diagnostics, anti-interference fixes, cookbook,
   error catalog, metrics, and generated context pack.
7. Portability added native ELF AArch64, PE ARM64, and PE x64 seeds plus a
   three-OS GitHub Actions matrix.

Older milestone-specific claims are intentionally not preserved as active
state; Git history remains the authoritative development log.
