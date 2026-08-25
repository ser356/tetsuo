# tetsuo

Compilador de un lenguaje de sistemas minimalista ("tetsuo") escrito en C
(**stage0**), con el objetivo de autohospedarse: el propio compilador se está
reescribiendo en tetsuo (**stage1**). Genera ensamblador AArch64 para dos
targets:

- **virt** — bare metal sobre QEMU `-M virt` (Cortex-A72), E/S por UART PL011.
- **macos** — ejecutable de usuario en macOS arm64, E/S por `syscall`.

## Estructura del repo

```
src/            stage0: compilador en C
  lexer.c/h       tokenizador
  parser.c/h      parser descendente recursivo + AST + tipos
  ir.c/h          lowering a IR lineal + asignación de registros
  codegen.c/h     emisión AArch64 (virt/macos)
  main.c          CLI: targets y volcados (--dump-tokens/--dump-ast/--dump-ir)
  parser.tt       stage1: parser del compilador escrito en tetsuo
lib/            runtime stage1 en tetsuo: str.tt, fmt.tt, vec.tt, ast.tt
tests/          fuentes .tt de prueba + scripts de build por target
  lexer.tt        stage1: lexer en tetsuo
  io.tt           envoltorios de syscalls (target macos)
bootstrap/      verify.sh: batería de smoke tests del autohospedaje
test.sh         pipeline virt: compila, ensambla, enlaza y arranca en QEMU
LENGUAJE.md     referencia del lenguaje y guía de uso correcto
idioms.md       patrones idiomáticos observados en el código real
SELFHOST-STATE.md  bitácora del avance del autohospedaje
```

## Compilar el compilador

```bash
cc -std=c11 -O0 -g -Wall -Wextra -o build/tetsuoc src/*.c
```

(Los scripts lo hacen solos; `test.sh` añade `-fsanitize=address,undefined`.)

## Uso del compilador

```bash
build/tetsuoc [--target=virt|macos] fuente.tt -o salida.s
build/tetsuoc --dump-tokens fuente.tt   # volcado de tokens
build/tetsuoc --dump-ast    fuente.tt   # volcado del AST tipado
build/tetsuoc --dump-ir     fuente.tt   # volcado de IR + regalloc
```

Los volcados son la primera herramienta de depuración: `--dump-ast` muestra a
qué slot de local resuelve cada variable y `--dump-ir` enseña la asignación de
registros por slot.

## Ejecutar programas

### Target virt (bare metal, QEMU)

Requiere `qemu-system-aarch64` y una toolchain cruzada `aarch64-elf-*`:

```bash
./test.sh tests/hello.tt     # compila y arranca en QEMU
./test.sh -a tests/hello.tt  # solo muestra el ASM
./test.sh -d tests/hello.tt  # arranca congelado esperando a GDB en :1234
```

`test.sh` concatena `tests/uart.tt` delante del fuente automáticamente.

### Target macos (arm64)

```bash
bash tests/macos_build.sh tests/macos_hello.tt [args...]
```

Concatena el runtime (`tests/io.tt`, `lib/*.tt`, `tests/lexer.tt`,
`src/parser.tt`) delante del fuente, compila con `--target=macos`, ensambla y
enlaza con `clang -e _main`. El resultado se comprueba por su exit code.

### Batería de verificación

```bash
bash bootstrap/verify.sh
```

Ejecuta todos los smoke tests del autohospedaje (solo en macOS arm64: los
binarios generados son Mach-O AArch64).

## Sin módulos: concatenación

tetsuo no tiene sistema de módulos. Una "biblioteca" es un fichero `.tt` y la
"importación" es concatenar ficheros en orden antes de compilar. Las
referencias hacia atrás (recursión mutua) solo son válidas **dentro** de un
mismo fichero; entre ficheros el orden de concatenación debe respetar las
dependencias. Ver `LENGUAJE.md` y `idioms.md`.

## Estado

El autohospedaje va por el hito 15 (parser stage1 completo). La bitácora
detallada, con los tests que cubren cada hito, está en `SELFHOST-STATE.md`.
