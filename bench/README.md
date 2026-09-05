# Microbenchmarks

Three kernels compare the tetsuo backend against Clang `-O0` and `-O2`: byte traversal, arithmetic in a loop, and chained calls.

Run `bash bench/run.sh`. Every binary validates the same checksum. The timings are wall-clock seconds and must be compared within a single run; they are not part of `bootstrap/verify.sh`.

The script also measures `tests/fixpoint_macho_build.sh`. Run it several times and compare medians; close other workloads before taking a baseline.

Benchmarks exercise macOS ARM64 code generation. They are performance signals,
not cross-platform correctness tests. Correctness and native fixpoints belong
to `bootstrap/verify.sh`, `bootstrap/linux/verify_native_elf.sh`, and
`bootstrap/windows/verify_native_x64.ps1`.

Record CPU, OS, compiler seed hash, and median of multiple runs with every
published result. Never compare isolated wall-clock values from different
machines.
