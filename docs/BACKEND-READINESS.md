# ¿Está tetsuo preparado para implementar partes del backend de videodrome?

Investigación fechada 2026-09-03. Contrasta las capacidades **verificadas en el
código** de tetsuo (`src/*.tt`, `lib/*.tt`, `SELFHOST-STATE.md`) contra el
backend Rust de `ser356/videodrome` (54 ficheros `.rs`, 29 101 LOC).

## Veredicto

**No todavía, salvo para un módulo.** De los 29 101 LOC del backend, hay
**770 LOC (2,6 %)** que son portables a tetsuo hoy con esfuerzo acotado:
`src/torrents/release_name.rs`. El resto está bloqueado por tres cosas que no
son "escribir más código tetsuo", sino huecos del propio lenguaje y de su
modelo de compilación.

Y aun ese 2,6 % **no se puede enchufar al backend actual** hasta que tetsuo
sepa emitir un objeto enlazable sin entrypoint. Ese es el primer trabajo, no el
port.

## Por qué: el perfil de dependencias del backend

Medido por fichero, contando LOC de todo fichero que toca cada familia:

| Familia | LOC afectados | % del backend |
|---|---|---|
| `async` / `.await` | 23 908 | 82 % |
| Red (`reqwest`, `axum`, `hyper`, `TcpListener`) | 21 560 | 74 % |
| Punto flotante (`f32`/`f64`) | 23 805 | 82 % |
| Colecciones heap (`String`, `Vec`, `HashMap`, `Box`) | 27 775 | 95 % |

Tetsuo no tiene ninguna de las cuatro:

- **Sin async y sin hilos.** No hay runtime, ni futures, ni `Mutex`, ni
  atómicos. `syscall(n,a,b,c)` es la única puerta al sistema.
- **Sin red.** `SELFHOST-STATE.md` lo dice explícito: "Red, procesos hijo,
  entorno y reloj aún no tienen API estable". `lib/std.tt` cubre ficheros,
  bytes, strings, parseo, formato, stdout/stderr y `Vec`. Nada más.
- **Sin flotantes.** No existe `f32`/`f64` en el lexer ni en `PrimType`. Toda
  la aritmética de HLS (`Vec<(f64,f64)>` de segmentos, playhead, throttle,
  progreso) tendría que reescribirse en punto fijo — un cambio de
  comportamiento, no un port.
- **Sin heap.** `arena_take` es bump-only, no hay `free`. Válido para un
  compilador batch que muere al terminar; no para un servidor de streaming
  de vida larga.

Ficheros con cero dependencias de las cuatro familias: cinco, 931 LOC. De
esos, `main.rs` (57), `gui/commands/mod.rs` (14), `kiosk/mod.rs` (29) y
`embed_player.rs` (61) son pegamento Tauri y declaraciones de módulo, sin
lógica portable. Queda uno.

## Los tres bloqueadores estructurales

### 1. No hay ruta de enlace (el bloqueador duro)

Para que Rust llame a código tetsuo hace falta un `.o` enlazable. Hoy tetsuo
emite dos cosas y ninguna sirve:

- `--emit=macho` → un ejecutable Mach-O completo, firmado ad-hoc, con
  `LC_MAIN`. No es reubicable.
- salida `.s` textual → sí se puede pasar por `clang -c`, **pero**
  `codegen()` en `src/codegen.tt:codegen` llama a `emit_macos_start(o)` de
  forma incondicional para `TGT_MACOS`, que emite:

  ```
  .globl   _tt_start
  _tt_start:
      bl      _main
  ```

  Un símbolo global `_tt_start` que referencia `_main`. Al enlazarlo en un
  binario Rust: o falla por `_main` indefinido, o colisiona. No se puede
  dead-strip porque es `.globl`.

**La buena noticia**: la ABI ya es compatible. El prólogo
(`src/codegen.tt:emit_prologue`) hace `stp x29, x30, [sp, #-16]!` estándar,
los parámetros llegan en x0–x7, el retorno sale por x0/w0, y el regalloc usa
`NREGS = 7` mapeado a **x9–x15** (`src/ir.tt:718`) más x16 de scratch — todos
caller-saved en AAPCS64, así que no hay registros callee-saved que preservar.
Un `fun f(p: *u8, n: u64) -> u64` es binariamente idéntico a un
`extern "C" fn(*const u8, u64) -> u64` de Rust, y un parámetro `str` se
expande a dos registros (ptr, len), que casa con `(*const u8, usize)`.

Es decir: **falta un flag `--emit=obj` / `--no-entry` que suprima
`emit_macos_start`**. Es un cambio de pocas líneas en `codegen()`, más
regenerar la seed y re-verificar el fixpoint. Eso desbloquea todo lo demás.

### 2. Cobertura de plataformas

