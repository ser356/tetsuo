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
  codegen.tt      emisión AArch64 textual (.s, target macos)
  macho.tt        writer Mach-O binario (en curso, ver docs/MACHO-PLAN.md)
  main.tt         CLI argv-driven: preprocessor `import` + parse + lower + codegen
  runtime/
    io.tt         envoltorios de syscalls (target macos)
lib/            runtime en tetsuo: str.tt, fmt.tt, vec.tt, ast.tt
tests/          fuentes .tt de prueba + scripts de build por target
bootstrap/
  tetsuoc.s       golden seed asm: salida de stage1 sobre sí mismo (~20 kL).
                  Bootstraps el compilador sin dependencia de código externo.
  verify.sh       batería de smoke tests + fixpoint bit-a-bit
  linux/          harness qemu-aarch64 para verificar el fixpoint en Linux
test.sh         pipeline virt: compila, ensambla, enlaza y arranca en QEMU
docs/MACHO-PLAN.md  plan del writer Mach-O + firma ad-hoc (hitos 24.a → 24.f)
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
build/main fuente.tt -o salida.s               # compila a asm
build/main --dump-tokens fuente.tt             # imprime tokens
build/main --dump-ir     fuente.tt             # imprime IR lineal
```

El driver ejecuta primero el preprocessor `import` sobre el fuente (una línea
`import 'ruta/relativa.tt'` inlinea recursivamente el fichero citado; los
paths ya vistos se saltan → sin ciclos ni duplicados). Después parsea, lowera
y emite AArch64 Mach-O textual. Target hardcodeado a macOS.

Enlace de la salida:

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

## Módulos: `import` como preprocessor

tetsuo no tiene sistema de módulos separado. Una "biblioteca" es un fichero
`.tt` y la "importación" es una directiva de línea del preprocessor integrado
en el driver:

```
import 'lib/str.tt'
import 'lib/fmt.tt'

fun main() -> u64 { ... }
```

Reglas:

- La directiva ocupa una línea entera y va **antes** de cualquier declaración.
- La ruta es relativa al cwd desde el que se invoca `build/main`.
- El expansor deduplica por path: importar dos veces el mismo fichero es
  no-op, y los ciclos se resuelven trivialmente.
- Las referencias hacia atrás (recursión mutua) siguen siendo válidas solo
  **dentro** de un mismo fichero; entre importados el orden debe respetar las
  dependencias tal como si los concatenases a mano.

Detalles y patrones idiomáticos en `LENGUAJE.md` e `idioms.md`.

## Estado

Autohospedado 100%. `stage1(stage1) == seed` bit-a-bit sobre el combined del
propio compilador. Siguiente frente: emisión Mach-O binaria + firma ad-hoc
embebida sin `clang`/`as`/`ld`/`codesign` (ver `docs/MACHO-PLAN.md`). La
bitácora detallada, con los tests que cubren cada hito, está en
`SELFHOST-STATE.md`.
