# Plan Mach-O — hitos 24.a → 24.f

> **Estado: cerrado (24.a–24.f).** stage1 emite un Mach-O AArch64 firmado
> ad-hoc ejecutable directamente, con cero herramientas externas. Verificado en
> Linux vía `bootstrap/linux/verify_linux.sh` (fixpoint bit-a-bit + smokes
> 24.a–24.f): los shifts (24.a), el encoder (24.b) contra `aarch64-linux-gnu-as`,
> SHA-256 (24.c) contra `hashlib`, y el Mach-O firmado (24.d/24.f) cuyos hashes
> de pagina se recalculan y comparan (lo que hace `codesign -v`), parseando
> ademas limpio con `llvm-objdump`/`macholib`. El codegen a bytes (24.e) compila
> programas reales (llamadas, recursion, comparaciones, literales de cadena) a un
> Mach-O firmado que se ejecuta bajo qemu y devuelve el valor esperado.
> Pendiente menor: bss en `__DATA` por la ruta de bytes (24.g), soportada ya por
> la ruta textual.

Objetivo: **stage1 emite ejecutables Mach-O AArch64 auto-firmados directamente**, sin `clang` ni `as`/`ld` ni `codesign`. macOS 11+ (Apple Silicon).

Estado actual: stage1 emite `.s` textual → `clang -c` + `clang -e` produce el binario. clang funciona como `as`+`ld`; el ejecutable resultante lo firma clang implícitamente.

Salida deseada: `stage1 → binario Mach-O firmado, ejecutable directo`.

Estructura del binario destino:

```
[mach_header_64                              32B]
[LC_SEGMENT_64  __PAGEZERO                   72B]
[LC_SEGMENT_64  __TEXT (1 section __text)   152B]
[LC_SEGMENT_64  __LINKEDIT                   72B]
[LC_LOAD_DYLINKER /usr/lib/dyld              32B]
[LC_SYMTAB (nsyms=0)                         24B]
[LC_DYSYMTAB (all zero)                      80B]
[LC_UUID                                     24B]
[LC_BUILD_VERSION macos 11.0                 24B]
[LC_MAIN entryoff                            24B]
[LC_CODE_SIGNATURE dataoff/datasize          16B]
[padding hasta 0x1000                          ]
[código __TEXT                                 ]
[__cstring (literals)                          ]
[padding a 0x4000                              ]
[__LINKEDIT: CS_SuperBlob                      ]
  [CS_CodeDirectory hdr]
  [ident "adhoc\0"]
  [SHA-256 slot 0]
  [SHA-256 slot 1]
  [...]
```

## Fase A — infraestructura del lenguaje y encoder

### 24.a — Shifts `<<` y `>>`

- **Objetivo**: operadores `<<` y `>>` binarios. Sin ellos, SHA-256 y encoding AArch64 son inviables.
- **Ficheros**: `src/lexer.tt` (nuevos tokens `TK_LSHIFT` `TK_RSHIFT`), `src/parser.tt` (constantes `OP_SHL` `OP_SHR`, `bin_prec` prec 5, `parse_expr` mapping), `src/codegen.tt` (`out_binop_mnemonic` gana `lsl` y `lsr`), `src/ir.tt` (nada — `IR_BINOP` ya cubre).
- **Smoke**: `tests/shifts_test.tt` con `let x: u64 = 1 << 5; if x != 32 { return 1 }; if (1024 >> 3) != 128 { return 2 }; return 0`. verify.sh: rc=0.
- **LOC**: ~30. Regenerar seed (+/-500L).
- **Deps**: ninguna.

### 24.b — Encoder de instrucciones AArch64

