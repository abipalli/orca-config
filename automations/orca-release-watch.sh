#!/bin/sh
# Daily: digest a new Orca release, only when one shipped since the last digest.
orca automations create \
  --name "Orca release watch" \
  --bot orca-onboarding \
  --trigger "0 8 * * *" --timezone "${ORCA_TZ:-America/Los_Angeles}" \
  --precheck 'test "$(gh release view -R stablyai/orca --json tagName -q .tagName)" != "$(cat ~/.orca/bots/orca-onboarding/last-release 2>/dev/null)"' \
  --prompt "A new Orca release shipped. Digest it per your SOUL.md: what changed, what in my setup it affects, ranked proposals. Then write the release tag to ~/.orca/bots/orca-onboarding/last-release."
