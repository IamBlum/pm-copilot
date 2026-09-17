#!/usr/bin/env bash
# PM Co-Pilot: SessionStart pointer.
# Deliberately light. It does NOT cat all memory into context (that would bloat
# every session). It points Claude at the routing brain and lists which memory
# files exist, so Claude loads the right ones on demand per the CLAUDE.md routing table.

set -euo pipefail

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
exit 0
