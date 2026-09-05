---
agent: agent
description: Fires a caveman + ponytail + graft + graph swarm for a task
---

activate swarm mode inheriting from the environment:
- caveman ultra from turn 1
- ponytail on any edit
- graft before any read_file / grep
- graph if the repo supports it

task:
${input:task:describe the task to parallelize}

rules:
- locate with graft first.
- resolve `SWARM_MODEL` ONCE from your system prompt
  (format `"<Model Name> (copilot)"`) and pass it in EVERY `agent` call.
  With no `model` there is no inheritance — the subagent starts with the
  default.
- split across parallel `agent` calls (investigator / builder / reviewer),
  each one with `model: SWARM_MODEL`.
- consolidate the output. keep the closing marker contract + add
  `🧬 swarm-model: <SWARM_MODEL> · subagents: <N>`.
