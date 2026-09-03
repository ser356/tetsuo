# Guía de implementación: llevar tetsuo a partes del backend

Complemento operativo de `docs/BACKEND-READINESS.md`. Aquel dice *qué* es
portable y por qué; este dice *cómo* llegar, en qué orden y con qué criterio de
cierre por hito.

Objetivo concreto y acotado: **que `videodrome/src/torrents/release_name.rs`
compile en tetsuo y se enlace en el binario Rust**, con la implementación Rust
viva como referencia diferencial. No "tetsuo para el backend". Ese objetivo es
el que ordena las fases; todo lo que no lo sirve va al final.

---

## 0. La restricción que ordena todo: el ratchet del bootstrap

No hay stage0 en C. `find . -name '*.c'` no devuelve nada: **el compilador es
`bootstrap/tetsuoc.s`**, el ensamblador de una versión anterior de sí mismo, y
`bootstrap/tetsuoc.macho` su binario firmado. Todo `src/*.tt` se compila con esa
seed.

De ahí la regla que gobierna cualquier cambio de lenguaje:

> Una feature nueva **no puede usarse en el propio compilador** hasta que exista
> una seed committeada que la entienda.

Eso obliga a una cadencia de **dos commits** por feature que quieras dogfoodear:

| | Contenido | Estado del árbol al terminar |
|---|---|---|
| **Commit A** | Implementar la feature en `src/*.tt` escribiendo **solo en el lenguaje viejo**. Regenerar `bootstrap/tetsuoc.s`. Fixpoint verde. | La seed entiende la feature; el compilador aún no la usa. |
| **Commit B** | Ya puedes usar la feature dentro de `src/*.tt` y `lib/*.tt`. Regenerar seed otra vez. | Dogfooding cerrado. |

Mezclar A y B en un commit rompe el bootstrap: la seed vieja no puede compilar
el `src` nuevo y te quedas sin forma de generar la seed nueva. Si pasa, la
salida es `git checkout` de `src/` a la última seed buena y rehacer.

El commit `d973032` (hito 24.a, shifts) es un commit A de libro. Úsalo de
plantilla literal.

---

## 1. Anatomía de un cambio de lenguaje

Lo que tocó 24.a, actualizado: cuando se añadieron los shifts, `codegen_bytes.tt`
y `asm.tt` **no existían todavía** (llegaron en 24.b/24.e). Hoy hay **dos
backends** y cualquier operador nuevo tiene que aterrizar en los dos, o
`--emit=macho` diverge del camino textual en silencio.

| # | Fichero | Qué se toca |
|---|---|---|
| 1 | `src/lexer.tt` | `const TK_*` nuevo + reconocimiento en `lex_next` |
| 2 | `src/parser.tt` | `const OP_*` + precedencia en `bin_prec` + mapeo en `parse_expr` |
| 3 | `src/ir.tt` | solo si la operación no cabe en `IR_BINOP` |
| 4 | `src/codegen.tt` | mnemónico en `out_binop_mnemonic` (backend textual) |
| 5 | `src/asm.tt` + `src/codegen_bytes.tt` | encoder + caso en `cgb_alu` (backend de bytes) |
| 6 | `tests/*_test.tt` + `bootstrap/verify.sh` + `bootstrap/linux/verify_linux.sh` | smoke con rc distinto por caso de fallo |
| 7 | `bootstrap/tetsuoc.s` | seed regenerada |
| 8 | `LENGUAJE.md` | tabla de precedencias / operadores |

**Los tokens `TK_*` y `OP_*` son un contrato numérico.** Añade siempre al final
de la serie. Insertar en medio renumera todo lo posterior, y el hito 15.2b ya
documenta lo que cuesta arreglar esa desincronización.

---

## 2. Tres cosas que cambian el plan

### 2.1 El estado global es el problema real, no la sintaxis

`grep '^bss ' lib/ src/` devuelve ~48 MB de estado global mutable:

```
lib/ast.tt:24:        bss AST_BUF: 16777216
src/runtime/io.tt:40: bss IO_BUF: 16777216
src/main.tt:63:       bss PP_ARENA_BUF: 16777216
```

