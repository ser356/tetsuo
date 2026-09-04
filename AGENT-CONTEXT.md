# Tetsuo agent context pack

Version: `2026.09.05`

Canonical lexical tokens to competence: **8779**  
UTF-8 bytes: **31310**  
Estimated model tokens (`ceil(bytes/4)`): **7828**

## Source integrity

- `LENGUAJE.md`: `31a69b1ac93e0fa289c7bed44cf320e48fc6b1020af8327e1d59166e1f8edfe1`
- `idioms.md`: `00bd0243987fdb01d928106321d6433d0f59e34565baa13eb9157b893ab27573`
- `docs/agent/COOKBOOK.md`: `b4a16c48ba48888a6bf8876459c66613f1ced7ea8aa368659fc11e3b61d86ee9`
- `docs/agent/ERRORS.md`: `d531fb14208aa15961a3326280fa5850c6f2b3015a6a31df75ed036e7cc9f73c`
- `docs/agent/METRICS.md`: `4105c90b2bab693c3de36520daa8d5352b8ecc64c01a00ef90a3e1830aa6e2d0`

---

<!-- source: LENGUAJE.md -->

# tetsuo — referencia del lenguaje y uso correcto

Describe el lenguaje **tal como lo acepta el compilador actual** (stage0,
`src/*.c`). Donde hay margen para escribir código que compila pero se comporta
mal, se marca con **⚠**. Para patrones idiomáticos ver `idioms.md`.

## Léxico

- Comentarios: `// hasta fin de línea`. No hay comentarios de bloque.
- Identificadores: `[A-Za-z_][A-Za-z0-9_]*`.
- Enteros: decimal (`42`) o hexadecimal (`0x40100000`). Sin literales con signo:
  `-1` no existe como literal (el `-` es siempre operador binario).
- Cadenas: comillas **simples** `'hola\n'`. Escapes: `\n \t \\ \' \0 \xNN`.
- Palabras reservadas: `fun let const return if else loop while break struct
  bss nil sizeof continue as`.
- `;` es opcional y se ignora como separador.

## Tipos

| tipo    | ancho | descripción                                   |
|---------|-------|-----------------------------------------------|
| `u8`    | 1     | byte sin signo                                |
| `u32`   | 4     | entero sin signo de 32 bits                   |
| `u64`   | 8     | entero sin signo de 64 bits                   |
| `i8`    | 1     | entero con signo de 8 bits                    |
| `i32`   | 4     | entero con signo de 32 bits                   |
| `i64`   | 8     | entero con signo de 64 bits                   |
| `bool`  | 1     | booleano almacenado como 0/1                  |
| `*T`    | 8     | puntero a `T` (anidable: `**Expr`)            |
| `str`   | 16    | par (puntero, longitud); dos slots de 8       |
| structs | 8·n   | declarados con `struct`; cada campo ocupa 8   |

- Los tipos con signo usan división y comparaciones signed. La negación unaria
  y los casts postfix `expr as T` normalizan `i8/i32/u8/u32`.
- `[N]T` declara arrays locales fijos. Actualmente exige elementos de 8 bytes.
- Las comparaciones devuelven `u32` 0/1.
- El ancho de un literal entero lo decide el contexto (`let`/parámetro que lo
  recibe).

## Declaraciones de nivel superior

Un programa es una secuencia de `const`, `bss`, `struct` y `fun` en cualquier
orden **dentro del mismo fichero** (los nombres se resuelven tras reconocer el
fichero completo, así que la recursión mutua entre funciones es válida).

### const

```
const K: u64 = 3
const UART_DR: *u8 = 0x09000000
```

Solo admite literal entero como valor. Un `const` de tipo puntero es el idiom
para registros MMIO. En expresión, el nombre se sustituye por su valor.

### bss

```
bss IO_BUF: 65536
```

Reserva un buffer de N bytes a cero. En expresión, el nombre vale `*u8` al
primer byte del buffer. Es la base de las arenas (ver `idioms.md`).

### struct

```
struct Node {
    kind: u32,
    lhs:  *Node,
    rhs:  *Node,
}
```

- Comas opcionales entre campos.
- El nombre queda registrado antes de leer los campos → tipos recursivos vía
  puntero.
