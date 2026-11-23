#!/bin/sh
# Mondays: full audit of the setup against the installed Orca, including last week's automation runs.
orca automations create \
  --name "Orca weekly audit" \
  --bot orca-onboarding \
  --trigger "0 9 * * 1" --timezone "${ORCA_TZ:-America/Los_Angeles}" \
  --prompt "Weekly audit per your SOUL.md: compare my skills, rules, automations, handoffs, schedulers and last week's requests with the installed Orca and upstream changes; list failed or skipped automation runs from the past 7 days; give ranked proposals."
