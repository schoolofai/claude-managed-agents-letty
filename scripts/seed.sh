#!/usr/bin/env bash
# Seed the rules memory store after `ant apply` has written claude-lock.json.
# ant apply creates the store but not the files in it. This script writes
# rules.md, agency.json and one inbox note. Run it from anywhere.
set -euo pipefail
cd "$(dirname "$0")/.."

command -v ant >/dev/null || { echo "install the ant CLI first" >&2; exit 1; }
command -v jq >/dev/null || { echo "install jq first" >&2; exit 1; }

LOCK="${CLAUDE_LOCK:-./claude-lock.json}"
[ -f "$LOCK" ] || { echo "no claude-lock.json yet. Run ant apply first." >&2; exit 1; }

RULES_ID=$(jq -r '.resources["./memory_stores/rules.yaml"].id // empty' "$LOCK")
[ -n "$RULES_ID" ] || { echo "could not find the rules store id in $LOCK" >&2; exit 1; }

put() {
  ant beta:memory-stores:memories create \
    --memory-store-id "$RULES_ID" \
    --path "$1" \
    --content "$(cat "$2")" \
    --transform path -r
}

put /rules.md seed/rules.md
put /agency.json seed/agency.json
put /inbox/2026-10-08-leak.md seed/inbox/2026-10-08-leak.md

echo "seeded the rules store: 3 files"
