#!/bin/sh
# Create each automation in automations/ (and in any extra directory) whose name Orca doesn't have yet.
set -eu
here="$(cd "$(dirname "$0")" && pwd)"
dirs="$here/automations $*"
[ -f "$HOME/.agents/orca-overlays" ] && dirs="$dirs $(grep -v '^#' "$HOME/.agents/orca-overlays" | sed "s#^~#$HOME#")"

existing="$(orca automations list --json | python3 -c 'import json,sys; d=json.load(sys.stdin); r=d.get("result",d); a=r.get("automations",r) if isinstance(r,dict) else r; print("\n".join(x["name"] for x in a))')"
bots="$(orca bot list 2>/dev/null || true)"

for dir in $dirs; do
    for f in "$dir"/*.sh; do
        [ -e "$f" ] || continue
        name="$(sed -n 's/^ *--name "\(.*\)" *\\$/\1/p' "$f" | head -1)"
        bot="$(sed -n 's/^ *--bot \([^ ]*\) *\\$/\1/p' "$f" | head -1)"
        if [ -z "$name" ]; then echo "  skip $f: no --name line"; continue; fi
        if printf '%s\n' "$existing" | grep -qxF "$name"; then echo "  ok    $name"; continue; fi
        if [ -n "$bot" ] && ! printf '%s\n' "$bots" | grep -q "$bot"; then
            echo "  wait  $name (create bot '$bot' in Orca first)"; continue
        fi
        sh "$f" >/dev/null && echo "  added $name"
    done
done