- **Layout: todos los campos ocupan 8 bytes**, sea cual sea su tipo declarado.
  `sizeof(Node)` = número de campos × 8. Usa `sizeof(T)` en vez de contar a
  mano.

### fun

```
fun putc(c: u8) { ... }             // sin valor de retorno
fun add(a: u64, b: u64) -> u64 { return a + b }
```

- Máximo 8 parámetros efectivos (un parámetro `str` cuenta como 2).
- ⚠ El tipo de retorno declarado decide el ancho del `return`; una llamada en
- El tipo de retorno declarado decide el ancho del `return` y se propaga a las
  llamadas, incluidas llamadas adelantadas y recursivas. `syscall` devuelve
  `u64`.

## Sentencias

```
let x: u64 = 0          // anotación de tipo SIEMPRE obligatoria; init opcional
x = x + 1               // asignación a local
@p = v                  // almacenamiento a través de puntero
if cond { } else if c2 { } else { }
while cond { }
loop { ... break ... }
return                  // o return expr
expr                    // llamada como sentencia
```

- `let` sin inicializador puede asignarse después; leerlo antes falla al compilar.
- Tomar `&x` marca `x` inicializado para permitir out-params; no se comprueba que el callee escriba.
- `continue` salta a la siguiente iteración del bucle más interno.
- `break` solo sale del bucle más interno (`loop` o `while`).

### Shadowing de `let`

Cada `let` crea un slot nuevo y **cada uso resuelve a la declaración más
reciente que lo precede en el texto de la función**. Esto hace válido el
patrón de un `let e` por rama:

```
if k == TK_NUM  { let e: *Expr = mk_expr(ar, EX_INT); e.ival = t.ival; return e }
if k == TK_IDENT { let e: *Expr = mk_expr(ar, EX_VAR); e.var_start = s; return e }
```

Los bloques crean ámbitos léxicos. Un nombre interno tapa al externo dentro del
bloque y deja de ser visible al salir.

(Histórico: hasta el fix de `lookup_local`, los usos resolvían a la *primera*
declaración del nombre — un `let e` en la rama IDENT escribía su propio slot
pero `e.campo` leía el slot de la rama NUM, sin inicializar. Era la causa del
segfault del parser stage1 con `return IDENT`.)

## Expresiones

Precedencias, de mayor a menor:

| nivel | operadores                       |
|-------|----------------------------------|
| unario| `@expr` (deref), `&var` (dirección), `!expr`, `-expr` |
| postfijo | `f(args)`, `.campo`, `[i]`, `as T` |
| 6     | `*` `/` `%`                      |
| 5     | `+` `-`                          |
| 4     | `&` (AND bit a bit)              |
| 3     | `^`                              |
| 2     | `\|`                             |
| 3     | `==` `!=` `<` `<=` `>` `>=`      |
| 2     | `&&`                             |
| 1     | `\|\|`                           |

- `(expr)` agrupa.
- `nil` es azúcar para el literal `0` (puntero nulo). Compara solo con
  `==`/`!=`.
- `sizeof(T)` se resuelve en tiempo de compilación (`u64`).
- `&` solo sobre variable local; `@` solo sobre expresión de tipo puntero.
- `p[i]` sobre `p: *T` escala por `sizeof(T)` y desreferencia: equivale a
  `@(p + i*sizeof(T))`. Como lvalue: `p[i] = v`.
- `[N]T` declara un array local fijo. El MVP admite elementos de 8 bytes,
  indexación y escritura por índice; no admite copia ni inicializador agregado.
- `.campo`:
  - sobre `s: str` → `.ptr` (`*u8`) y `.len` (`u64`), **solo sobre locales**;
  - sobre struct local → acceso directo al slot;
  - sobre `p: *Struct` → carga/almacena en `p + 8*índice_de_campo`.
- Literal de cadena: **solo** como inicializador de `let s: str = '...'`.
  ⚠ Sin terminador nulo implícito; para syscalls añade `\0` a mano.

## Intrínsecos

- `syscall(n, a, b, c)` — única puerta al sistema. En macOS emite el trap BSD;
  con `--target=linux` llama al shim ELF. Envuélvelo
  en funciones con nombre (`io_write`, `io_exit`, …). ⚠ **Nunca** en código
  para `--target=virt`: compila pero `svc` sin handler cuelga la máquina.
