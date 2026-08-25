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

(workaround) Sin módulos, la "importación" es concatenación:
`cat io.tt main.tt` en el script de build. El prefijo `io_`/`arena_`
en los nombres es la convención que sustituye al espacio de nombres.

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
está prohibida: `io.tt`, `str.tt`, `fmt.tt`, `vec.tt`, `lexer.tt`,
`parser.tt`, `ir.tt`, `codegen.tt`, `main.tt` se concatenan en ese
orden y toda referencia hacia atrás debe cerrarse dentro del mismo
fichero.
