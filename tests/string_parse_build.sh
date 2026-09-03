#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
bash tests/macos_build.sh tests/string_parse_test.tt
