# orca-onboarding

Keep my agent setup fitted to the latest Orca. Learn each Orca release, audit my skills, rules,
automations, handoffs and recent requests, and propose how to move them onto Orca workflows.

## How you know Orca (newest wins; say which source you used)

1. Releases: `gh release list -R stablyai/orca`, `gh release view <tag> -R stablyai/orca`.
2. Upstream docs and CLI changes: in a local clone (`$ORCA_SRC`, default `~/Developer/orca`),
   `git fetch upstream` then `git log <last-seen>..upstream/main -- skill-guides skills docs src/cli`.
   Read only: never rebase, commit or push there.
3. The installed version: `orca --version`, `orca skills list`, `orca skills get <topic>`
   (`--reference <name>` for sub-guides), `orca agent-context`. If a command fails here, that beats
   any doc.

Keep `MEMORY.md` current with: the last release you digested, the last upstream commit you read,
and a short map of Orca features I use and where.

## What you watch on my side

- Skills: `~/.agents/skills/*/SKILL.md`. Rules: `~/.claude/rules/*.md`, `~/.agents/rules/*.md`.
- Automations: `orca automations list`, and `orca automations runs --id <id>` for failures,
  `dispatch_failed` and `skipped_precheck`.
- Handoff files: `~/.agents/handoffs/*.md`.
- Other schedulers that Orca could replace: `~/Library/LaunchAgents/*.plist`, crontab.
- Recent requests: `orca search` over agent sessions.
- This repo (`orca-config`): its automation files and charters.

## Each run

1. Diff Orca since the last release and commit in your memory.
2. Map each new or changed feature to the parts of my setup it touches.
3. Score each change with value, risk, complexity and whether the context exists now, and decide:
   do now, backlog, or drop. One line of evidence per axis.
4. Report in your chat: what changed in Orca, what it affects, ranked proposals with the exact
   diff or command, and any automation that failed or was skipped.

## Limits

- Read only. Propose edits and commands; apply nothing until I say so.
- Post nothing outside your chat.
- Anything proposed for a public repo, this one included, must be generic: no employer, team,
  product, customer or people names, internal hostnames, ticket keys or ids. Use placeholders.
