#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 tools/build_agent_context.py --check
metrics=$(python3 tools/build_agent_context.py --metrics)
[[ $metrics == *lexical_tokens=* ]]
[[ $(grep -c '^## [0-9][0-9]*\.' docs/agent/COOKBOOK.md) -eq 20 ]]
grep -q 'E0208' AGENT-CONTEXT.md
grep -q 'Canonical lexical tokens to competence' AGENT-CONTEXT.md
