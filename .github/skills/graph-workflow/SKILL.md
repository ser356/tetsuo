# graph-workflow

This repo has a **deterministic workflow graph** in `.graph/workflow.yaml`.
The graph runs through the `graph` MCP server and controls, in real time,
which step comes next. **You do not decide the flow: the engine does.**

## Minimal contract

1. ALWAYS start by calling `graph_start(request)` with the user's request. The
   engine returns the first pause: `interrupt_id`, `message`,
   `response_schema`.
2. Compose a response that **validates** against `response_schema`. Call
   `graph_submit(session_id, interrupt_id, reply)`.
3. If the response does not validate, `graph_submit` returns `status: rejected`
   without consuming the pause. Fix the response and send it again over the same
   `interrupt_id`.
4. If it returns `status: paused`, there is a new pause: repeat step 2.
5. If it returns `status: done`, the graph has finished. Report the result to
   the user.
6. If it returns `status: error`, propagate the message to the user without
   inventing further steps.

## Rules

- **Never edit `.graph/workflow.yaml`.** It is committed separately and its
  changes are reviewed in a PR.
- The `shell` nodes are run by the engine, not by you. Do not replicate their
  command.
- If the engine asks for a JSON with a `risk: high` field, respect what you
  observed — do not lower it to `low` to pass the gate.
- If the engine returns `status: error` with "no waiting node matched", you are
  probably sending a stale `interrupt_id`: ask for `graph_status` to see the
  current pause.
