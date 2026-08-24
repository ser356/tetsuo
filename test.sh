#!/usr/bin/env bash
#
# Pipeline completa: compilador -> ASM -> objeto -> ELF -> QEMU
#
#   ./test.sh                    compila y arranca tests/hello.tt
#   ./test.sh tests/otro.tt      compila y arranca otro fuente
#   ./test.sh -d                 arranca congelado, esperando a GDB en :1234
#   ./test.sh -a                 solo genera el ASM y lo muestra, sin arrancar
#
# Salir de QEMU: Ctrl-A, luego X
#
set -euo pipefail

# ---------------------------------------------------------------- configuración
CC=${CC:-clang}                       # compilador del host, para construir mycc
XPREFIX=${XPREFIX:-aarch64-elf-}      # toolchain cruzada: as, ld, gdb
QEMU=${QEMU:-qemu-system-aarch64}
MACHINE=virt
CPU=cortex-a72
LOAD_ADDR=0x40000000                  # donde -kernel deposita la imagen en -M virt

SRC_DIR=src
BUILD=build
COMPILER=$BUILD/tetsuoc
LINKER_SCRIPT=$BUILD/link.ld

INPUT=tests/hello.tt
MODE=run

# ---------------------------------------------------------------------- opciones
while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--debug) MODE=debug; shift ;;
    -a|--asm)   MODE=asm;   shift ;;
    -h|--help)  sed -n '2,12p' "$0"; exit 0 ;;
    *)          INPUT="$1"; shift ;;
  esac
done

step() { printf '\033[1;34m==>\033[0m %s\n' "$1"; }
die()  { printf '\033[1;31mERROR:\033[0m %s\n' "$1" >&2; exit 1; }

# ------------------------------------------------------------ comprobación previa
for tool in "$CC" "${XPREFIX}as" "${XPREFIX}ld" "$QEMU"; do
  command -v "$tool" >/dev/null || die "no encontrado: $tool"
done
[[ -f $INPUT ]] || die "no existe el fuente: $INPUT"

mkdir -p "$BUILD"
BASE=$BUILD/$(basename "${INPUT%.*}")

# ------------------------------------------------------------------ linker script
# Se regenera solo si no existe, para poder editarlo a mano sin que lo pise.
if [[ ! -f $LINKER_SCRIPT ]]; then
  step "generando $LINKER_SCRIPT"
  cat > "$LINKER_SCRIPT" <<EOF
ENTRY(_start)
SECTIONS
{
  . = $LOAD_ADDR;
  .text   : { *(.text.boot) *(.text*) }
  . = ALIGN(8);
  .rodata : { *(.rodata*) }
  . = ALIGN(16);
  . += 0x10000;
  __stack_top = .;
}
EOF
fi

# ------------------------------------------------------------- 1. build compilador
step "construyendo el compilador"
$CC -std=c11 -O0 -g -Wall -Wextra -Wswitch -Werror \
    -fsanitize=address,undefined \
    -o "$COMPILER" "$SRC_DIR"/*.c

# --------------------------------------------------------------- 2. mycc: .lang -> .s
step "compilando $INPUT"
UART_LIB=tests/uart.tt
if [[ -f $UART_LIB && $INPUT != $UART_LIB ]]; then
  COMBINED=$BUILD/combined.tt
  cat "$UART_LIB" "$INPUT" > "$COMBINED"
  "$COMPILER" "$COMBINED" -o "$BASE.s"
else
  "$COMPILER" "$INPUT" -o "$BASE.s"
fi

if [[ $MODE == asm ]]; then
  step "ASM generado"
  cat "$BASE.s"
  exit 0
fi

# ---------------------------------------------------------------- 3. as: .s -> .o
step "ensamblando"
"${XPREFIX}as" -march=armv8-a -g -o "$BASE.o" "$BASE.s"

# --------------------------------------------------------------- 4. ld: .o -> .elf
step "enlazando"
"${XPREFIX}ld" -T "$LINKER_SCRIPT" -nostdlib -o "$BASE.elf" "$BASE.o"

# Vuelco de secciones y desensamblado: la primera parada cuando algo no arranca.
"${XPREFIX}objdump" -d "$BASE.elf" > "$BASE.dis"
"${XPREFIX}size"    "$BASE.elf"

# -------------------------------------------------------------------- 5. QEMU
QEMU_ARGS=(-M "$MACHINE" -cpu "$CPU" -display none -serial stdio -kernel "$BASE.elf")
QEMU_TIMEOUT=${QEMU_TIMEOUT:-2}

if [[ $MODE == debug ]]; then
  step "QEMU congelado en :1234 — conecta con:"
  printf '    %sgdb %s -ex "target remote :1234"\n\n' "$XPREFIX" "$BASE.elf"
  exec "$QEMU" "${QEMU_ARGS[@]}" -S -s
fi

step "arrancando (timeout ${QEMU_TIMEOUT}s; QEMU_TIMEOUT=... para cambiar)"
rc=0
perl -e 'alarm shift @ARGV; exec @ARGV' "$QEMU_TIMEOUT" "$QEMU" "${QEMU_ARGS[@]}" || rc=$?
echo
[[ $rc -eq 0 || $rc -eq 142 ]] && exit 0
exit $rc