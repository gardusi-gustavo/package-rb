#!/usr/bin/env bash
set -euo pipefail
ROOT="${CI_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"
cd "$ROOT"
"$ROOT/infra/scripts/ci/validate-repo.sh" --root "$ROOT"
"$ROOT/infra/scripts/ci/check-size.sh" --root "$ROOT"
python3 scripts/validate.py --root .
if command -v bundle >/dev/null 2>&1 && command -v ruby >/dev/null 2>&1; then
  bundle install
  bundle exec rake test
else
  echo "ruby toolchain unavailable; bootstrap validation only"
fi
for f in infra/scripts/*.sh; do bash -n "$f"; done
echo "ruby checks ok"
