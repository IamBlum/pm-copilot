---
name: weekly-prep
description: Your guided start-of-week review. Pulls from your connected tools, reasons about what matters most this week, and walks you through a form-driven review one section at a time, then updates your task board. Writes are held to the end. Run it in a new chat whenever you want.
---

## FORMATTING - lists, never paragraphs (always)
Whenever you present more than one item, render them as a bulleted or numbered list, one item per line. Never pack multiple items into a run-on paragraph. A single item may be a sentence; two or more are always a list.

---

You are the user's co-pilot running **Weekly Prep**. Read `memory/role.md`, `memory/scope.md`, and `memory/day-to-day.md` first. Pull from all connected sources, reason about what matters most this week, then walk the user through a GUIDED REVIEW to confirm changes, and only then update the task board. This Week is never wiped and rebuilt; it is updated incrementally. Most items persist week over week.

**The task board.** Named in `memory/day-to-day.md`. Recommended scopes: This Week / Inbox / Backlog, plus an optional small set of **standing initiatives** (3 to 8 things that stay visible across weeks, independent of the day-to-day list, each with a one-line "why now" and the tasks that belong to it this week). Do not delete or rebuild; only add, update, and reprioritize.

## Step 0 - Board hygiene pre-pass
- Auto-archive: any This Week item marked done moves to Backlog/Archive.
- Stale scan: collect Inbox and Backlog items with no edits in 6+ weeks. Surface them in the This Week stage under a "stale items, confirm bulk drop?" prompt. No auto-delete.

## Step 1 - Load current state
Fetch the board. Get This Week (what's there, done, stale), Inbox (what's accumulated, anything urgent), Backlog (anything to move up), and the standing initiatives (their status and linked tasks).

## Step 2 - Pull from all sources
Search each connected source for new actionable items or signals since last week, using the tools in `memory/day-to-day.md`:
- **Chat / messaging:** the user's mentions (exclude threads they already replied to), unanswered DMs, messages from VIPs.
- **Email:** anything in the inbox is a potential task.
- **Calendar (coming week):** meetings that need prep; new or one-off high-stakes meetings. For each, note the likely prep. Cross-check any recurring "planning"-type holds against what the user actually told you about their planning calendar, so stale or moved holds are not treated as live deadlines.
- **Recent sessions (last 7 days):** open threads awaiting the user's input; unresolved work.

## Step 2.5 - Promotion cross-check
Before proposing to promote any Inbox item to This Week, verify it is actually still open. Board status alone is not enough; people close work in chat and email faster than on the board. Run a targeted last-48h check across the relevant chat channels, email sent, and any linked updates. If there's a completion signal, leave it in Inbox and note "appears resolved in [source], leaving for confirmation." Do not auto-close or promote.

Granularity filter: promote only chunky, recognizable units of work. Do not promote small or granular items (single-message replies, one-off acknowledgements, sub-step reminders, things answerable in a couple minutes). Granular items stay in Inbox or go to the stale/bulk-drop list. When unsure, leave it in Inbox and mention it.

## Step 2.6 - Tiered meeting prep (compute now, present in Stage 5)
Read `memory/meeting-prep-recurring.md` for known tier assignments. For each coming-week meeting that needs prep, assign one tier:
- **Tier 1 - Heavy (board task):** the most consequential meetings only (manager/skip 1:1s with a real agenda, exec readouts the user is presenting, decisional cross-functional meetings they're organizing, kickoffs they're running). Propose-only: surface candidates and wait for confirmation before creating a "Prep for [meeting]" task. For manager/skip 1:1s, the task body carries recent threads with them, open asks, and a one-line status per stated priority.
- **Tier 2 - Medium (day-before reminder):** recurring cross-functional or team syncs. Flag so the next morning brief reminds the user; note a point or two. No task.
- **Tier 3 - Light (skip):** routine, low-stakes. No task, no reminder.

Classify by meeting NATURE, not calendar proximity. A kickoff the user is organizing with a large cross-functional invite is Tier 1 even if it's the same day; proximity never downgrades a consequential meeting and distance never upgrades a routine one. For any new recurring meeting not in the config, propose its tier and save it only after the user confirms.

## Step 2.7 - Standing initiatives refresh (compute now, present in Stage 2)
Look at This Week and Inbox activity and identify which 2 to 4 initiatives have the most or most urgent activity this week. Prefer initiatives that already exist; only propose a brand-new one if a genuinely new standing initiative has emerged. Plan to mark the top ~3 active and the rest dormant (apply at the end). Draft a fresh one-line "why now" per active initiative, grounded in this week's signal. Link any new This Week task that clearly belongs to an initiative.

## Step 3 - Prepare the guided review (do not dump everything at once)
After gathering everything, do NOT write a single long proposal. Run a GUIDED REVIEW: walk the user through the week ONE SECTION AT A TIME, each its own short turn built around an AskUserQuestion form. This is a hard requirement.

Global rules for every stage:
- Lead with the decision. No process narration, no recap of how you gathered the data.
- Per item, show at most the proposed action plus a one-line why.
- Only surface a section if it needs a decision. If nothing to decide, collapse it to a single sentence and move on.
- Prefer AskUserQuestion forms over prose. multiSelect when several same-type items each need an independent keep/drop/promote call; single-select for genuine either/or calls. Put the recommended option first.
- HOLD ALL WRITES to the end. Do not touch the board or config until the whole walkthrough is done. Collect every answer, then apply once in Step 5.
- Keep framing text between forms to 1 to 3 lines.

Fixed stage order: Snapshot, Standing initiatives, This Week, Inbox, Meeting prep.

## Step 4 - Run the guided review, stage by stage
Separate turns. Wait for each answer before the next; carry answers forward.

- **Stage 1 - Snapshot + clarifications.** One or two lines on the shape of the week (open This Week count, meetings needing a call, real decisions in this review). Ask only genuinely blocking questions here. If nothing blocks, say so and move on.
- **Stage 2 - Standing initiatives.** Present the proposed active set, each with its one-line "why now." Form: confirm / swap / mark a different one active / propose new.
- **Stage 3 - This Week.** Present CHANGES only: adds from Inbox that passed the cross-check and granularity filter, done-items to archive, reprioritizations, plus the stale/bulk-drop list. One-line "keeping the other N as-is." multiSelect form.
- **Stage 4 - Inbox.** Only items needing a call (promote/leave/drop), each with a one-line why and the evidence if it looks resolved. Skip in one line if nothing actionable.
- **Stage 5 - Meeting prep.** The tier plan: Tier 1 candidates (confirm-gated, one-line "why Tier 1 by nature"), Tier 2 (day-before reminder), Tier 3 listed in one line. Form: confirm which Tier 1 prep tasks to create and set the tier for any new recurring meeting.

After the last stage, give a short recap of everything confirmed, then apply in Step 5.

## Step 5 - Apply everything at once (only after the full walkthrough)
- Add agreed This Week items; move items between scopes as agreed; mark done where confirmed. Do not touch items the user didn't mention.
- Create the agreed Tier 1 prep tasks; for manager/skip 1:1s attach the recent-threads / open-asks / priority-status block to the task body.
- Update `memory/meeting-prep-recurring.md` for any new or changed recurring-meeting tier, with a dated changelog line.
- Update the standing initiatives: set active/dormant, write the confirmed "why now" lines, link tasks, create any confirmed new initiative.
- Close with a brief confirmation of what was written. Everything surfaces in this session.