`.github/workflows/ci.yml` de videodrome construye en `macos-latest` **y**
`windows-latest`, y `Cargo.toml` declara `crate-type = ["staticlib", "cdylib",
"rlib"]` para Tauri Mobile (Android). Hay `src/winutil.rs` y bloques
`[target.'cfg(windows)'.dependencies]`.

Tetsuo emite **solo AArch64**, y solo macOS (Mach-O nativo) o Linux (vía el
shim de `bootstrap/linux/shim.s`, que traduce syscalls BSD→Linux). No hay
backend x86_64 ni PE/COFF.

Consecuencia práctica: cualquier módulo portado a tetsuo tendría que
**mantenerse por duplicado** — versión tetsuo bajo `cfg(all(target_os =
"macos", target_arch = "aarch64"))` y versión Rust para el resto. Dos
implementaciones de la misma lógica que hay que mantener sincronizadas es
peor que una. Esto solo se paga si el módulo es estable y raramente tocado.

### 3. Huecos de expresividad que encarecen cualquier port

Verificados contra `src/lexer.tt` y `LENGUAJE.md`:

- **No hay `%`.** No existe `TK_PERCENT` ni `OP_MOD`. Hay que escribir
  `a - (a / b) * b` a mano en cada sitio.
- **No hay `&&`, `||` ni `!`.** `&` y `|` son bit a bit; el único token con
  `!` es `!=`. Toda condición compuesta se desdobla en `if` anidados.
- **No hay tablas constantes.** `const` solo admite un literal entero, y los
  literales de cadena solo valen como inicializador de `let s: str = '...'`.
  Las tablas `RESOLUTIONS` / `SOURCES` / `CODECS` de `release_name.rs` (32
  pares string→string) no se pueden declarar; hay que codificarlas como
  cascada de `if` dentro de una función, o construirlas en arena al arrancar.
- **Structs con todos los campos de 8 bytes.** `sizeof(T)` = nº campos × 8,
  sea cual sea el tipo declarado. Un `ParsedRelease` desperdicia espacio, pero
  funciona.
- **Sin genéricos, sin enums, sin `Option`.** `lib/vec.tt` guarda elementos
  opacos y no hace bounds checking. `Option<u16>` se modela con centinela
  (`0xFFFF`) y hay que ser disciplinado.
- **Sin UTF-8 ni Unicode.** Solo bytes. Ver el caso concreto abajo.
- Máximo 8 parámetros, bucles anidados ≤ 16, máximo 32 imports, sin
  namespaces ni build incremental.

## El candidato real: `src/torrents/release_name.rs`

770 LOC. Parser de nombres de release scene/P2P. Cero async, cero red, cero
flotantes, cero serde, cero procesos, cero reloj. Solo `String`/`Vec` (34
ocurrencias) — y todas son reubicables a arena.

Encaja porque es exactamente lo que tetsuo hace bien y lleva haciendo desde
el hito 15: **tokenizar bytes y decidir sobre la estructura**. Es el mismo
patrón que `src/lexer.tt` y `src/parser.tt`.

Mapa de traducción, función por función:

| Rust | tetsuo | Nota |
|---|---|---|
| `tokenize() -> Vec<String>` | `Vec` de `(start, len)` sobre el buffer de entrada | sin copiar bytes; más rápido que el original |
| `to_ascii_lowercase()` | aritmética de bytes | trivial |
| `parse_sxxeyy` / `parse_sxx` / `parse_episode_only` | bucle de dígitos + `parse_u64` de `lib/parse.tt` | directo |
| `parse_year` | comparación de rango | directo |
| `match_tag` contra tablas | cascada de `if` con `string_eq` (`lib/string.tt`) | verboso; ver hueco de tablas constantes |
| `split('-').next()` | `string_find_byte` (`lib/string.tt`) | ya existe |
| `Option<u16>` | centinela `0xFFFF` | disciplina manual |
| `tokens[..cut].join(" ")` | escritura a buffer de arena | directo |
| `ParsedRelease` | `struct` de 7 campos (56 B) | campos de 8 B cada uno |

**El único hueco real de comportamiento**: `normalize_title` usa
`char::is_alphanumeric()` y `char::to_lowercase()` sobre **codepoints
Unicode**, y hay un test que lo blinda:

```rust
assert_eq!(normalize_title("流浪地球 2019"), "流浪地球 2019");
assert_eq!(normalize_title("千と千尋の神隠し"), "千と千尋の神隠し");
assert_eq!(normalize_title("기생충 2019"), "기생충 2019");
```

