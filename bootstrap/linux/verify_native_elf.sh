#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
build=build/linux-native
mkdir -p "$build"
run=()
if [[ $(uname -m) != aarch64 ]]; then
	command -v qemu-aarch64 >/dev/null || { echo 'SKIP: qemu-aarch64 no disponible'; exit 0; }
	run=(qemu-aarch64)
fi
"${run[@]}" bootstrap/tetsuoc.elf --emit=elf tests/fixpoint_entry.tt -o "$build/stage1.elf"
chmod +x "$build/stage1.elf"
"${run[@]}" "$build/stage1.elf" --emit=elf tests/fixpoint_entry.tt -o "$build/stage2.elf"
chmod +x "$build/stage2.elf"
cmp "$build/stage1.elf" "$build/stage2.elf"
cat > "$build/smoke.tt" <<'EOF'
fun main() -> u64 { return 42 }
EOF
"${run[@]}" "$build/stage2.elf" --emit=elf "$build/smoke.tt" -o "$build/smoke.elf"
chmod +x "$build/smoke.elf"
set +e
"${run[@]}" "$build/smoke.elf"
rc=$?
set -e
[[ $rc -eq 42 ]]
echo 'VERIFY NATIVE ELF OK'