- `@` sobre un `const` puntero es el acceso MMIO (target virt). Hoy compila a
  ldr/str simples; es "volátil" solo porque no hay optimizador.

## Biblioteca primitiva

Tetsuo no enlaza libc y no tiene cabeceras `stdio.h` o `stdlib.h`. Su biblioteca
actual son módulos `.tt` importables:

- `src/runtime/io.tt`: syscalls de archivos y proceso básico; también `Arena`,
  `arena_init` y `arena_take`. La arena es bump-only: no existe `free`.
- `lib/arena.tt`: `Arena`, `arena_init` y `arena_take` sin almacenamiento global.
- `lib/str.tt`: `bytes_eq` y `mem_copy`; `str` sigue siendo solo `(ptr, len)`.
- `lib/string.tt`: igualdad, prefijo, búsqueda de byte y decodificación UTF-8
  estricta con `str_next_codepoint`.
- `lib/parse.tt`: `parse_u64` y `parse_i64`, con rechazo de vacío, caracteres
  inválidos y overflow. Devuelven 1 en éxito y 0 en error.
- `lib/fmt.tt`: salida bufferizada `Out`, bytes, decimal `u64`, hexadecimal de
  cuatro dígitos y errores fatales.
- `lib/stdio.tt`: stdout/stderr mediante `print`, `println`, `print_u64` y
  variantes `e*`. Exige `stdio_init` y vaciado explícito.
- `lib/vec.tt`: vector de elementos opacos sobre arena, sin bounds checking.
- `lib/ast.tt`: arena especializada usada por el compilador, no API general.

`lib/std.tt` importa en orden runtime, bytes, strings, parseo, formato, stdio y
vector. Es la entrada recomendada para CLI; `ast.tt` queda fuera por ser interna.
`lib/freestanding.tt` importa solo arena, bytes, strings, parseo y vector. No
declara `bss`; el llamante debe aportar un scratch distinto por llamada.

`lib/release_name.tt` expone `tt_release_parse_v1` para FFI. Recibe bytes,
scratch del llamante y un `TTParsedRelease` de ocho campos `u64`; no usa `bss`.

Equivalencias prácticas:

| necesidad | API tetsuo |
|---|---|
| reservar memoria | `arena_take` |
| comparar/copiar bytes | `bytes_eq`, `mem_copy` |
| comparar/buscar strings | `string_eq`, `string_has_prefix`, `string_find_byte` |
| convertir enteros | `parse_u64`, `parse_i64` |
| abrir/leer/escribir/cerrar | `io_open_*`, `io_read`, `io_write`, `io_close` |
| stdout/stderr | `stdio_init`, `print*`, `eprint*`, `flush`, `eflush` |
| vector dinámico | `Vec` + `vec_*` |
| terminar proceso | `io_exit` |

Faltan `printf`, `malloc/free`, streams `FILE`, sort, red, procesos hijo,
entorno y reloj. La API de syscall devuelve valores crudos y aún no expone
`errno` de forma tipada.

## Modelo de compilación

- **Preprocessor `import`**: el driver (`src/main.tt`) reconoce líneas
  `import 'ruta/relativa.tt'` **antes** del lexer y las sustituye por el
  contenido del fichero citado. Se aplica de forma recursiva: los `import`
  del importado también se expanden. Reglas:
  - la directiva ocupa **una línea entera** y va antes de cualquier
    declaración top-level;
  - la ruta es relativa al cwd desde el que se lanza `build/main`;
  - hay **dedup por path**: el segundo `import` del mismo fichero es no-op
    → los ciclos y las importaciones diamante son inofensivos;
  - `import` **no es** palabra reservada del lenguaje: es un token de línea
    que el preprocessor consume antes de que llegue al lexer.
- Orden canónico del stage1 (equivalente al que produce el `pp_expand` del
  driver sobre `src/main.tt`):
  `io.tt → str.tt → fmt.tt → vec.tt → ast.tt → lexer.tt → parser.tt →
   ir.tt → codegen.tt → main`.
- Dentro de un fichero el orden de las funciones es libre (recursión mutua
  válida). ⚠ Entre ficheros importados no: toda referencia debe apuntar a un
  fichero ya expandido en el flujo del preprocessor.
- Convenciones: constantes en MAYÚSCULAS; funciones y campos en snake_case;
  prefijo de "módulo" manual en los nombres (`io_`, `arena_`, `lex_`).
