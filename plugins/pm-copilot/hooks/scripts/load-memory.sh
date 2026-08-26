#!/usr/bin/env bash
# PM Co-Pilot: SessionStart pointer.
# Deliberately light. It does NOT cat all memory into context (that would bloat
# every session). It points Claude at the routing brain and lists which memory
# files exist, so Claude loads the right ones on demand per the CLAUDE.md routing table.

set -euo pipefail

# Find a memory/ folder in the current working directory (where the user's CLAUDE.md lives).
MEM="./memory"

if [ ! -d "$MEM" ]; then
  echo "PM Co-Pilot: no memory/ folder found here yet. Run /pm-copilot:setup to create your routing brain and memory."
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
