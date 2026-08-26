---
description: Turn on the recurring PM Co-Pilot workflows as scheduled tasks (morning brief, weekly prep, open loops, self-improvement, biweekly memory refresh) at the times you chose in /setup. Idempotent and confirm-gated.
---

You are installing PM Co-Pilot's recurring workflows as scheduled tasks for the user. Read `memory/day-to-day.md` for their work week, timezone, and preferred times. Run `/pm-copilot:setup` first if that file doesn't exist yet.

This step is optional and reversible. Open by saying so: the user can skip scheduling entirely and just run any workflow by hand until they trust it, and they can pause or change any task later. If they'd rather wait, stop here and tell them how to run a workflow manually (name it, e.g. "run my morning brief").

## Rules
- Confirm the full plan before creating anything. Show each task with its schedule in plain language.
- Idempotent: list existing scheduled tasks first and skip any that already exist (by name). Never create duplicates.
- Each task's prompt simply invokes the matching skill and says to surface output in the session, never to message the user externally.
- Times come from the user's answers. Offer the defaults below; let them adjust per task or skip any task.

## The tasks to offer

| Task | Default schedule | What it runs |
|---|---|---|
| morning-brief | Each working day, at their morning-brief time | the `morning-brief` skill |
| weekly-prep | Start of their week, morning | the `weekly-prep` skill |
| open-loops | Twice a week (e.g. mid-week and end-of-week), afternoon | the `open-loops` skill |
| self-improvement | Once a week, afternoon | the `self-improvement` skill |
| memory-refresh | Every two weeks | run `sync`, then `consolidate` |

Translate their work week and timezone into the correct schedule for each (respect non-working days). For memory-refresh, the task prompt runs `sync` first, then `consolidate`, both propose-only.

## Flow
1. List existing scheduled tasks; note which of the above already exist.
2. Present the proposed plan (each task, its schedule, skip toggles) as an AskUserQuestion.
3. On confirmation, create each approved task with the scheduling tool: a clear description, the cron/schedule derived from their rhythm, and a prompt that invokes the skill and surfaces results in-session.
4. Confirm what was created and how to change or pause any of it later ("just say reschedule the morning brief", or re-run this command).