- **Objetivo**: para cada mnemónico que emitimos hoy en `.s`, devolver el `u32` codificado. Es la clave para saltar de texto a bytes.
- **Ficheros**: nuevo `src/asm.tt`. Una función por familia de instrucciones:
  - `enc_movz(rd, imm16, hw) -> u32`
  - `enc_movk(rd, imm16, hw) -> u32`
  - `enc_mov_reg(rd, rm) -> u32`  (alias de `orr xd, xzr, xm`)
  - `enc_stp_pre(rt, rt2, rn, imm7) -> u32`
  - `enc_ldp_post(rt, rt2, rn, imm7) -> u32`
  - `enc_add_imm(rd, rn, imm12) -> u32`
  - `enc_sub_imm(rd, rn, imm12) -> u32`
  - `enc_add_reg(rd, rn, rm) -> u32`, `enc_sub_reg`, `enc_mul`, `enc_udiv`, `enc_and`, `enc_orr`, `enc_eor`
  - `enc_ldr_x(rt, rn, imm12) -> u32`, `enc_ldr_w`, `enc_ldrb`, `enc_str_x`, `enc_str_w`, `enc_strb`
  - `enc_adrp(rd, imm21) -> u32`, `enc_add_pageoff(rd, rn, imm12)`
  - `enc_bl(imm26) -> u32`, `enc_b(imm26) -> u32`, `enc_cbz_w(rt, imm19)`
  - `enc_cmp_reg(rn, rm) -> u32`, `enc_cset(rd, cond) -> u32`
  - `enc_svc(imm16) -> u32`
  - `enc_ret() -> u32`
- **Smoke**: `tests/asm_test.tt` valida 8 casos contra encodings conocidos (`enc_movz(0,42,0)==0xD2800540`, `enc_ret()==0xD65F03C0`, etc). bytes_eq contra tabla dorada.
- **LOC**: ~250.
- **Deps**: 24.a (usa shifts para packing).

### 24.c — SHA-256

- **Objetivo**: `sha256(msg: *u8, mlen: u64, out: *u8)` que escribe 32 bytes de hash. Fundamento de la firma ad-hoc.
- **Ficheros**: nuevo `lib/sha256.tt`.
- **Smoke**: `tests/sha256_test.tt` — hash de `''` (`e3b0c44298fc1c149afbf4c8996fb924...`), `'abc'` (`ba7816bf8f01cfea414140de5dae2223...`), y un input de 128 bytes. bytes_eq contra `.byte` array esperado.
- **LOC**: ~250 (K constants table + h init + message schedule + compression + padding).
- **Deps**: 24.a (shifts).

## Fase B — Mach-O writer

### 24.d — Headers y load commands

- **Objetivo**: emitir un Mach-O válido con TODOS los LC requeridos por macOS 11+ arm64, con un section `__text` que contiene código dummy `exit(42)`. El binario debe pasar `otool -l` y aceptar `codesign -s -`. Con `codesign` externo, debe ejecutarse y rc=42.
- **Ficheros**: nuevo `src/macho.tt`. Funciones:
  - `mo_write_header(o, ncmds, sizeofcmds)`
  - `mo_write_seg_pagezero(o)`
  - `mo_write_seg_text(o, text_size, text_offset, cs_offset, ...)`
  - `mo_write_seg_linkedit(o, offset, size)`
  - `mo_write_load_dylinker(o)`
  - `mo_write_symtab(o)` (nsyms=0, still required)
  - `mo_write_dysymtab(o)`
  - `mo_write_uuid(o, uuid16)`
  - `mo_write_build_version(o)`
  - `mo_write_main(o, entryoff)`
  - `mo_write_code_signature(o, dataoff, datasize)` (placeholder LC)
- **Smoke**: `tests/macho42_test.tt` emite el binario con solo `exit(42)`. `tests/macho42_build.sh` hace `codesign -s -` externo, ejecuta, verifica rc=42.
- **LOC**: ~400.
- **Deps**: 24.a, 24.b (encoder para las 3 instrucciones del cuerpo).

### 24.e — Two-pass codegen bytes

- **Objetivo**: reemplazar la ruta de `.s` textual por bytes ARM64 directamente. Coexisten `codegen.tt` (texto) y `codegen_bytes.tt` (bytes) hasta que la ruta bytes esté completa.
- **Ficheros**: nuevo `src/codegen_bytes.tt` con la misma superficie que `codegen.tt` pero output bytes.
  - Two-pass:
    1. Pass 1: computar posiciones absolutas de cada función y label. Recorrer todas las Ins llevando cuenta del offset actual.
    2. Pass 2: emitir bytes. Para `bl _sym` computar `(target_offset − current_offset) / 4` y encodear en imm26. Para `b .LN` igual con label local.
  - Emisión de string literals en un segmento `__cstring` dentro de `__TEXT`. `IR_LABEL_ADDR` → `adrp` + `add` con relocaciones internas.
  - Emisión de bss como parte de `__DATA,__bss` con `LC_SEGMENT_64 __DATA`.
