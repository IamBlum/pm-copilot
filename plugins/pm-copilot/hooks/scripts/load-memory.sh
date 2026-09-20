#!/usr/bin/env bash
# PM Co-Pilot: SessionStart pointer.
# Deliberately light. It does NOT cat all memory into context (that would bloat
# every session). It points Claude at the routing brain, lists which memory
# files exist, and (once) announces a version update so the user learns what's new.

set -euo pipefail

# Plugin package root, derived from this script's location (hooks/scripts/ -> ../..).
# Robust whether or not CLAUDE_PLUGIN_ROOT is exported into the hook environment.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." 2>/dev/null && pwd || true)"

# Find a memory/ folder in the current working directory (where the user's CLAUDE.md lives).
MEM="./memory"

if [ ! -d "$MEM" ]; then
  cat <<'EOF'
PM Co-Pilot is installed here but not set up yet (no memory/ folder in this workspace).

INSTRUCTION FOR CLAUDE (backstop, optional): Answer the user's message normally first. If their message is a request to start (for example "set me up", "get started", "set up pm co-pilot"), run the setup flow (the get-started skill, same as /pm-copilot:setup). Otherwise, after answering, add ONE short line letting them know PM Co-Pilot is not set up in this folder yet and they can start anytime by saying "set me up" (about five minutes, skippable). Keep it to one line, no emoji, no em-dashes, and do not repeat it every turn.
EOF
  exit 0
fi

echo "PM Co-Pilot active. Read ./CLAUDE.md, then load the relevant memory files on demand per its routing table."
echo "Available memory files:"
ls -1 "$MEM"/*.md 2>/dev/null | sed 's#^# - #' || echo " (none yet)"
if [ -d "$MEM/topics" ]; then
  echo "Topic files:"
  ls -1 "$MEM"/topics/*.md 2>/dev/null | sed 's#^#   - #' || true
fi

# --- What's new: announce a version change once ---
# Current installed version, parsed from the plugin manifest (no jq dependency).
NEWVER=""
if [ -n "$ROOT" ] && [ -f "$ROOT/.claude-plugin/plugin.json" ]; then
  NEWVER="$(grep -m1 '"version"' "$ROOT/.claude-plugin/plugin.json" 2>/dev/null | sed -E 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/' || true)"
fi

MARK="$MEM/.pmc-version"
if [ -n "$NEWVER" ]; then
  if [ -f "$MARK" ]; then
    OLDVER="$(cat "$MARK" 2>/dev/null || true)"
    if [ -n "$OLDVER" ] && [ "$OLDVER" != "$NEWVER" ]; then
      echo ""
      echo "INSTRUCTION FOR CLAUDE: PM Co-Pilot was updated from $OLDVER to $NEWVER since this user last used it here. Once this session, before or after handling their message, tell them in a short, friendly line or two that it updated and what changed, based on the notes below. Keep it plain, no emoji, no em-dashes, and do not repeat it in later turns."
      if [ -n "$ROOT" ] && [ -f "$ROOT/CHANGELOG.md" ]; then
        echo "--- what's new in $NEWVER ---"
        awk '/^## /{c++} c==1{print} c==2{exit}' "$ROOT/CHANGELOG.md" 2>/dev/null || true
      fi
      printf '%s' "$NEWVER" > "$MARK" 2>/dev/null || true
    fi
  else
    # No marker yet: set the baseline silently so we never show a false "updated"
    # message (this covers both a fresh setup and a first run of this feature).
    printf '%s' "$NEWVER" > "$MARK" 2>/dev/null || true
  fi
fi

exit 0
