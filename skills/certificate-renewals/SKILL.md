---
name: certificate-renewals
description: Flag fictional gas safety, EICR, and EPC dates that need a chase. Use when reading certificates in agency.json during the morning handover.
---

# Certificate renewals

Read certificate dates from agency.json only. Do not look them up on the web.

Chase windows, counted from today's date in Europe/London:

- Gas safety: chase at 30 days before expiry, and chase again if the date has passed.
- EICR, the Electrical Installation Condition Report: chase at 60 days before expiry, and if the date has passed.
- EPC, the Energy Performance Certificate: chase at 30 days before expiry, and if the date has passed.

One line per certificate inside its window: property, certificate name, expiry date, and how many days remain or how many days overdue. Hand the chase to the property manager. Do not book an engineer. Do not claim a certificate has been renewed unless agency.json says so.