- Máximo 32 rutas importadas. Los símbolos son globales; no hay namespaces,
  visibilidad pública/privada ni build incremental.

## Errores del compilador

Códigos públicos: `0` éxito, `2` argumentos o sintaxis, `3` entrada vacía o
no legible, `4` salida no abrible y `70` arena agotada/desbordada. Los códigos
`90` en adelante quedan reservados para scripts y harnesses.

El parser acumula hasta 20 errores, recuperándose en límites de sentencia,
bloque o declaración superior. Tras expandir imports conserva ruta y línea
originales y muestra columna, token, fuente y cursor:
`ruta:línea:columna: error: mensaje`. Si existe algún error no ejecuta el
lowering y termina con código 2.

## Límites conocidos (resumen ⚠)

- `arena_take` comprueba capacidad y desbordamiento aritmético; agotar el arena
  termina con código 70.
- El análisis de inicialización es conservador y escalar; tomar `&array` permite
  inicialización posterior por índice.
- `[]` y `.` requieren que el tipo del receptor sea conocido; no hay
  inferencia.
- Arrays: solo locales `[N]T` con `sizeof(T) == 8`; sin copia por valor ni
  inicializadores agregados.
- Máximo 8 argumentos/parámetros; bucles anidados ≤ 16 (`break_stack`).

El runtime macOS ofrece archivos básicos, `getpid`, `mkdir`, `chdir` y
`unlink`. Red, procesos hijo, entorno y reloj aún no tienen API estable.

`--emit=obj` emite ensamblador macOS arm64 sin `_tt_start`, apto para producir
con `clang -c` un objeto enlazable desde C o Rust. Las funciones exportadas
usan la ABI AAPCS64 y deben llevar prefijo manual para evitar colisiones.

---

<!-- source: idioms.md -->

# tetsuo — idioms

Patrones idiomáticos observados en el código tetsuo real del repo
(`tests/uart.tt`, `tests/io.tt`, `tests/cat.tt`, `tests/hello.tt`,
`tests/macos_hello.tt`, `tests/lexer.tt`, `tests/parser.tt`,
`tests/expr.tt`), tal como los admite el compilador actual.
Documento vivo: es también la bitácora de fricción del hito 11 —
cada patrón marcado (workaround) es candidato a desaparecer cuando el
lenguaje crezca.

## MMIO

Registro mapeado: constante puntero tipada, en mayúsculas, una vez por
fichero. El ancho del acceso viaja en el tipo.

```
const UART_DR: *u8  = 0x09000000
const UART_FR: *u32 = 0x09000018
```

`@` lee y escribe a través del puntero:

```
return @UART_FR & 32     // lectura de 4 bytes
@UART_DR = c             // escritura de 1 byte
```

Nota de estado: la forma `reg UART_DR: u8 at 0x09000000` decidida en el
audit no está implementada; el idiom vigente es `const` con tipo
puntero. Nota de semántica: hoy `@` compila a ldr/str simples — es
"volátil" solo porque no existe optimizador. Cuando exista, la garantía
debe pasar a la IR (instrucción marcada), no perderse.

## Espera de periférico

Bucle de sondeo con la condición en una función con nombre — el nombre
documenta el bit:

```
fun uart_ready() -> u32 {
    return @UART_FR & 32
}

fun putc(c: u8) {
    while uart_ready() != 0 {}
    @UART_DR = c
}
```

Comparaciones existentes: `== != < <= > >=` (todas sin signo). Bucles
contados idiomáticos:

```
let i: u64 = 0
while i < s.len {
    putc(s.ptr[i])
    i = i + 1
}
```

Con signo aún no hay tipos `i32/i64`; todo cálculo va con `u*` y las
vueltas de bucle usan igualdad o ordenación exacta.

## Cadenas

`str` es puntero + longitud; los campos se leen con `.ptr` y `.len`.
Sin terminador nulo implícito.

```
let saludo: str = 'hola\n'
print(saludo)
```

(workaround) Las syscalls que esperan C-string necesitan el nulo a mano:

```
let ruta: str = 'tests/hello.tt\0'
let fd: u64 = io_open_read(ruta.ptr)
```

Restricciones vigentes: el literal de cadena solo puede aparecer como
inicializador de `let`; `.ptr`/`.len` solo sobre locales.