más el estado del lexer y el parser (`LX_STATE`, `TOK_CUR`, `CUR_FUNC`,
`STR_HEAD`…). Para un compilador de un disparo es correcto. Para código que se
enlaza dentro de videodrome tiene dos consecuencias graves:

- **No es reentrante.** `release_name::parse` se llama desde el pipeline de
  búsqueda en `torrents/mod.rs:637`, que corre bajo tokio con varios workers.
  Dos hilos entrando a la vez en una función tetsuo que use un arena global
  corrompen el arena. No es un riesgo teórico: es una corrupción de memoria.
- **48 MB de `__DATA,__bss`** en cada binario de videodrome que enlace el
  módulo.

**La solución no necesita ningún cambio de lenguaje.** El idiom reentrante ya
existe y está probado en `tests/cat.tt`, `tests/hello.tt` y `tests/expr_main.tt`:

```
let ar: Arena
arena_init(&ar, buf, buflen)
```

`Arena` como local por valor, `&ar` para pasarlo. El buffer lo aporta el
llamante. Aplicado al port:

```
fun tt_release_parse(scratch: *u8, scratch_len: u64,
                     name: *u8, name_len: u64,
                     out: *ParsedOut) -> u64 {
    let ar: Arena
    arena_init(&ar, scratch, scratch_len)
    ...
}
```

Rust reserva el scratch (un `Vec<u8>` o un buffer en stack), lo pasa, y la
llamada es pura y reentrante. Cero `bss`, cero estado compartido, cero mutex.

**Regla para todo código tetsuo destinado a enlazarse: prohibido `bss`.**

### 2.2 Ya existe un subconjunto reentrante de la stdlib

Cruzando el `grep` de `bss` con lo que necesita `release_name.rs`:

| Módulo | `bss` | ¿Enlazable? |
|---|---|---|
| `lib/str.tt` — `bytes_eq`, `mem_copy` | no | ✅ |
| `lib/string.tt` — `string_eq`, `string_has_prefix`, `string_find_byte` | no | ✅ |
| `lib/parse.tt` — `parse_u64`, `parse_i64` | no | ✅ |
| `lib/vec.tt` — `Vec` sobre arena pasada como argumento | no | ✅ |
| `lib/fmt.tt` | `DIGITS`, `ERR_*` | ❌ |
| `lib/stdio.tt` | `STDOUT_*`, `STDERR_*` | ❌ |
| `src/runtime/io.tt` | `IO_BUF` | ❌ parcialmente |

El subconjunto verde es **exactamente el que el port necesita**. No hay que
escribir stdlib nueva; hay que documentar el subconjunto y no salirse de él.
Acción concreta: añadir `lib/freestanding.tt` que importe solo esos cuatro
módulos, como contraparte de `lib/std.tt`.

### 2.3 El MVP es más pequeño de lo que parece

Repasando qué necesita de verdad `release_name.rs`:

| Feature | ¿La necesita el port? |
|---|---|
| `--emit=obj` | **Sí — bloqueante** |
| Disciplina freestanding (§2.1) | **Sí — bloqueante** |
| Decodificador UTF-8 | **Sí**, para no degradar `normalize_title` |
| Operador `%` | No |
| `&&` / `\|\|` / `!` | No — solo verbosidad |
| Tablas constantes de cadenas | No — hay workaround |
| Genéricos | No |
| Interfaz de allocator | No |

Y de los tres bloqueantes, **dos no tocan el compilador**: son disciplina de
librería. El único cambio real al compilador para llegar al objetivo es
`--emit=obj`, y son unas 15 líneas.

Esto reordena el trabajo por completo: el camino al objetivo es **corto**. Lo
largo es todo lo que viene después, y ese es opcional.

---

## 3. Fase 0 — `--emit=obj`

**Problema.** `codegen()` en `src/codegen.tt` llama incondicionalmente a
`emit_macos_start` para `TGT_MACOS`, que emite un `_tt_start` global con
`bl _main`. Al enlazar en Rust: `_main` indefinido, o colisión.

