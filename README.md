# tetsuo

Compilador de un lenguaje de sistemas minimalista ("tetsuo") **totalmente
autohospedado**: escrito y compilado por sí mismo. Emite ensamblador AArch64
para dos targets:

- **virt** — bare metal sobre QEMU `-M virt` (Cortex-A72), E/S por UART PL011.
- **macos** — ejecutable de usuario en macOS arm64, E/S por `syscall`.

## Estructura del repo

```
src/            compilador stage1 en tetsuo puro
  lexer.tt        tokenizador
  parser.tt       parser descendente recursivo + AST + tipos
  ir.tt           lowering a IR lineal + regalloc lineal
  codegen.tt      emisión AArch64 (macos)
  main.tt         CLI argv-driven (input.tt -o output.s)
  runtime/
    io.tt         envoltorios de syscalls (target macos)
lib/            runtime en tetsuo: str.tt, fmt.tt, vec.tt, ast.tt
tests/          fuentes .tt de prueba + scripts de build por target
bootstrap/
  tetsuoc.s       golden seed asm: salida de stage1 sobre sí mismo (18432L).
                  Bootstraps el compilador sin dependencia de código externo.
  verify.sh       batería de smoke tests + fixpoint bit-a-bit
  linux/          harness qemu-aarch64 para verificar el fixpoint en Linux
test.sh         pipeline virt: compila, ensambla, enlaza y arranca en QEMU
LENGUAJE.md     referencia del lenguaje y guía de uso correcto
idioms.md       patrones idiomáticos observados en el código real
SELFHOST-STATE.md  bitácora del avance del autohospedaje
```

## Bootstrap

El único artefacto externo que necesitas es `clang` (o cualquier `as`+`ld`
capaz de ensamblar y enlazar AArch64 Mach-O). El compilador arranca desde la
seed committeada en `bootstrap/tetsuoc.s`:

```bash
clang -c bootstrap/tetsuoc.s -o build/main.o
clang -e _tt_start -o build/main build/main.o
```

`build/main` es un compilador stage1 completo. Los scripts de `tests/` lo hacen
solos si no existe.

## Uso del compilador

```bash
build/main fuente.tt -o salida.s
```

Target hardcodeado a macOS por ahora. Enlace de la salida:

```bash
clang -c salida.s -o salida.o
clang -e _tt_start -o salida salida.o
./salida
```

## Ejecutar programas

### Target macos (arm64)

```bash
bash tests/macos_build.sh tests/macos_hello.tt [args...]
```

Concatena el runtime (`src/runtime/io.tt`, `lib/*.tt`, `src/lexer.tt`,
`src/parser.tt`, `src/ir.tt`, `src/codegen.tt`) delante del fuente, invoca
`build/main` para producir `.s`, ensambla y enlaza con `clang -e _tt_start`.
El resultado se comprueba por su exit code.

### Target virt (bare metal, QEMU)

Requiere `qemu-system-aarch64` y una toolchain cruzada `aarch64-elf-*`. Nota:
`main.tt` actualmente hardcodea `TGT_MACOS`, así que la ruta virt está
pausada hasta que soporte `--target=virt`.

### Batería de verificación

```bash
bash bootstrap/verify.sh
```

Ejecuta todos los smoke tests + el fixpoint bit-a-bit `s0==s1==s2` sobre el
combined del propio compilador. Solo en macOS arm64: los binarios generados
son Mach-O AArch64.

Para verificar en Linux x86_64 sin macOS:

```bash
bash bootstrap/linux/verify_linux.sh
```

Usa `qemu-user` + un shim BSD→Linux para ejecutar los Mach-O emitidos.

## Sin módulos: concatenación

tetsuo no tiene sistema de módulos. Una "biblioteca" es un fichero `.tt` y la
"importación" es concatenar ficheros en orden antes de compilar. Las
referencias hacia atrás (recursión mutua) solo son válidas **dentro** de un
mismo fichero; entre ficheros el orden de concatenación debe respetar las
dependencias. Ver `LENGUAJE.md` y `idioms.md`.

## Estado

Autohospedado 100%. `stage1(stage1) == seed` bit-a-bit. La bitácora
detallada, con los tests que cubren cada hito, está en `SELFHOST-STATE.md`.
