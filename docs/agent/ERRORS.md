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