- **Smoke**: `tests/codegen_bytes_test.tt` emite el equivalente de `fun main(){return 42}` a bytes, hace `codesign -s -` externo, corre, rc=42.
- **LOC**: ~800 (mayoría desplazamiento + relocation logic).
- **Deps**: 24.b, 24.d.

### 24.f — Firma ad-hoc embebida

- **Objetivo**: eliminar `codesign` externo. Escribir el `CS_SuperBlob` completo en `__LINKEDIT` y hashear las páginas de 4KB.
- **Ficheros**: `src/macho.tt` gana:
  - `mo_write_code_signature_full(o, page_hashes[], nhashes, ident)`.
  - `mo_compute_page_hashes(binary_bytes, code_limit) -> [nhashes][32]`.
  - Estructura CS_SuperBlob:
    ```
    magic = 0xFADE0CC0
    length = total_bytes
    count = 1
    [blob_index]
      type = CSSLOT_CODEDIRECTORY (0)
      offset = 20
    [CS_CodeDirectory]
      magic = 0xFADE0C02
      length
      version = 0x20400
      flags = 0x20002 (adhoc | linkerSigned) o solo adhoc 0x2
      hashOffset = size_of_hdr + ident_len
      identOffset = size_of_hdr
      nSpecialSlots = 0
      nCodeSlots = ceil(codeLimit / 4096)
      codeLimit = fileoff hasta antes de CS
      hashSize = 32
      hashType = 2 (SHA-256)
      hashPageShift = 12
      spare1 = 0
      spare2 = 0
    [ident bytes "adhoc\0" 6B]
    [slot_hashes cada 32B]
    ```
- **Reto de orden**: el hash de cada página incluye bytes que dependen del propio LC_CODE_SIGNATURE (dataoff/datasize) pero NO del cuerpo de la signature. Por eso el layout escribe primero todo con placeholders correctos para dataoff/datasize del CS_SuperBlob (calculable a priori: tras conocer `codeLimit`), y solo la parte del CS_SuperBlob se rellena al final.
- **Algoritmo**:
  1. Calcular todos los tamaños a priori: text_size, linkedit_size (incluye CS_SuperBlob size), signature_offset, signature_size.
  2. Escribir headers con signature_offset/size correctos.
  3. Escribir __TEXT.
  4. Padding hasta signature_offset.
  5. Escribir CS_SuperBlob header + CodeDirectory header + ident (con hashOffset/identOffset correctos).
  6. **En este punto, todos los bytes del 0 al signature_offset+hashOffset están definitivos.**
  7. Releer/re-hashear el buffer completo hasta `codeLimit` en trozos de 4KB con SHA-256 (24.c) y escribir 32 bytes cada uno donde toque.
- **Smoke**: `tests/macho_signed_test.tt` genera binario firmado. `codesign -v` acepta. `spctl -a` (opcional) evalúa. Ejecutar → rc=42. **Cero herramientas externas.**
- **LOC**: ~200 (encima de 24.d y 24.c).
- **Deps**: 24.c, 24.d, 24.e.

## Camino de merge

Con las 6 sub-hitos:

1. Se puede **parar en 24.d + codesign externo** — funcional, un solo tool externo.
2. Se puede **cerrar 24.f para MVP total** — cero externos más allá del kernel.
3. **24.g fixpoint bytes**: el seed committeado pasa de `.s` (18KL texto) a `.macho` (~300KB binario). Diff se hace con `cmp` bit-a-bit.

## Estimación agregada

| Hito  | LOC  | Riesgo | Ganancia |
|-------|------|--------|----------|
| 24.a  | 30   | bajo   | Habilita 24.b, 24.c |
| 24.b  | 250  | medio  | Fundamento del writer |
| 24.c  | 250  | medio  | Fundamento firma |
| 24.d  | 400  | alto   | MVP con codesign externo |
| 24.e  | 800  | alto   | Codegen bytes real |
| 24.f  | 200  | medio  | Cierra la promesa |
| **Total** | **~1930** | | **stage1 → .macho firmado, cero tools** |

Cada sub-hito con smoke propio + fixpoint intermedio. Regenerar `bootstrap/tetsuoc.s` (o `.macho` tras 24.g) en cada uno.
