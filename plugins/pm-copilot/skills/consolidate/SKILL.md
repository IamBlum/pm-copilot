---
name: consolidate
description: A reflective cleanup pass over your memory files (no external fetch). Merges duplicates, retires stale entries, sharpens durable facts, and fixes the index so a future session orients fast. Backs up first, proposes changes, writes only on your yes. Triggers on "consolidate my memory", "clean up my memory". Run it right after sync, or whenever your memory needs a cleanup.
---

# Consolidate - Memory Hygiene (safe mode)

A reflective pass over what the co-pilot has learned about the user and their work. Goal: a future session should orient quickly (who they work with, what they're focused on, how they like things done) without re-asking. This reads and restructures the memory folder only; it does not fetch from external tools (that's `sync`, which normally runs just before this).

Memory lives in the `memory/` folder next to CLAUDE.md.

## Step 0 - Back up first (non-negotiable)
Snapshot the memory folder before any edit, same pattern as `sync`. If the backup fails, STOP.

## Phase 1 - Take stock
- List the memory folder and read the index in CLAUDE.md's routing table.
- Skim each file. Note which overlap, which look stale, which are thin.

## Phase 2 - Plan the consolidation (propose-only)
Separate the durable from the dated:
- **Durable** (preferences, working style, key relationships, recurring workflows, standing initiatives): keep and sharpen.
- **Dated** (a finished project, a passed deadline, a one-off): retire the file, or fold the lasting takeaway (for example "prefers X format for launch docs") into a durable file, then drop the rest.

Prepare specific proposed changes:
- Merge duplicate facts into one canonical location.
- Fix anything stale or contradicted (prefer the newest confirmed fact; flag genuine conflicts for the user rather than guessing).
- Tighten wording so each file is scannable.
- Update the routing table in CLAUDE.md if files were added, merged, or retired.

Present the plan as a short list: merge / retire / rewrite / reindex, one line each.

## Phase 3 - Apply only what's confirmed
Apply the approved changes. Add a dated changelog line to each affected file. Keep the backup. Confirm what changed in this session.

## Guardrails
- Propose-only. No write without the user's yes.
- Never delete a file outright; retire by folding forward the durable takeaway first.
- When two facts conflict and you can't tell which is current, ask; do not silently pick one.
