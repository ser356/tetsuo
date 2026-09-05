# Microbenchmarks

Three kernels compare the tetsuo backend against Clang `-O0` and `-O2`: byte traversal, arithmetic in a loop, and chained calls.

Run `bash bench/run.sh`. Every binary validates the same checksum. The timings are wall-clock seconds and must be compared within a single run; they are not part of `bootstrap/verify.sh`.

The script also measures `tests/fixpoint_macho_build.sh`. Run it several times and compare medians; close other workloads before taking a baseline.