## Memoria dinámica

Arena como biblioteca, nunca como primitivo. El bloque base cambia por
target:

- **virt** (bare metal): dirección fija tras la imagen cargada.
  ```
  const HEAP_BASE: *u8 = 0x40100000
  ```
- **macos**: buffer estático declarado con `bss`. El compilador emite
  `.zerofill __DATA,__bss,_NAME,N,3` en macos y `.comm NAME,N,8` en
  virt.
  ```
  bss IO_BUF: 65536
  ```

Un nombre `bss` se resuelve en expresión como puntero al primer byte
del buffer (equivalente a `&io_buf[0]` en C). Uso típico:

```
let ar: Arena
arena_init(&ar, IO_BUF, 65536)
let buf: *u8 = arena_take(&ar, 4096)
```

Struct de arena y funciones inalteradas desde el primer diseño:

```
struct Arena { base: *u8, pos: u64, cap: u64 }

fun arena_init(a: *Arena, base: *u8, cap: u64) {
    a.base = base
    a.pos = 0
    a.cap = cap
}

fun arena_take(a: *Arena, n: u64) -> *u8 {
    let p: *u8 = a.base + a.pos
    a.pos = a.pos + n
    return p
}
```

Los structs se pasan siempre por puntero (`a: *Arena`, llamada con
`&ar`); el acceso `.campo` funciona sobre la local y sobre el puntero.

(workaround) `arena_take` no comprueba `cap` — sin manejo de errores
decidido aún, el desbordamiento de arena es silencioso.

## Buffers dinámicos

Código destinado a `--emit=obj` no declara `bss`. Recibe el bloque del llamante,
construye `Arena` como local y pasa `&ar`. Un scratch por llamada permite uso
concurrente sin estado compartido; `lib/freestanding.tt` reúne este subconjunto.

Con arena, los buffers de tamaño runtime salen gratis y sustituyen al
truco del struct-de-u64:

```
let nl: NameList
nl.starts = arena_take(ar, cap * 8)
nl.lens   = arena_take(ar, cap * 8)
```

Escritura elemento-a-elemento con aritmética de puntero:

```
let slot: *u64 = nl.starts + i * 8
@slot = start
```

(workaround) `[N]T` sigue sin existir; el compilador escribe `@ptr` y
el programador cuenta el tamaño del elemento a mano.

## Control de flujo

- `if cond { ... } else if cond2 { ... } else { ... }` con `else if`
  sin llaves entre medias.
- `return` sin valor (para funciones sin `->` o para salida temprana).
- `while cond { ... }` y `loop { ... }` con `break`.

```
fun classify(c: u8) -> u32 {
    if c >= 48 {
        if c <= 57 { return 1 }
    } else if c == 32 { return 2 }
    return 0
}
```

(workaround) Sin `continue`; el patrón es un `if` que envuelve el
cuerpo del bucle.

## Structs recursivas

Los structs se registran con el nombre disponible antes de sus campos,
lo que permite tipos recursivos vía puntero:

```
struct Node {
    kind: u32,
    ival: u64,
    lhs:  *Node,
    rhs:  *Node,
}
```

Es el idiom para AST en tetsuo (usado en `tests/expr.tt`).

## Peek de tokens

El lexer no tiene lookahead nativo; el parser lo emula con un
"parser state" que guarda el último token leído por adelantado:

```
struct PState {
    lx:         *Lexer,
    has_peek:   u32,
    peek_kind:  u32,
    peek_start: u64,
    peek_tlen:  u64,
    peek_ival:  u64,
    peek_tline: u64,
}
```

(workaround) Copia campo-a-campo del `Tok` porque no existe `memcpy`
inline; disciplina hasta que aparezca `[N]T` o punteros a struct como
fuente de asignación por valor.

## Syscalls y E/S (target macos)

`syscall(n, a, b, c)` es el único intrínseco además de `@`. Se envuelve
inmediatamente en funciones con nombre, prefijadas por módulo manual:

```
fun io_write(fd: u64, buf: *u8, len: u64) { syscall(4, fd, buf, len) }
fun io_exit(code: u64) { syscall(1, code, 0, 0) }
```

