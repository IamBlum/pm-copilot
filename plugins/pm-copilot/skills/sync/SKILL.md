---
name: sync
description: Refresh your memory from your connected tools. Pulls new facts (new people, new recurring meetings, renamed priorities, new initiatives) from Calendar, chat, and your docs/tasks, and proposes surgical additions to your memory files. Never a wholesale rewrite. Backs up first, proposes a diff, writes only on your yes. Triggers on "/sync", "sync my memory", "refresh my context". Run it whenever your context has drifted, then run consolidate right after.
---

# Sync - Refresh Memory From Live Sources (safe mode)

Refresh the memory files with the latest context from the user's connected tools. This is deliberate and heavier than the passive `memory-keeper` capture; run it deliberately, not on every turn.

Memory lives in the `memory/` folder next to CLAUDE.md. Read `memory/day-to-day.md` for which tools are connected.

## Step 0 - Back up first (non-negotiable)
Before reading or writing anything, snapshot the memory folder so any bad edit is fully reversible.

```bash
MEMORY_DIR="<path to your memory folder>"
BACKUP="<path to your memory-backups folder>/$(date +%Y-%m-%d_%H%M%S)"
if [ -d "$MEMORY_DIR" ] && [ -n "$(ls -A "$MEMORY_DIR" 2>/dev/null)" ]; then
  mkdir -p "$BACKUP" && cp -R "$MEMORY_DIR/." "$BACKUP/" && echo "Backed up memory to $BACKUP"
else
  echo "Memory not found or empty - stop and check before syncing."
  exit 0
fi
```
If the backup fails, STOP. Do not proceed to any write. (`/setup` records the exact paths; substitute them here.)

## Step 1 - Pull fresh context (read-only)
Run in parallel; use only tools that are actually connected (`memory/day-to-day.md`):
- **Calendar (last ~30 days):** new recurring meetings, changed 1:1 cadence, new stakeholders, new domain keywords from new meeting titles.
- **Chat:** new channels the user is now in; any change to their title or role.
- **Docs / tasks store:** new roadmap docs, specs, goal updates, new initiative or priority names not already in memory.

## Step 2 - Propose a diff, do not write yet
For each memory file with genuinely new information, prepare a surgical change: the specific lines or sections to add or update, nothing else. Present a preview:

```
Proposed memory updates:
• scope.md       → ADD: <new initiative line>
• colleagues.md  → UPDATE: <person X now appears weekly>
• day-to-day.md  → ADD: <new channel>
(role.md - no change)
```

## Step 3 - Write only what's confirmed
Apply only the lines the user approves, surgically (never rewrite a whole file). Add a dated changelog line to each changed file. Keep the backup. Confirm what was written in this session.

## Guardrails
- Additive and surgical only. Never wholesale-rewrite a memory file.
- Propose-only. No memory write without the user's yes.
- If a source is unreachable, note it and continue; do not guess.
