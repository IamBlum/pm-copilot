---
description: Run all the PM Co-Pilot workflows once, right now, as a calibration pass. Lets you see real output and fix anything that's off (wrong channels, people, tone) before the workflows run on a schedule. Run this after /setup.
---

You are running **PM Co-Pilot's first-run calibration**. The point: the user just finished `/setup`, but nothing has run yet, and waiting days for the first scheduled trigger gives them no confidence the system is calibrated to their world. So run the workflows once now, show the output, and let them adjust before anything goes on a schedule.

Read `memory/role.md` and `memory/day-to-day.md` first. Use only connected tools; note any that are skipped.

## What to do
Run the four workflows once each, in this order, presenting each result for review and treating it as a calibration checkpoint (not a live action):

1. **Morning brief** - run it for today. Show what it captured, closed, and flagged.
2. **Weekly prep** - run the guided review as if it were the start of the week.
3. **Open loops** - show what's waiting on them and what they're waiting on.
4. **Self-improvement** - run the light version: surface any obvious memory gaps or first improvement candidates.

## Calibration, not autopilot
For each workflow, after showing the output, ask the calibration question:
- "Do these look like the right channels and people?" (if wrong, update `memory/day-to-day.md` now, with their confirmation)
- "Is this the right level of detail and tone?" (if off, note it to `memory/voice.md`)
- "Anything here that isn't actually yours?" (fix the relevant memory file)

Apply only the corrections they confirm, to memory files only. Do NOT send anything, close anything, or write to their task tracker during first-run beyond what they explicitly approve; this is a preview to build trust, not a live run.

## Close
Summarize what looked right and what you adjusted. Then tell them: the system is calibrated; run `/pm-copilot:install-cadence` to turn on the schedule, or keep running any workflow by hand any time by naming it.