**Qué NO hacer.** Escribir un writer de Mach-O relocalizable (`MH_OBJECT` +
tabla de símbolos + entradas de relocación) en `macho.tt`. Es un hito entero y
no hace falta: el camino textual ya produce un `.s` que `clang -c` convierte en
`.o`. `--emit=obj` solo tiene que significar «el mismo `.s`, sin el stub de
entrada».

**Implementación.** Siguiendo el patrón de `set_target`/`get_target` que ya
existe en `codegen.tt`:

```
bss G_NO_ENTRY: 8

fun set_no_entry(v: u64) { let p: *u64 = G_NO_ENTRY  p[0] = v }
fun get_no_entry() -> u64 { let p: *u64 = G_NO_ENTRY  return p[0] }
```

y en `codegen()`:

```
if target == TGT_MACOS {
    if get_no_entry() == 0 { emit_macos_start(o) }
}
```

En `src/main.tt`, junto a `flag_macho` y `flag_linux`:

```
let flag_obj: str = '--emit=obj'
let is_obj: u64 = cstr_eq(a1, flag_obj.ptr, flag_obj.len)
```

y `set_no_entry(is_obj)` antes de llamar a `codegen`. Ojo: `main` lee los
argumentos **desde el final** (`argv[argc-3]` entrada, `argv[argc-1]` salida)
precisamente para que los flags del principio no desplacen posiciones — respeta
esa convención.

**Prefijo de símbolos.** Los símbolos de tetsuo son globales, sin namespaces, y
salen con `_` delante. Un `fun parse(...)` se convierte en `_parse` y colisiona
con cualquier `parse` de C en el binario final. Dos salidas:

- convención manual: nombrar todo `tt_release_*` en el fuente (cero código, y
  es lo que recomiendo para empezar);
- flag `--symbol-prefix=`: más limpio, pero toca `emit_sym` en los dos backends.

**Cierre del hito.** Un `.tt` sin `main` compila con `--emit=obj`, `clang -c` lo
convierte en `.o`, y un `main.c` de tres líneas lo llama y devuelve el valor
esperado. Añadir como `tests/obj_link_build.sh` a `bootstrap/verify.sh`. Y el
fixpoint sigue verde: `--emit=obj` no cambia la salida por defecto.

---

## 4. Fase 1 — Disciplina freestanding

Sin cambios al compilador.

1. Crear `lib/freestanding.tt` importando `str.tt`, `string.tt`, `parse.tt`,
   `vec.tt` en ese orden (el preprocessor exige que toda referencia apunte a un
   fichero ya expandido).
2. Documentar en `idioms.md` el patrón "arena del llamante": `let ar: Arena` +
   `arena_init(&ar, buf, len)`, con la prohibición explícita de `bss` en código
   enlazable.
3. Smoke: un `.tt` que use el subconjunto, se compile con `--emit=obj`, y se
   llame **desde dos hilos de C** sobre scratches distintos. Es la prueba de
   reentrancia, y es la que justifica toda esta fase.

**Cierre.** El smoke de dos hilos pasa con ThreadSanitizer limpio.

---

## 5. Fase 2 — UTF-8 en `lib/string.tt`

Sin cambios al compilador. Es el único hueco de *comportamiento* del port.

`normalize_title` usa `char::is_alphanumeric()` sobre codepoints Unicode, y
`normalize_title_preserves_cjk` lo blinda con títulos en chino, japonés y
coreano.

```
fun str_next_codepoint(p: *u8, len: u64, i: u64, out_cp: *u64) -> u64
```

Devuelve el número de bytes consumidos (0 si la secuencia es inválida) y escribe
el codepoint en `out_cp`. Decodificación UTF-8 estándar; con los shifts del hito
24.a ya disponibles, es aritmética directa.

**Decisión que hay que tomar a conciencia, no descubrir.** La regla
"todo codepoint ≥ U+0080 cuenta como alfanumérico" pasa los tres tests CJK pero
**diverge** en puntuación no-ASCII: guiones tipográficos, comillas CJK y `·`
seguirían siendo separadores en Rust y dejarían de serlo en tetsuo. Esa función
alimenta el matching de títulos en `torrents/mod.rs:602`, `:676` y
`gui/mod.rs:1099`/`:1281`.