La "importación" es una directiva de línea del preprocessor integrado
en el driver: `import 'ruta/relativa.tt'` una por línea al principio
del fichero. El preprocessor expande recursivamente y deduplica por
path, así que importar dos veces el mismo fichero (o cerrar un ciclo)
es inofensivo. Ejemplo tipo:

```
import 'src/runtime/io.tt'
import 'lib/str.tt'

fun main() -> u64 { ... }
```

El prefijo `io_`/`arena_`/`lex_` en los nombres sigue siendo la
convención que sustituye al espacio de nombres — no hay scoping por
fichero.

Regla dura: nada de `syscall` en código destinado a `--target=virt` —
compila igual pero `svc #0x80` sin handler cuelga la máquina.

## Convenciones generales

- Constantes en MAYÚSCULAS, funciones y campos en snake_case.
- Anotación de tipo en `let` siempre (obligatoria hoy; la inferencia
  decidida en el audit no está implementada).
- Literales enteros: ancho decidido por el contexto del `let`/parámetro
  que los recibe; sin casts (ni `as` ni `u8(x)` existen aún).
- `loop {}` como cuelgue final de `main` en bare metal.
- Un fichero = una "biblioteca" (uart.tt, io.tt); el usuario concatena.
- `fun` sin `->` cuando no devuelve valor; `main() -> u32` en macos
  (el runner comprueba el exit code), `main()` a secas en virt.

## Convenciones para el autohospedaje (stage1)

Los patrones de esta sección no son opinión: son la única forma que
tiene stage1 de reproducir el comportamiento de stage0 sin tipos con
signo, sin `sizeof` y sin resolución adelantada explícita.

### Puntero nulo = literal `0` (y `nil` como azúcar)

Verificado en `tests/nil.tt` y `tests/nil2.tt`: `let p: *T = 0` y `p == 0`
compilan y se comportan como esperamos. La palabra reservada `nil` existe ya
y es azúcar exacta del literal `0` — usa `nil` en contexto de puntero y `0`
en contexto numérico. La comparación es siempre por igualdad:

```
if p == nil { return }      // ok
if p != nil { ... }         // ok
if p < 0 { ... }            // PROHIBIDO — todas las comparaciones son
                            // sin signo, esto siempre es falso
```

### Un `let` por rama: shadowing a la declaración más reciente

Sin ámbito de bloque, el patrón del parser stage1 es declarar la misma local
en cada rama excluyente:

```
if k == TK_NUM {
    let e: *Expr = mk_expr(ar, EX_INT)
    e.ival = t.ival
    return e
}
if k == TK_IDENT {
    let e: *Expr = mk_expr(ar, EX_VAR)
    e.var_start = name_start
    return e
}
```

Cada `let` crea un slot propio y cada uso resuelve a la declaración más
reciente que lo precede en el texto (`lookup_local` busca de atrás hacia
adelante). Regla de higiene: usa el patrón solo en ramas que terminan en
`return`/`break`; después de un bloque con `let x` interno, el nombre `x`
sigue haciendo sombra en el resto de la función y su slot puede estar sin
inicializar si la rama no se ejecutó.

(Histórico: hasta el fix del hito 15.7-8, `lookup_local` resolvía a la
*primera* declaración: el `let e` de una rama posterior escribía su slot
nuevo pero `e.campo` leía el slot de la primera rama, sin inicializar —
el segfault del parser stage1 con `return IDENT`.)

### Centinelas: índices base 1

stage0 (C) usa `-1` como "sin asignar" en `reg_of`, `last_use`,
`def_idx` y campos similares. Como tetsuo no tiene tipos con signo,
`-1` se convertiría en `0xFFFF…FFFF` y cualquier `<` invertiría el
sentido de las comparaciones. Solución mecánica al traducir:

| stage0 (C)             | stage1 (tetsuo)              |
| ---------------------- | ---------------------------- |
| `reg_of[s] = -1`       | `reg_of[s] = 0`              |
| `reg_of[s] = r`        | `reg_of[s] = r + 1`          |
| `if reg_of[s] >= 0`    | `if reg_of[s] != 0`          |
| `x_pool[reg_of[s]]`    | `x_pool[reg_of[s] - 1]`      |
| `last_use[s] = -1`     | `last_use[s] = 0`, índices   |
|                        | de instrucción base 1        |

Regla: cualquier tabla que en stage0 use `-1` como "vacío" pasa a
usar `0` en stage1, y los índices reales se desplazan en 1.

