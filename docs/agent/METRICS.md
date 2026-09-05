# Context metrics

**Tokens to competence** means tokens an agent must ingest before receiving language specification, idioms, twenty executable recipes, and stable error catalog.

Canonical measurement is deterministic lexical tokens, counted as Unicode word runs or single non-whitespace punctuation characters with Python regex `\w+|[^\w\s]`. It is provider-independent and reproducible without network or packages. UTF-8 bytes and `ceil(bytes/4)` are also reported for rough model-window planning; the latter is explicitly an estimate, not a tokenizer claim.

Run `python3 tools/build_agent_context.py --metrics`.

The generated pack concatenates `LANGUAGE.md`, `idioms.md`, this directory's
cookbook/catalog/metrics, and records SHA-256 for every source. CI runs
`python3 tools/build_agent_context.py --check`; any source edit requires
regeneration with `python3 tools/build_agent_context.py`.
