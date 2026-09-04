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