### Tamaños de struct: `sizeof(T)`

El compilador resuelve `sizeof(T)` en tiempo de parse a través de
`type_width`. Vale para primitivos, punteros y structs declarados:

```
let n:  u64 = sizeof(u64)     // 8
let sp: u64 = sizeof(*u8)     // 8
let sn: u64 = sizeof(N)       // 8 * numero de campos de N
```

Layout actual del backend: todos los campos ocupan hueco de 8 bytes,
así que `sizeof(N)` = `nfields(N) * 8`. Cuando el layout cambie, la
constante se recalcula sola sin tocar código de usuario.

### Un fichero = un conjunto mutuamente recursivo

Verificado en `tests/io.tt`: `arena_take` llama a `io_exit` definido
más abajo en el mismo fichero. `parse` completa el reconocimiento de
todo el fichero antes de resolver nombres, de modo que dentro de un
mismo `.tt` el orden de las funciones es libre.

Corolario práctico: el parser descendente recursivo del stage1 vive
en un único `parser.tt` porque `parse_expr` ↔ `parse_primary` es
mutuamente recursiva. La recursión **entre ficheros** distintos sí
está prohibida: `io.tt`, `str.tt`, `fmt.tt`, `vec.tt`, `ast.tt`,
`lexer.tt`, `parser.tt`, `ir.tt`, `codegen.tt`, `main.tt` se importan
en ese orden (vía `import` en el driver o expandidos por `pp_expand`
en `src/main.tt`) y toda referencia hacia atrás debe cerrarse dentro
del mismo fichero.

---

<!-- source: docs/agent/COOKBOOK.md -->

# Agent cookbook

Twenty copy-ready patterns. Canonical implementations live in `lib/` and executable examples in `tests/`.

## 1. Program entry

```tetsuo
fun main() -> u64 { return 0 }
```
Source: `tests/hello.tt`.

## 2. Print a line

```tetsuo
import 'lib/std.tt'
fun main() -> u64 { stdio_init(); println('hello'); flush(); return 0 }
```
Source: `tests/stdio_test.tt`.

## 3. Parse an unsigned integer

```tetsuo
let value: u64 = 0
if parse_u64(text, &value) == 0 { return 2 }
```
Source: `lib/parse.tt`.

## 4. Read a file

```tetsuo
let err: u64 = 0
let fd: u64 = io_open_read_checked(path, &err)
let n: u64 = io_read_checked(fd, buf, cap, &err)
io_close(fd)
```
Source: `src/runtime/io.tt`.

## 5. Write a file

```tetsuo
let err: u64 = 0
let fd: u64 = io_open_write_checked(path, &err)
io_write(fd, bytes, len)
io_close(fd)
```
Source: `tests/write_test.tt`.

## 6. Grow a vector

```tetsuo
let v: Vec
let first: *u8 = arena_take(ar, 8)
vec_init(&v, 8, first, 1)
vec_push(ar, &v, &value)
```
Source: `lib/vec.tt`.

## 7. Decode UTF-8

```tetsuo
let cp: u64 = 0
let width: u64 = str_next_codepoint(bytes, len, offset, &cp)
```
Source: `lib/string.tt`.

## 8. Loop with continue

```tetsuo
while i < n {
    i = i + 1
    if i == skip { continue }
}
```
Source: `tests/continue_test.tt`.

## 9. Infinite loop with break

```tetsuo
loop {
    if done != 0 { break }
}
```
Source: `tests/lower_while_test.tt`.

## 10. Fixed array

```tetsuo
let bytes: [16]u8
bytes[0] = 42
```
Source: `tests/array_width_test.tt`.

## 11. C-compatible struct

```tetsuo
struct Header { tag: u8, size: u32, data: *u8 }
```
Source: `tests/struct_c_abi.tt`.

## 12. Read a struct field

```tetsuo
fun size_of_header(p: *Header) -> u32 { return p.size }
```
Source: `tests/struct_mixed_runtime_test.tt`.

## 13. Pointer dereference

```tetsuo
let value: u64 = @ptr
@ptr = value + 1
```
Source: `tests/lower_mem_test.tt`.

## 14. Address of a local

```tetsuo
let value: u64 = 42
let ptr: *u64 = &value
```
Source: `tests/outparam_test.tt`.

