#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/tmp/restored-by-randi"
cd "$REPO_DIR"

./scripts/seo-intel.sh

# Optional auto-commit daily intel
if ! git diff --quiet -- content/research-daily content/research-latest.md; then
  git add content/research-daily content/research-latest.md
  git commit -m "Daily SEO intel update $(date +%F)" || true
  git push origin main || true
fi
