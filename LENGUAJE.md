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
  bss nil sizeof`.
- `;` es opcional y se ignora como separador.

## Tipos

| tipo    | ancho | descripción                                   |
|---------|-------|-----------------------------------------------|
| `u8`    | 1     | byte sin signo                                |
| `u32`   | 4     | entero sin signo de 32 bits                   |
| `u64`   | 8     | entero sin signo de 64 bits                   |
| `*T`    | 8     | puntero a `T` (anidable: `**Expr`)            |
| `str`   | 16    | par (puntero, longitud); dos slots de 8       |
| structs | 8·n   | declarados con `struct`; cada campo ocupa 8   |

- **No hay tipos con signo**, ni booleanos (las comparaciones devuelven
  `u32` 0/1), ni arrays `[N]T`, ni casts (`as`, `u8(x)` no existen).
- Todas las comparaciones son **sin signo** (`lo/ls/hi/hs`). ⚠ `p < 0` es
  siempre falso; `x - 1` con `x == 0` da `0xFFFF…`, no −1. Para centinelas
  usa `0` e índices base 1 (ver `idioms.md`).
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
  expresión se tipa hoy como `u32` salvo `syscall` (`u64`). Si necesitas los
  64 bits de un retorno, pásalo por `let` con tipo explícito.

## Sentencias

```
let x: u64 = 0          // anotación de tipo SIEMPRE obligatoria; init opcional
x = x + 1               // asignación a local
@p = v                  // almacenamiento a través de puntero
if cond { } else if c2 { } else { }
while cond { }          // paréntesis opcionales en if/while
loop { ... break ... }
return                  // o return expr
expr                    // llamada como sentencia
```

- ⚠ `let` **sin** inicializador deja el slot con basura de pila: inicialízalo
  antes de leerlo. El compilador no lo detecta.
- No hay `continue`: envuelve el cuerpo del bucle en un `if`.
- `break` solo sale del bucle más interno (`loop` o `while`).

### Shadowing de `let`

Cada `let` crea un slot nuevo y **cada uso resuelve a la declaración más
reciente que lo precede en el texto de la función**. Esto hace válido el
patrón de un `let e` por rama:

```
if k == TK_NUM  { let e: *Expr = mk_expr(ar, EX_INT); e.ival = t.ival; return e }
if k == TK_IDENT { let e: *Expr = mk_expr(ar, EX_VAR); e.var_start = s; return e }
```

⚠ No hay ámbito de bloque: un `let` dentro de un `if` sigue haciendo sombra
al nombre en el resto de la función, aunque su rama no se haya ejecutado (y su
slot estará sin inicializar en ese caso). Tras un bloque con `let x` interno,
no reutilices `x` esperando ver la declaración externa.

(Histórico: hasta el fix de `lookup_local`, los usos resolvían a la *primera*
declaración del nombre — un `let e` en la rama IDENT escribía su propio slot
pero `e.campo` leía el slot de la rama NUM, sin inicializar. Era la causa del
segfault del parser stage1 con `return IDENT`.)

## Expresiones

Precedencias, de mayor a menor:

| nivel | operadores                       |
|-------|----------------------------------|
| unario| `@expr` (deref), `&var` (dirección) |
| postfijo | `f(args)`, `.campo`, `[i]`    |
| 6     | `*` `/`                          |
| 5     | `+` `-`                          |
| 4     | `&` (AND bit a bit)              |
| 3     | `^`                              |
| 2     | `\|`                             |
| 1     | `==` `!=` `<` `<=` `>` `>=`      |

- `(expr)` agrupa.
- `nil` es azúcar para el literal `0` (puntero nulo). Compara solo con
  `==`/`!=`.
- `sizeof(T)` se resuelve en tiempo de compilación (`u64`).
- `&` solo sobre variable local; `@` solo sobre expresión de tipo puntero.
- `p[i]` sobre `p: *T` escala por `sizeof(T)` y desreferencia: equivale a
  `@(p + i*sizeof(T))`. Como lvalue: `p[i] = v`.
- `.campo`:
  - sobre `s: str` → `.ptr` (`*u8`) y `.len` (`u64`), **solo sobre locales**;
  - sobre struct local → acceso directo al slot;
  - sobre `p: *Struct` → carga/almacena en `p + 8*índice_de_campo`.
- Literal de cadena: **solo** como inicializador de `let s: str = '...'`.
  ⚠ Sin terminador nulo implícito; para syscalls añade `\0` a mano.

## Intrínsecos

- `syscall(n, a, b, c)` — única puerta al sistema (target macos). Envuélvelo
  en funciones con nombre (`io_write`, `io_exit`, …). ⚠ **Nunca** en código
  para `--target=virt`: compila pero `svc` sin handler cuelga la máquina.
- `@` sobre un `const` puntero es el acceso MMIO (target virt). Hoy compila a
  ldr/str simples; es "volátil" solo porque no hay optimizador.

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

## Errores del compilador

El compilador para en el primer error con `parser: linea N: mensaje` (o
`lexer:`/`ir:`). Los mensajes de `ir:` marcan límites de hito (p. ej. "arg
'str' solo desde local"). Los binarios stage1 señalan errores de parseo con
`io_exit(80..91)`.

## Límites conocidos (resumen ⚠)

- Sin comprobación de desbordamiento de arena (`arena_take` no mira `cap`).
- Sin comprobación de uso de local sin inicializar.
- Llamadas tipadas `u32` en expresión (ver `fun` arriba).
- `[]` y `.` requieren que el tipo del receptor sea conocido; no hay
  inferencia.
- Máximo 8 argumentos/parámetros; bucles anidados ≤ 16 (`break_stack`).
