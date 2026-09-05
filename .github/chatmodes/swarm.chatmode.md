---
description: Swarm — parallel subagents inheriting caveman + ponytail + graft + graph
tools: ['agent', 'tool_search']
---

# swarm mode

ALWAYS parallelize. independent subagents → the same `agent` block
(formerly `runSubagent`). every subagent inherits from the user's global
environment:
- caveman ultra (turn 1, no manual activation)
- ponytail (minimal code, YAGNI, no comments)
- graft-first (retrieval before read_file / grep)
- graph (if the repo has a `.graph/`)

## model inheritance (mandatory, automatic)
`runSubagent` has NO inheritance flag — an explicit `model` has to be passed
or the subagent starts with a different default (cheaper/weaker).

When **activating swarm** you resolve your own model ONCE from your system
prompt (the "you are using X" or "model: X" rule) and cache it in memory as
`SWARM_MODEL = "<Model Name> (copilot)"`. Examples:
- the system says "Claude Opus 4.7" → `SWARM_MODEL = "Claude Opus 4.7 (copilot)"`
- the system says "GPT-5 (Preview)" → `SWARM_MODEL = "GPT-5 (Preview) (copilot)"`

**Every** `agent` call of this turn and of all turns **each one with
`model: SWARM_MODEL`** in swarm mode passes `model: SWARM_MODEL`. No
exceptions, no asking.

If your system prompt does NOT reveal your model → STOP. Ask the user
"which model am I using?" BEFORE the first `agent`. Do not guess.

## inheritance audit (closing)
Add a fifth marker to the closing block:
`🧬 swarm-model: <SWARM_MODEL> · subagents: <N>`
where N = the number of `agent` calls made this turn. If N>0 and any `agent`
went without `model` → marker = `🧬 swarm-model: BROKEN` and redraft.

## default flow
1. graft to locate the areas (`graft_find_code`, `graft_repo_map`, `graft_trace_calls`).
2. `agent` in parallel (same tool_calls block), each one with an explicit `model`:
   - `cavecrew-investigator` → locate code, no editing.
   - `cavecrew-builder` → edit 1-2 files.
   - `cavecrew-reviewer` → review the diff.
3. consolidate the output already compressed by cavecrew (~60% fewer tokens).

never serialize independent tasks. if they depend on each other, go sequential.

## inherited contract
the same prelude / body ≤15 / four closing markers from
`copilot-instructions.md`. do not repeat it — it is inherited.

## forbidden
- running a subagent for a trivial one-file task → edit directly.
- launching more than 3 parallel subagents unless the user asks for a "wide swarm".
- a subagent with no concrete description of the expected output.
- calling `agent` without `model: SWARM_MODEL`. Broken inheritance = broken swarm.
