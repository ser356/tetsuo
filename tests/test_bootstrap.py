import subprocess
from pathlib import Path


def test_bootstrap_verify():
    root = Path(__file__).resolve().parents[1]
    r = subprocess.run(
        ["bash", "bootstrap/verify.sh"], cwd=root, capture_output=True, text=True
    )
    assert r.returncode == 0, r.stdout + r.stderr