Tetsuo no decodifica UTF-8 y no tiene tablas Unicode. La aproximación
razonable — decodificar UTF-8 a mano y tratar todo codepoint ≥ U+0080 como
alfanumérico — pasa esos tres tests, pero **no es equivalente**: divergirá en
puntuación no-ASCII (guiones tipográficos, comillas CJK, `·`), que el original
convierte en separador y la aproximación conservaría. Dado que
`normalize_title` alimenta el matching de títulos en `torrents/mod.rs:602` y
`:676` y en `gui/mod.rs:1099`/`:1281`, una divergencia ahí degrada resultados
de búsqueda de forma silenciosa. Es un riesgo asumible pero hay que decidirlo
a conciencia, no descubrirlo.

**Activo a favor**: el módulo trae **34 tests** que sirven de oráculo de
port. Se puede portar y validar contra ellos ejecutando ambas
implementaciones sobre el mismo corpus.

## Candidatos parciales (no hoy)

- **`src/keyframes.rs`** (838 LOC) — el parseo EBML/MKV (`SeekHead`, `Cues`,
  varints) y las tablas `stss`/`stts` de MP4 son puro byte-crunching que
  tetsuo haría bien. Pero el módulo está entretejido con `reqwest` Range
  requests (10 ocurrencias), `async` (23) y `f64` (19) para timestamps. Habría
  que extraer primero un núcleo puro `bytes -> Vec<u64>` en Rust y solo
  entonces portarlo. Ese refactor tiene valor por sí mismo, con o sin tetsuo.
- **`src/stream/hls/argv.rs`** (726 LOC) — construcción de argv para ffmpeg,
  sin async ni red. Pero usa `Command::new` (4) y sincronización (15), y el
  resultado es un `Vec<String>` que se pasa a `std::process`. El beneficio de
  portarlo es nulo.
- **`lib/sha256.tt`** ya existe en tetsuo y está verificado contra `hashlib`.
  Si el backend necesitara hashing puro, esa pieza está lista — pero
  videodrome no la necesita hoy.

## Qué tendría que aterrizar en tetsuo, en orden

1. **`--emit=obj` (o `--no-entry`)**: suprimir `emit_macos_start` en
   `codegen()`. Sin esto no hay integración posible. Requiere regenerar la
   seed y re-pasar el fixpoint.
2. **Operador `%`**: `TK_PERCENT` + `OP_MOD` + `udiv`/`msub` en ambos
   codegens. Barato y quita ruido de todo port aritmético.
3. **Tablas constantes de cadenas**: alguna forma de declarar un array de
   `str` a nivel top-level. Es el hueco que más código artificial genera.
4. **`&&` / `||` / `!`** con cortocircuito. Calidad de vida, pero cambia el
   IR (labels de cortocircuito).
5. **Decodificador UTF-8 en `lib/string.tt`**: `str_next_codepoint`. Necesario
   para cualquier cosa que toque títulos de películas.
6. Solo después: hablar de red, reloj o concurrencia — y para eso el backend
   de videodrome no es el terreno de prueba adecuado.

## Recomendación

Tetsuo cruzó en agosto un umbral real y verificado: se autocompila bit a bit,
emite Mach-O firmado sin toolchain externo, y `bootstrap/verify.sh` va 35/35 en
macOS arm64. Eso es un compilador serio. Pero "compilador serio" y "listo para
sustituir partes de un backend de streaming multiplataforma" son dos umbrales
distintos, y el segundo está lejos: el 82 % del backend es async y flotantes,
el 74 % es red, y no hay backend x86_64 ni Windows.

Lo que sí tiene sentido **como ejercicio de validación del lenguaje, no como
mejora del producto**:

1. Añadir `--emit=obj`.
2. Portar `release_name.rs` a tetsuo, con las 34 pruebas como oráculo.
3. Enlazarlo en videodrome bajo `cfg(all(target_os = "macos", target_arch =
   "aarch64"))`, con la implementación Rust intacta como fallback y como
   referencia diferencial.

Eso ejercita la ruta completa — ABI, enlace, arenas, strings — sobre código
real y con red de seguridad, y produce una lista de fricciones concreta para
el siguiente hito del lenguaje. Lo que **no** hay que hacer es sustituir la
implementación Rust: mientras videodrome envíe binarios de Windows, el módulo
tetsuo es siempre la copia secundaria.

---

**Alcance de esta investigación**: lectura estática del código de ambos
repositorios. No se ejecutó `bootstrap/verify.sh` ni se compiló nada con
tetsuo — el contenedor de esta sesión es Linux x86_64 sin `qemu-aarch64` ni
ensamblador cruzado AArch64, y la seed `bootstrap/tetsuoc.macho` es un binario
arm64. Las afirmaciones sobre ABI, entrypoint y operadores salen de leer
`src/codegen.tt`, `src/ir.tt` y `src/lexer.tt`; las de cobertura del backend,
de contar sobre los 54 `.rs` de videodrome.