Recomendación: implementar la aproximación **y** añadir al port un test
diferencial sobre un corpus de títulos reales que compare campo a campo las dos
implementaciones. Si la divergencia aparece en <0,1 % del corpus, es aceptable y
queda medida. Si no, hace falta una tabla de rangos de puntuación Unicode
(unas 30 entradas cubren lo que aparece en nombres de release).

**Cierre.** `tests/utf8_test.tt` con vectores de 1–4 bytes, secuencias
truncadas y sobrelargas. Más el diferencial del corpus del lado del port.

---

## 6. Punto de control: aquí ya se puede portar

Con las fases 0–2 cerradas, `release_name.rs` es portable. **Todo lo que sigue
es calidad de vida y no bloquea el objetivo.** Si el port revela fricciones
distintas a las previstas, esa lista manda sobre esta.

---

## 7. Fase 3 — Aritmética y lógica

### 7.1 Operador `%` — hazlo en el IR, no en el parser ni en el codegen

Parece el cambio trivial de la lista. No lo es, y las dos rutas obvias están mal:

**Mal: desugar en el parser** a `a - (a / b) * b`. Duplica los subárboles `a` y
`b`, y el lowering los baja **dos veces**. Si `a` es una llamada, se ejecuta dos
veces. Bug semántico silencioso.

**Mal: un caso más en `cgb_alu` / `out_binop_mnemonic`.** AArch64 no tiene
instrucción de módulo: son dos (`udiv tmp, ra, rb` + `msub rd, tmp, rb, ra`) y
hace falta un registro temporal. Ambos emisores asumen hoy "un binop = una
instrucción de la forma `mnemónico rd, ra, rb`" (mira `emit_i_binop` y
`cgb_alu`). Romper esa invariante toca los dos backends y necesita un scratch
libre — y `x16`/`x17` ya se usan para materializar las fuentes, y `x18` está
**reservado por la plataforma en macOS**, así que no vale.

**Bien: desugar en `lower_expr`**, en `src/ir.tt`. Bajas cada operando **una
vez** a su slot y emites tres `IR_BINOP` ya existentes:

```
sa = lower(lhs)          // una sola vez
sb = lower(rhs)          // una sola vez
t1 = IR_BINOP(OP_DIV, sa, sb)
t2 = IR_BINOP(OP_MUL, t1, sb)
d  = IR_BINOP(OP_SUB, sa, t2)
```

Semántica correcta, cero encoders nuevos, cero cambios en los dos backends, y
la variante con signo sale gratis porque `OP_DIV` ya distingue `is_signed`.
Cuesta una instrucción más que el óptimo; es el precio correcto por no tocar el
codegen.

Ficheros: `lexer.tt` (`TK_PERCENT`), `parser.tt` (`OP_MOD`, precedencia 6 junto
a `*` y `/`), `ir.tt` (el desugar). **No** `codegen.tt` ni `codegen_bytes.tt`.

### 7.2 `!` unario — desugar en el parser, aquí sí

`!x` → `EX_EQ(x, 0)`. Un solo operando, se baja una vez, no hay duplicación.
Cero cambios en IR y codegen.

### 7.3 `&&` / `||` — el más caro de los tres

Necesitan cortocircuito, y eso significa **labels dentro de `lower_expr`**, que
hoy no emite ninguno (solo `lower_stmt` lo hace, vía `ir_new_label`). El
esquema para `a && b`:

```
d = 0
sa = lower(a)
JZ sa -> Lend
sb = lower(b)
d = (sb != 0)
Lend:
```

`IR_JZ` e `ir_new_label` ya existen; lo nuevo es que una expresión pase a tener
flujo de control, lo que interactúa con el regalloc lineal (`cross`-label, no
solo `cross`-CALL). **Revisa `regalloc` en `ir.tt` antes de dar esto por
cerrado**: un valor vivo a través de un salto necesita el mismo tratamiento que
hoy recibe uno vivo a través de un `CALL`. Es el punto donde más fácil es
introducir un bug que solo aparece con presión de registros alta.