## 15. Explicit cast

```tetsuo
let small: u8 = wide as u8
```
Source: `tests/cast_test.tt`.

## 16. Checked syscall

```tetsuo
let err: u64 = 0
let pid: u64 = syscall_checked(20, 0, 0, 0, &err)
```
Source: `tests/syscall_checked_test.tt`.

## 17. Function with many arguments

```tetsuo
fun sum9(a:u64,b:u64,c:u64,d:u64,e:u64,f:u64,g:u64,h:u64,i:u64) -> u64 {
    return a+b+c+d+e+f+g+h+i
}
```
Source: `tests/call_many_runtime_test.tt`.

## 18. BSS storage

```tetsuo
bss BUFFER: 4096
let bytes: *u8 = BUFFER
```
Source: `tests/codegen_bytes_bss_test.tt`.

## 19. String search

```tetsuo
let at: u64 = string_find(haystack, needle)
```
Source: `lib/string.tt`.

## 20. C ABI export

```tetsuo
fun tt_add(a: u64, b: u64) -> u64 { return a + b }
```
Source: `tests/obj_link_test.tt`.

---

<!-- source: docs/agent/ERRORS.md -->

# Stable diagnostic catalog

Codes are API. Messages can improve; code identity does not change. `--diagnostics=json` emits one JSON object per line.

| Code | Meaning | Fix | Language reference | Emitter |
|---|---|---|---|---|
| E0001 | Generic compilation error | — | [errors](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#errores-del-compilador) | [registry](https://github.com/ser356/tetsuo/blob/main/lib/fmt.tt#L261) |
| E0007 | Invalid primary expression | inspect token | [expressions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#expresiones) | [parser](https://github.com/ser356/tetsuo/blob/main/src/parser.tt#L744) |
| E0101 | Undeclared function | declare or rename call | [functions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L222) |
| E0102 | Incorrect call arity | match parameter count | [functions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L222) |
| E0103 | Incompatible argument type | cast or change type | [types](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#tipos) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L222) |
| E0104 | Incompatible return type | cast or change return | [functions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0105 | Return value required | add value | [functions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#fun) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0106 | Incompatible initializer type | cast or change type | [statements](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#sentencias) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0107 | Incompatible assignment type | cast or change target | [statements](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#sentencias) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0108 | Invalid assignment target | assign to lvalue | [statements](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#sentencias) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L340) |
| E0109 | Dereference requires pointer | use pointer | [expressions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#expresiones) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L285) |
| E0110 | Store requires pointer | use pointer | [statements](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#sentencias) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L309) |
| E0111 | Incompatible arithmetic operands | cast operands | [expressions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#expresiones) | [checker](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L263) |
| E0201 | Rust `fn` interference | `fun` | [functions](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#fun) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0202 | Rust `pub` interference | remove | [declarations](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#declaraciones-de-nivel-superior) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0203 | Rust `mut` interference | remove | [statements](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#sentencias) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0204 | C `int` interference | `u64` | [types](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#tipos) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0205 | C `printf` interference | `print` | [I/O](https://github.com/ser356/tetsuo/blob/main/idioms.md#syscalls-y-es-target-macos) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0206 | C `malloc` interference | `arena_take` | [memory](https://github.com/ser356/tetsuo/blob/main/idioms.md#memoria-dinámica) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0207 | C `#include` interference | `import 'path'` | [compilation](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#modelo-de-compilación) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |
| E0208 | C block comment interference | `//` | [lexicon](https://github.com/ser356/tetsuo/blob/main/LENGUAJE.md#léxico) | [scanner](https://github.com/ser356/tetsuo/blob/main/src/check.tt#L87) |

---

<!-- source: docs/agent/METRICS.md -->

# Context metrics

**Tokens to competence** means tokens an agent must ingest before receiving language specification, idioms, twenty executable recipes, and stable error catalog.

Canonical measurement is deterministic lexical tokens, counted as Unicode word runs or single non-whitespace punctuation characters with Python regex `\w+|[^\w\s]`. It is provider-independent and reproducible without network or packages. UTF-8 bytes and `ceil(bytes/4)` are also reported for rough model-window planning; the latter is explicitly an estimate, not a tokenizer claim.

Run `python3 tools/build_agent_context.py --metrics`.
