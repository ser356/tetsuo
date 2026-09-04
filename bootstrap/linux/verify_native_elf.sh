#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
command -v qemu-aarch64 >/dev/null || { echo 'SKIP: qemu-aarch64 no disponible'; exit 0; }
build=build/linux-native
mkdir -p "$build"
qemu-aarch64 bootstrap/tetsuoc.elf --emit=elf tests/fixpoint_entry.tt -o "$build/stage1.elf"
chmod +x "$build/stage1.elf"
qemu-aarch64 "$build/stage1.elf" --emit=elf tests/fixpoint_entry.tt -o "$build/stage2.elf"
cmp "$build/stage1.elf" "$build/stage2.elf"
cat > "$build/smoke.tt" <<'EOF'
fun main() -> u64 { return 42 }
EOF
qemu-aarch64 "$build/stage2.elf" --emit=elf "$build/smoke.tt" -o "$build/smoke.elf"
chmod +x "$build/smoke.elf"
set +e
qemu-aarch64 "$build/smoke.elf"
rc=$?
set -e
[[ $rc -eq 42 ]]
echo 'VERIFY NATIVE ELF OK'