Sugerencia: hito propio, con un smoke que fuerce >7 valores vivos simultáneos
(`NREGS = 7`) alrededor de un `&&`.

---

## 8. Fase 4 — Tablas constantes de cadenas

Es el hueco que más código artificial genera: las 32 parejas de
`RESOLUTIONS`/`SOURCES`/`CODECS` acaban como cascada de `if`.

**Empieza por el workaround, no por la feature.** Una función generada:

```
fun codec_canon(tok: *u8, n: u64, out: *str) -> u64 {
    let k1: str = 'x265'
    if string_eq(tok, n, k1.ptr, k1.len) == 1 { ... return 1 }
    ...
}
```

Feo, pero funciona hoy y se puede generar con un script desde la tabla Rust, lo
que además garantiza que las dos implementaciones no se desincronicen.

Si tras el port sigue doliendo, la feature real es
`const NAMES: [str] = ['a', 'b']` a nivel top-level. Detalle no obvio y a favor:
en el backend de bytes **es más fácil** que en el textual. `--emit=macho`
produce una imagen final con vaddr conocidas, así que la tabla se escribe con
direcciones absolutas ya resueltas; el camino textual necesita `.quad _Lstr0` y
delegar en el linker. Al revés de lo que uno esperaría.

---

## 9. Fase 5 — Lo que no deberías hacer todavía

- **Genéricos / `Vec[T]`.** El `Vec` byte-genérico (`esz` + `*u8` + cast del
  llamante) cubre el port entero. Los genéricos son un hito grande y no sirven
  al objetivo.
- **Interfaz de allocator.** Necesaria el día que quieras código de vida larga
  (un servidor que no puede perder memoria en cada crecimiento). No lo necesita
  un parser puro llamado desde Rust con scratch del llamante.
- **Red, reloj, concurrencia.** El backend de videodrome no es el terreno de
  prueba adecuado: son justo las partes donde Rust y tokio ya hacen un trabajo
  que tetsuo no va a igualar.
- **Backend x86_64 o PE/COFF.** Solo si decides que el módulo tetsuo debe ser el
  camino por defecto en vez de la copia secundaria. Mientras videodrome envíe
  binarios de Windows, no lo es.

---

## 10. Verificación

Cada hito cierra con **todas** estas verdes, no algunas:

1. `bootstrap/verify.sh` — 35/35 en macOS arm64, más el smoke nuevo del hito.
2. `bootstrap/linux/verify_linux.sh` — fixpoint y smokes bajo qemu.
3. `bootstrap/linux/verify_macho_linux.sh` — los binarios emitidos en bytes, no
   solo el asm. Es el que separa "codegen malo" de "contenedor malo".
4. **Fixpoint bit a bit**: `tests/fixpoint_build.sh` → `cmp s0.s s1.s` y
   `cmp s1.s s2.s` limpios. Si un cambio de lenguaje rompe esto, el cambio está
   mal, no el fixpoint.
5. Seed regenerada y committeada en el mismo commit que la feature.

Un hito con la suite verde y el fixpoint roto **no está cerrado**: significa que
el compilador ya no se reproduce, y el siguiente cambio parte de una base que no
se puede reconstruir.

---

## Resumen del orden

| Fase | Trabajo | ¿Toca el compilador? | ¿Bloquea el objetivo? |
|---|---|---|---|
| 0 | `--emit=obj` | sí (~15 líneas) | **sí** |
| 1 | Disciplina freestanding + `lib/freestanding.tt` | no | **sí** |
| 2 | `str_next_codepoint` en `lib/string.tt` | no | **sí** |
| — | **Portar `release_name.rs`** | — | — |
| 3 | `%`, `!`, `&&`/`\|\|` | sí | no |
| 4 | Tablas constantes de cadenas | sí | no |
| 5 | Genéricos, allocator, red, x86_64 | sí | no |

El camino al objetivo son tres fases, y dos de ellas no tocan el compilador.
