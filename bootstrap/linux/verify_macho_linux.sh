#!/usr/bin/env bash
# Verifica el path --emit=macho COMPLETO sin macOS.
#
# Para cada test de bootstrap/verify.sh que se compila con tests/macos_build.sh:
#   1. stage1 (bootstrappeado desde bootstrap/tetsuoc.s) emite el binario Mach-O
#      firmado ad-hoc con --emit=macho, igual que en macOS;
#   2. check_macho.py revalida la firma recalculando los 4KB-hashes contra el
#      fichero final (lo mismo que hace `codesign -v`);
#   3. macho_exec.py reproduce el layout de memoria del Mach-O (mismos vmaddr de
#      __TEXT y __bss) en un ELF y lo ejecuta bajo qemu-aarch64.
#
# Sirve para separar los dos mundos cuando un binario emitido muere en macOS:
#   - si aqui FALLA -> el problema esta en el codegen de bytes o en los fixups;
#   - si aqui PASA  -> el codigo y el layout son correctos y el fallo de macOS
#     esta en el contenedor (firma, load commands, cache del kernel).
#
# Requiere: qemu-user (qemu-aarch64), binutils-aarch64-linux-gnu, python3.
set -uo pipefail
cd "$(dirname "$0")/../.."

BUILD=build
HARNESS=bootstrap/linux
SEED=bootstrap/tetsuoc.s
mkdir -p "$BUILD/linux"

RED=$'\033[31m'; GREEN=$'\033[32m'; BOLD=$'\033[1m'; RESET=$'\033[0m'
fails=0

for tool in qemu-aarch64 aarch64-linux-gnu-as aarch64-linux-gnu-ld aarch64-linux-gnu-objcopy aarch64-linux-gnu-nm; do
    command -v "$tool" >/dev/null || { echo "falta $tool (apt install qemu-user binutils-aarch64-linux-gnu)" >&2; exit 2; }
done

mk_elf() { # $1=asm macOS  $2=binario ELF de salida
    "$HARNESS/macho2elf.sh" "$1" > "$2.elf.s"
    aarch64-linux-gnu-as "$2.elf.s" -o "$2.o"
    aarch64-linux-gnu-ld -e _linux_start -o "$2" "$2.o" "$BUILD/linux/shim.o"
}

aarch64-linux-gnu-as "$HARNESS/shim.s" -o "$BUILD/linux/shim.o" || exit 2

# stage0: la seed committeada, ejecutable bajo qemu.
mk_elf "$SEED" "$BUILD/linux/stage1" || exit 2

# stage1 con --emit=macho, compilado por la seed desde las fuentes actuales.
EMITTER=$BUILD/linux/main_macho
qemu-aarch64 "$BUILD/linux/stage1" tests/fixpoint_entry.tt -o "$BUILD/main_macho_linux.s" || {
    echo "la seed no pudo compilar tests/fixpoint_entry.tt" >&2; exit 2; }
mk_elf "$BUILD/main_macho_linux.s" "$EMITTER" || exit 2

LIBS="src/runtime/io.tt lib/str.tt lib/fmt.tt lib/vec.tt lib/ast.tt src/lexer.tt
      src/parser.tt src/ir.tt src/codegen.tt lib/sha256.tt src/asm.tt src/macho.tt
      src/codegen_bytes.tt"

check() { # $1=nombre $2=rc esperado $3=fuente  [args...]
    local name=$1 exp=$2 input=$3; shift 3
    printf '  %-42s ' "$name"
    local entry="$BUILD/eml_$name.tt"
    : > "$entry"
    for lib in $LIBS; do
        [[ -f $lib && $lib != "$input" ]] && echo "import '$lib'" >> "$entry"
    done
    echo "import '$input'" >> "$entry"

    if ! qemu-aarch64 "$EMITTER" --emit=macho "$entry" -o "$BUILD/$name.macho" > /tmp/tt_eml.log 2>&1; then
        printf '%sFAIL%s (no compila)\n' "$RED" "$RESET"; cat /tmp/tt_eml.log >&2; fails=$((fails+1)); return
    fi
    if ! python3 "$HARNESS/check_macho.py" "$BUILD/$name.macho" - > /tmp/tt_eml.log 2>&1; then
        printf '%sFAIL%s (firma)\n' "$RED" "$RESET"; cat /tmp/tt_eml.log >&2; fails=$((fails+1)); return
    fi
    if ! python3 "$HARNESS/macho_exec.py" "$BUILD/$name.macho" "$BUILD/$name.elf" > /tmp/tt_eml.log 2>&1; then
        printf '%sFAIL%s (layout)\n' "$RED" "$RESET"; cat /tmp/tt_eml.log >&2; fails=$((fails+1)); return
    fi
    local rc=0
    qemu-aarch64 "$BUILD/$name.elf" "$@" > /tmp/tt_eml.log 2>&1 || rc=$?
    if [[ $rc -eq $exp ]]; then
        printf '%sOK%s\n' "$GREEN" "$RESET"
    else
        printf '%sFAIL%s (rc=%s esp=%s)\n' "$RED" "$RESET" "$rc" "$exp"
        cat /tmp/tt_eml.log >&2; fails=$((fails+1))
    fi
}

