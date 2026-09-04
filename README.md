# tetsuo

## Agent context

Use [AGENT-CONTEXT.md](AGENT-CONTEXT.md) as the single versioned context pack.
It contains the language reference, idioms, twenty recipes, stable diagnostic
catalog, source hashes, and tokens-to-competence metric. Regenerate with
`python3 tools/build_agent_context.py` and verify with `--check`.

Compilador de un lenguaje de propósito general mínimo para CLI y sistemas,
**totalmente autohospedado**: escrito y compilado por sí mismo. Incluye enteros
signed/unsigned, casts, funciones, control estructurado, scopes léxicos,
punteros, structs, arrays locales, imports y archivos. Emite AArch64 para:

- **virt** — bare metal sobre QEMU `-M virt` (Cortex-A72), E/S por UART PL011.
- **macos** — ejecutable de usuario en macOS arm64, E/S por `syscall`.
- **linux** — ensamblador ELF AArch64 mediante `--target=linux` y shim syscall.

## Estructura del repo

```
src/            compilador stage1 en tetsuo puro
  lexer.tt        tokenizador
  parser.tt       parser descendente recursivo + AST + tipos
  ir.tt           lowering a IR lineal + regalloc lineal
  codegen.tt      emisión AArch64 textual (.s, target macos)
  macho.tt        writer Mach-O binario + firma ad-hoc embebida
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

El bootstrap nativo no necesita `gcc`, `clang`, `cc`, `as`, `ld`, `codesign`
ni bibliotecas dinámicas. Arranca desde la seed Mach-O arm64 firmada y
committeada en `bootstrap/tetsuoc.macho`. `tests/macos_build.sh` la copia a
`build/main` cuando el compilador no existe.

La seed compila fuentes tetsuo directamente a ejecutables Mach-O arm64 con
firma ad-hoc embebida. La ruta histórica desde `bootstrap/tetsuoc.s` sigue
disponible para verificar el backend textual, pero no forma parte del
bootstrap autónomo.

## Uso del compilador

```bash
build/main --emit=macho fuente.tt -o salida    # ejecutable Mach-O firmado
build/main --emit=obj fuente.tt -o modulo.s    # asm enlazable, sin entrypoint
build/main fuente.tt -o salida.s               # backend textual legado
build/main --dump-tokens fuente.tt             # imprime tokens
build/main --dump-ir     fuente.tt             # imprime IR lineal
```

El driver ejecuta primero el preprocessor `import` sobre el fuente (una línea
`import 'ruta/relativa.tt'` inlinea recursivamente el fichero citado; los
paths ya vistos se saltan → sin ciclos ni duplicados). Después parsea, lowera
y emite AArch64. macOS es el target predeterminado; Linux se selecciona con
`--target=linux`.

El modo `--emit=macho` no requiere pasos posteriores. El backend textual puede
ensamblarse externamente para depuración:

```bash
clang -c salida.s -o salida.o
clang -e _tt_start -o salida salida.o
./salida
```

`--emit=obj` conserva la ABI C de macOS arm64 y omite `_tt_start`. Convierte
su salida con `clang -c modulo.s -o modulo.o` y enlaza el objeto desde C o Rust.

## Ejecutar programas

### Target macos (arm64)

```bash
bash tests/macos_build.sh tests/macos_hello.tt [args...]
```

Genera un entry con imports del runtime y compilador, invoca `build/main
--emit=macho` y ejecuta el Mach-O firmado resultante. No invoca ensamblador,
linker ni firmador externo.

### Target virt (bare metal, QEMU)

Requiere `qemu-system-aarch64` y una toolchain cruzada `aarch64-elf-*`. Nota:
la CLI autónoma actual ofrece macOS y Linux; la ruta virt conserva su pipeline
separado en `test.sh`.

## Biblioteca primitiva

Existe una biblioteca pequeña escrita en tetsuo, sin enlaces contra
libc/libSystem. Para programas CLI basta el módulo paraguas:

```text
import 'lib/std.tt'
```

| módulo | equivalente aproximado | API actual |
|---|---|---|
| `src/runtime/io.tt` | `stdio` + parte de `stdlib` | `io_open_read`, `io_open_write`, `io_read`, `io_write`, `io_close`, `io_exit`, `io_getpid`, `io_unlink`, `io_chdir`, `io_mkdir`, `Arena`, `arena_init`, `arena_take` |
| `lib/arena.tt` | asignación freestanding | `Arena`, `arena_init`, `arena_take` sobre memoria del llamante |
| `lib/str.tt` | `string.h` mínimo | `bytes_eq`, `mem_copy` |
| `lib/string.tt` | operaciones de `str` | `string_eq`, `string_has_prefix`, `string_find_byte`, `str_next_codepoint` |
| `lib/parse.tt` | conversión numérica | `parse_u64`, `parse_i64` con validación y detección de overflow |
| `lib/fmt.tt` | formato/salida bufferizada | `Out`, `out_init`, `out_flush`, `out_byte`, `out_bytes`, `out_u64`, `out_hex4`, `die_line` |
| `lib/stdio.tt` | stdout/stderr | `stdio_init`, `print`, `println`, `print_u64`, variantes `e*`, `flush`, `eflush` |
| `lib/vec.tt` | contenedor dinámico | `Vec`, `vec_init`, `vec_push`, `vec_get` |
| `lib/ast.tt` | soporte interno | arena global del AST mediante `ast_init` |

`lib/freestanding.tt` importa arena, bytes, strings, parseo y vector sin añadir
`bss`. Está destinado a objetos enlazables; cada llamada aporta su scratch.

`stdio_init` debe ejecutarse antes de escribir y los buffers requieren `flush`
o `eflush`. `parse_u64`/`parse_i64` devuelven 1 en éxito y escriben por puntero;
devuelven 0 sin modificar la salida ante entrada inválida o overflow.

No existen aún `printf`, `malloc/free`, `fopen/FILE`, entrada tokenizada,
sockets, procesos, entorno ni reloj. `arena_take` sustituye a `malloc` para
cargas de vida única y libera todo al terminar el proceso.

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

Lenguaje de propósito general mínimo para programas CLI y de sistemas locales.
No pretende sustituir aún a un entorno productivo completo: faltan namespaces,
arrays/structs por valor, procesos hijo, red, entorno, reloj y build incremental.

Autohospedado 100%. La seed Mach-O produce un compilador idéntico a sí mismo y
el compilador producido vuelve a reproducir exactamente el mismo binario:
`seed == stage1 == stage2` bit a bit. La ruta `--emit=macho` incluye encoder
AArch64, layout Mach-O, fixups, SHA-256 y firma ad-hoc; no depende de toolchain
externo. Verificación nativa más reciente: 2026-09-03. La bitácora detallada
está en `SELFHOST-STATE.md`.
