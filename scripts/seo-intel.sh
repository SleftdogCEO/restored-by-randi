#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/tmp/restored-by-randi"
OUT_DIR="$REPO_DIR/content/research-daily"
DATE="$(date +%F)"
OUT_FILE="$OUT_DIR/$DATE.md"

mkdir -p "$OUT_DIR"

fetch_ddg_autocomplete() {
  local q="$1"
  curl -fsSL "https://duckduckgo.com/ac/?q=${q}&type=list" 2>/dev/null \
    | tr '[]' '\n' \
    | tr ',' '\n' \
    | sed 's/^"//;s/"$//' \
    | grep -v '^$' \
    | grep -vi '^mastectomy bra$\|^breast prosthesis$\|^insurance coverage mastectomy$\|^whcra breast cancer rights$' \
    | head -n 12 || true
}

cat > "$OUT_FILE" <<EOF
# SEO Intel - $DATE

## What women are searching (live autocomplete)

### Mastectomy bra
EOF

fetch_ddg_autocomplete "mastectomy%20bra" | sed 's/^/- /' >> "$OUT_FILE"

cat >> "$OUT_FILE" <<EOF

### Breast prosthesis
EOF

fetch_ddg_autocomplete "breast%20prosthesis" | sed 's/^/- /' >> "$OUT_FILE"

cat >> "$OUT_FILE" <<EOF

### Insurance coverage mastectomy
EOF

fetch_ddg_autocomplete "insurance%20coverage%20mastectomy" | sed 's/^/- /' >> "$OUT_FILE"

cat >> "$OUT_FILE" <<EOF

### WHCRA
EOF

fetch_ddg_autocomplete "WHCRA%20breast%20cancer%20rights" | sed 's/^/- /' >> "$OUT_FILE"

cat >> "$OUT_FILE" <<EOF

## Suggested blog titles from today's demand
- [ ] Does Medicare cover mastectomy bras in 2026?
- [ ] WHCRA explained in plain English for families
- [ ] Best lightweight breast forms for hot Florida weather
- [ ] What to do if insurance denies your prosthesis claim
- [ ] Post-mastectomy swimwear checklist before summer

## Action today
- [ ] Pick 1 title above and draft/publish before noon
- [ ] Add FAQ block to that article for rich snippets
- [ ] Share article to Facebook + Instagram + one survivor group
EOF

cp "$OUT_FILE" "$REPO_DIR/content/research-latest.md"

echo "Wrote SEO intel: $OUT_FILE"
