#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
compiler=${TETSUOC:-bootstrap/tetsuoc.macho}
for case in call_undefined return_type return_missing let_type assign_type assign_target store_nonpointer; do
    set +e
    "$compiler" --diagnostics=json "tests/neg/$case.tt" -o /tmp/tt_json.s 2>"/tmp/tt_json_$case.err"
    rc=$?
    set -e
    [[ $rc -eq 2 ]]
done
set +e
"$compiler" --diagnostics=json tests/neg/parse_invalid_primary.tt -o /tmp/tt_json.s 2>/tmp/tt_json_parser.err
parser_rc=$?
"$compiler" --diagnostics=json tests/neg/does_not_exist.tt -o /tmp/tt_json.s 2>/tmp/tt_json_missing.err
missing_rc=$?
set -e
[[ $parser_rc -eq 2 && $missing_rc -eq 2 ]]
python3 - <<'PY'
import json
expected = {
    'call_undefined': ('E0101', 2, 12),
    'return_type': ('E0104', 3, 12),
    'return_missing': ('E0105', 1, 5),
    'let_type': ('E0106', 3, 9),
    'assign_type': ('E0107', 4, 5),
    'assign_target': ('E0108', 3, 6),
    'store_nonpointer': ('E0110', 3, 6),
}
for case, (code, line, column) in expected.items():
    with open(f'/tmp/tt_json_{case}.err') as f:
        rows = [json.loads(row) for row in f if row.strip()]
    assert len(rows) == 1
    row = rows[0]
    assert row['code'] == code
    assert row['path'] == f'tests/neg/{case}.tt'
    assert (row['line'], row['column']) == (line, column)
    assert row['span']['length'] > 0
    assert row['message'] and row['fix'] is None
for path in ('/tmp/tt_json_parser.err', '/tmp/tt_json_missing.err'):
    with open(path) as f:
        rows = [json.loads(row) for row in f if row.strip()]
    assert len(rows) == 1 and rows[0]['code'].startswith('E')
    assert set(rows[0]) == {'code', 'path', 'line', 'column', 'span', 'message', 'fix'}
PY
