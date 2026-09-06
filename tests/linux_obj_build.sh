#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
runner=
link=1
case "$(uname -s):$(uname -m)" in
    Linux:aarch64)
        compiler=${TETSUOC:-bootstrap/tetsuoc.elf}
        cc=(${CC:-cc})
        ;;
    Linux:*)
        compiler=${TETSUOC:-bootstrap/tetsuoc.elf}
        command -v qemu-aarch64 >/dev/null
        runner=qemu-aarch64
        cc=(${CC:-aarch64-linux-gnu-gcc})
        ;;
    Darwin:arm64)
        compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
        cc=(clang --target=aarch64-linux-gnu)
        link=0
        ;;
    *)
        exit 1
        ;;
esac

cat > "$tmp/component.tt" <<'EOF'
fun tt_component_add(a: u64, b: u64) -> u64 {
    return a + b
}
EOF
if [[ -n $runner ]]; then
    "$runner" "$compiler" --emit=obj --target=linux "$tmp/component.tt" -o "$tmp/component.s"
else
    "$compiler" --emit=obj --target=linux "$tmp/component.tt" -o "$tmp/component.s"
fi
grep -q '^tt_component_add:' "$tmp/component.s"
grep -q '\.section \.note\.GNU-stack,"",@progbits' "$tmp/component.s"
if grep -Eq '(^|[[:space:]])(_?tt_start|main|exit)($|[[:space:]])' "$tmp/component.s"; then
    exit 1
fi
"${cc[@]}" -c "$tmp/component.s" -o "$tmp/component.o"
if [[ $link == 0 ]]; then
    exit 0
fi
test -z "$(nm -u "$tmp/component.o")"
cat > "$tmp/component.c" <<'EOF'
#include <stdint.h>
extern uint64_t tt_component_add(uint64_t, uint64_t);
int main(void) { return tt_component_add(19, 23) == 42 ? 0 : 1; }
EOF
"${cc[@]}" "$tmp/component.c" "$tmp/component.o" -o "$tmp/component"
if [[ -n $runner ]]; then
    "$runner" "$tmp/component"
else
    "$tmp/component"
fi