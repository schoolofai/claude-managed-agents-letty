#!/usr/bin/env bash
# Print one file from Letty's records store, wrapped to the terminal width.
# Usage: scripts/show.sh /handover/latest.md
set -euo pipefail
cd "$(dirname "$0")/.."
P="${1:?usage: scripts/show.sh /path/in/records.md}"
REC=$(jq -r '.resources["./memory_stores/records.yaml"].id' claude-lock.json)
ant beta:memory-stores:memories list --memory-store-id "$REC" \
  --path-prefix "$(dirname "$P" | sed 's#/*$#/#')" --view full \
  --transform '{path,content}' -r \
  | jq -r --arg p "$P" 'select(.path == $p) | .content' \
  | fold -s -w "${WIDTH:-100}"
