---
name: Harbour morning handover
agent: ../agents/letty.md
environment_id: ../environments/letty.yaml
schedule:
  type: cron
  expression: "32 7 * * 1-5"
  timezone: Europe/London
vault_ids: []
resources:
  - path: ../memory_stores/rules.yaml
    access: read_only
    instructions: Agency rules and agency.json. Re-read them every run. Never write here.
  - path: ../memory_stores/records.yaml
    access: read_write
    instructions: Your state. Bookmarks, ledger, handover, drafts, handoffs, and run records.
budget:
  type: limit
  max_list_cost:
    amount: "200"
    currency: USD
---

Write this morning's handover for Harbour Lettings.
The team's time zone is Europe/London. Work out every date in that zone.
Follow your run steps in order. Today's edition is titled "Harbour handover, <weekday> <day> <month>".
Do not contact anyone. Drafts wait for the named colleague.
