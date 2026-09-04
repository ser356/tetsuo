#!/usr/bin/env python3
import argparse
import hashlib
import math
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "AGENT-CONTEXT.md"
VERSION = "2026.09.05"
SOURCES = [
    ROOT / "LENGUAJE.md",
    ROOT / "idioms.md",
    ROOT / "docs/agent/COOKBOOK.md",
    ROOT / "docs/agent/ERRORS.md",
    ROOT / "docs/agent/METRICS.md",
]


def lexical_tokens(text: str) -> int:
    return len(re.findall(r"\w+|[^\w\s]", text, re.UNICODE))


def build() -> tuple[str, int, int]:
    sections = []
    hashes = []
    for path in SOURCES:
        data = path.read_bytes()
        text = data.decode()
        rel = path.relative_to(ROOT)
        hashes.append(f"- `{rel}`: `{hashlib.sha256(data).hexdigest()}`")
        sections.append(f"\n---\n\n<!-- source: {rel} -->\n\n{text.rstrip()}\n")
    body = "".join(sections)
    tokens = lexical_tokens(body)
    byte_count = len(body.encode())
    header = (
        f"# Tetsuo agent context pack\n\n"
        f"Version: `{VERSION}`\n\n"
        f"Canonical lexical tokens to competence: **{tokens}**  \n"
        f"UTF-8 bytes: **{byte_count}**  \n"
        f"Estimated model tokens (`ceil(bytes/4)`): **{math.ceil(byte_count / 4)}**\n\n"
        f"## Source integrity\n\n" + "\n".join(hashes) + "\n"
    )
    return header + body, tokens, byte_count


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--metrics", action="store_true")
    args = parser.parse_args()
    content, tokens, byte_count = build()
    if args.metrics:
        print(f"version={VERSION} lexical_tokens={tokens} utf8_bytes={byte_count} estimated_model_tokens={math.ceil(byte_count / 4)}")
        return 0
    if args.check:
        if not OUTPUT.exists() or OUTPUT.read_text() != content:
            print("AGENT-CONTEXT.md is stale", file=sys.stderr)
            return 1
        return 0
    OUTPUT.write_text(content)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
