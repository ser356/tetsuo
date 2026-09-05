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
printf 'Platform: %s; runner: %s\n' "$(uname -s)" "$(uname -m)"
printf 'Compiler: bootstrap/tetsuoc.elf\n'
printf '[1/5] Building stage1 ELF\n'
"${run[@]}" bootstrap/tetsuoc.elf --emit=elf tests/fixpoint_entry.tt -o "$build/stage1.elf"
chmod +x "$build/stage1.elf"
printf '[2/5] Building stage2 ELF\n'
"${run[@]}" "$build/stage1.elf" --emit=elf tests/fixpoint_entry.tt -o "$build/stage2.elf"
chmod +x "$build/stage2.elf"
printf '[3/5] Comparing stage1 and stage2\n'
cmp "$build/stage1.elf" "$build/stage2.elf"
sha256sum "$build/stage1.elf" "$build/stage2.elf"
cat > "$build/smoke.tt" <<'EOF'
fun main() -> u64 { return 42 }
EOF
printf '[4/5] Building smoke ELF\n'
"${run[@]}" "$build/stage2.elf" --emit=elf "$build/smoke.tt" -o "$build/smoke.elf"
chmod +x "$build/smoke.elf"
printf '[5/5] Running smoke ELF; expected exit=42\n'
set +e
"${run[@]}" "$build/smoke.elf"
rc=$?
set -e
printf 'Smoke exit: %s\n' "$rc"
[[ $rc -eq 42 ]]
echo 'VERIFY NATIVE ELF OK'
