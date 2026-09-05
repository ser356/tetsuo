# Stable diagnostic catalog

Codes are API. Messages can improve; code identity does not change. `--diagnostics=json` emits one JSON object per line.

| Code | Meaning | Fix | Language reference | Emitter |
|---|---|---|---|---|
| E0001 | Generic compilation error | — | [diagnostics](../../LANGUAGE.md#diagnostics-and-exits) | `diagnostic_code()` in `lib/fmt.tt` |
| E0007 | Invalid primary expression | inspect token | [expressions](../../LANGUAGE.md#expressions) | `parse_primary()` in `src/parser.tt` |
| E0101 | Undeclared function | declare or rename call | [declarations](../../LANGUAGE.md#declarations) | `check_expr()` in `src/check.tt` |
| E0102 | Incorrect call arity | match parameter count | [declarations](../../LANGUAGE.md#declarations) | `check_expr()` in `src/check.tt` |
| E0103 | Incompatible argument type | cast or change type | [types](../../LANGUAGE.md#types-and-layout) | `check_expr()` in `src/check.tt` |
| E0104 | Incompatible return type | cast or change return | [declarations](../../LANGUAGE.md#declarations) | `check_stmt()` in `src/check.tt` |
| E0105 | Return value required | add value | [declarations](../../LANGUAGE.md#declarations) | `check_stmt()` in `src/check.tt` |
| E0106 | Incompatible initializer type | cast or change type | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0107 | Incompatible assignment type | cast or change target | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0108 | Invalid assignment target | assign to lvalue | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0109 | Dereference requires pointer | use pointer | [expressions](../../LANGUAGE.md#expressions) | `check_expr()` in `src/check.tt` |
| E0110 | Store requires pointer | use pointer | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_stmt()` in `src/check.tt` |
| E0111 | Incompatible arithmetic operands | cast operands | [expressions](../../LANGUAGE.md#expressions) | `check_expr()` in `src/check.tt` |
| E0201 | Rust `fn` interference | `fun` | [declarations](../../LANGUAGE.md#declarations) | `check_interference()` in `src/check.tt` |
| E0202 | Rust `pub` interference | remove | [declarations](../../LANGUAGE.md#declarations) | `check_interference()` in `src/check.tt` |
| E0203 | Rust `mut` interference | remove | [statements](../../LANGUAGE.md#statements-and-scopes) | `check_interference()` in `src/check.tt` |
| E0204 | C `int` interference | `u64` | [types](../../LANGUAGE.md#types-and-layout) | `check_interference()` in `src/check.tt` |
| E0205 | C `printf` interference | `print` | [I/O](../../idioms.md#io) | `check_interference()` in `src/check.tt` |
| E0206 | C `malloc` interference | `arena_take` | [arenas](../../idioms.md#arenas) | `check_interference()` in `src/check.tt` |
| E0207 | C `#include` interference | `import 'path'` | [imports](../../LANGUAGE.md#imports) | `check_interference()` in `src/check.tt` |
| E0208 | C block comment interference | `//` | [lexicon](../../LANGUAGE.md#lexical-structure) | `check_interference()` in `src/check.tt` |
