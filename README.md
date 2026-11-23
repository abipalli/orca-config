# orca-config

Configuration for [Orca](https://github.com/stablyai/orca): bot charters and scheduled automations,
kept as plain files so they can be reviewed, versioned and swapped in or out.

```
bots/<name>/SOUL.md        what a bot is for, what it watches, what it may and may not do
automations/<name>.sh      one `orca automations create` call per file
install.sh                 creates every automation whose name does not exist yet
```

## Install

```sh
./install.sh                     # this repo's automations
./install.sh ~/private/orca      # plus any other directories of automation files
```

Extra directories can also be listed, one per line, in `~/.agents/orca-overlays`. That keeps
private or employer-specific automations in their own repos while this one stays generic.

`install.sh` never edits or removes an automation. To change one, edit the file, remove the
automation in Orca (`orca automations remove --id <id>`), and run `install.sh` again.

## Bots

Orca creates a bot only from its app (Bots sidebar → **New bot**) or from inside another bot's chat.
Create it with the name of its folder under `bots/` and paste its `SOUL.md`; then run `install.sh`
to add the bot's automations. Automations for a bot that does not exist yet are skipped.

## Automation files

Each file is a shell script that calls `orca automations create` once, with `--name` matching the
file name. `install.sh` reads the name from the file, so keep `--name` on its own line.

## Notes from use

- A Claude Code automation whose workspace is your home folder fails with `agent-trust-workspace`:
  Claude Code never remembers trust for `~`. Point the workspace at a trusted project folder.
- `--time` with a preset can land an hour off around daylight-saving changes; a cron trigger with
  `--timezone` is exact. Check `orca automations list` after creating one.

## Commits

Conventional Commits for every commit subject, branch and PR title: `<type>(<scope>): <description>`.

- `type` is one of `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`,
  `revert`. Use `docs`, never `doc`.
- `scope` is the bot, automation or area the change touches (`install`, a bot or automation name).
  Leave it out when the change spans several.
- The description is lower case and imperative, with no trailing period.
- Branches are `<type>/<short-kebab-slug>`. No agent attribution trailers or footers.