printf '\n%sBinarios --emit=macho (runtime + parser)%s\n' "$BOLD" "$RESET"
check argv                4   tests/argv.tt uno dos tres
check nil                 7   tests/nil.tt
check nil2                7   tests/nil2.tt
check parens              9   tests/parens.tt a b c
check sizeof              16  tests/sizeof.tt
check str_test            3   tests/str_test.tt
check fmt_test            4   tests/fmt_test.tt
check vec_test            20  tests/vec_test.tt
check ast_test            33  tests/ast_test.tt
check type_test           23  tests/type_test.tt
check primary_test        42  tests/primary_test.tt
check expr_test1          146 tests/expr_test1.tt
check stmt_test           5   tests/stmt_test.tt
check prog_test           42  tests/prog_test.tt

printf '\n%sBinarios --emit=macho (IR + lowering)%s\n' "$BOLD" "$RESET"
check ir_test             3   tests/ir_test.tt
check lower_int_test      3   tests/lower_int_test.tt
check lower_ret_test      2   tests/lower_ret_test.tt
check lower_let_test      4   tests/lower_let_test.tt
check lower_if_test       9   tests/lower_if_test.tt
check lower_while_test    6   tests/lower_while_test.tt
check lower_cmp_test      4   tests/lower_cmp_test.tt
check lower_call_test     2   tests/lower_call_test.tt
check lower_mem_test      8   tests/lower_mem_test.tt
check lower_prog_test     2   tests/lower_prog_test.tt
check lower_regalloc_test 3   tests/lower_regalloc_test.tt
check lower_str_test      7   tests/lower_str_test.tt
check parse_locals_test   1   tests/parse_locals_test.tt

printf '\n%sBinarios --emit=macho (codegen + Mach-O)%s\n' "$BOLD" "$RESET"
check hex4_test           4   tests/hex4_test.tt
check emit_movi_test      24  tests/emit_movi_test.tt
check emit_prologue_test  174 tests/emit_prologue_test.tt
check emit_instr_test     59  tests/emit_instr_test.tt
check shifts_test         0   tests/shifts_test.tt
check asm_test            0   tests/asm_test.tt
check sha256_test         0   tests/sha256_test.tt
check write_test          0   tests/write_test.tt
check macos_hello         0   tests/macos_hello.tt
check syscall_checked     0   tests/syscall_checked_test.tt

# Reproductor minimo: __TEXT de 7 paginas + ~50MB de __bss con apenas 40
# instrucciones de codigo. Aisla el layout del volumen de codigo.
printf '\n%sLayout multi-pagina aislado%s\n' "$BOLD" "$RESET"
printf '  %-42s ' "macho_multipage (7 paginas + 50MB bss)"
rc=0
qemu-aarch64 "$BUILD/linux/stage1" tests/macho_multipage_entry.tt -o "$BUILD/mp_emit.s" >/dev/null 2>&1 \
    && mk_elf "$BUILD/mp_emit.s" "$BUILD/linux/mp_emit" >/dev/null 2>&1 \
    && rm -f /tmp/tt_macho_multipage \
    && qemu-aarch64 "$BUILD/linux/mp_emit" >/dev/null 2>&1 \
    && python3 "$HARNESS/check_macho.py" /tmp/tt_macho_multipage - >/dev/null 2>&1 \
    && python3 "$HARNESS/macho_exec.py" /tmp/tt_macho_multipage "$BUILD/linux/mp.elf" >/dev/null 2>&1 || rc=98
[[ $rc -eq 0 ]] && { qemu-aarch64 "$BUILD/linux/mp.elf" >/dev/null 2>&1; rc=$?; }
if [[ $rc -eq 20 ]]; then printf '%sOK%s\n' "$GREEN" "$RESET"
else printf '%sFAIL%s (rc=%s esp=20)\n' "$RED" "$RESET" "$rc"; fails=$((fails+1)); fi

# Fixpoint en bytes: el compilador emitido se compila a si mismo bit a bit.
printf '\n%sFixpoint Mach-O en bytes%s\n' "$BOLD" "$RESET"
printf '  %-42s ' "s1 == s2 (--emit=macho self-host)"
rc=0
rm -f "$BUILD/eml_s1.macho" "$BUILD/eml_s2.macho"
qemu-aarch64 "$EMITTER" --emit=macho tests/fixpoint_entry.tt -o "$BUILD/eml_s1.macho" >/dev/null 2>&1 \
    && python3 "$HARNESS/macho_exec.py" "$BUILD/eml_s1.macho" "$BUILD/eml_s1.elf" >/dev/null 2>&1 \
    && qemu-aarch64 "$BUILD/eml_s1.elf" --emit=macho tests/fixpoint_entry.tt -o "$BUILD/eml_s2.macho" >/dev/null 2>&1 \
    && cmp -s "$BUILD/eml_s1.macho" "$BUILD/eml_s2.macho" || rc=1
if [[ $rc -eq 0 ]]; then printf '%sOK%s\n' "$GREEN" "$RESET"
else printf '%sFAIL%s\n' "$RED" "$RESET"; fails=$((fails+1)); fi

if [[ $fails -eq 0 ]]; then
    printf '\n%s%sVERIFY-MACHO-LINUX OK%s\n' "$GREEN" "$BOLD" "$RESET"
    exit 0
fi
printf '\n%s%sVERIFY-MACHO-LINUX: %d fallo(s)%s\n' "$RED" "$BOLD" "$fails" "$RESET"
exit 1
