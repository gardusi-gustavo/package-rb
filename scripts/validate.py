#!/usr/bin/env python3
from __future__ import annotations
import argparse, sys
from pathlib import Path

def main() -> int:
    ap = argparse.ArgumentParser(); ap.add_argument("--root", default=".")
    root = Path(ap.parse_args().root)
    specs = list(root.glob("*.gemspec"))
    if len(specs) != 1:
        print("expected one gemspec", file=sys.stderr); return 1
    spec = specs[0].read_text(encoding="utf-8")
    if 'spec.name = "gardusi-gustavo-kit"' not in spec:
        print("unexpected gem name", file=sys.stderr); return 1
    for name in ("lib/gardusi_gustavo/kit.rb", "test/kit_test.rb", "examples/cli.rb"):
        if not (root / name).is_file():
            print(f"missing {name}", file=sys.stderr); return 1
    ruby = sorted((root / "lib").rglob("*.rb")) + sorted((root / "test").rglob("*.rb"))
    for p in ruby:
        text = p.read_text(encoding="utf-8")
        if "end" not in text:
            print(f"{p}: missing end", file=sys.stderr); return 1
    print(f"ruby validation ok ({len(ruby)} files)")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
