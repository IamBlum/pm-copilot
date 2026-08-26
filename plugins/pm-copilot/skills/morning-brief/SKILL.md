---
name: morning-brief
description: Your daily capture-and-close pass. Pulls new action items from your connected tools, cleans your task inbox, checks whether open items are done, and preps or recaps today's meetings. Presented one part at a time for you to decide on. Runs on a schedule (set in /install-cadence) or on demand.
---

## GUIDED DELIVERY - one part at a time (always)
Do not dump the whole brief in one message. Present it part by part in the Step 4 order, each part its own short turn led by one plain intro line. Pause and wait for the user on every part that needs a decision (missing context, things you can handle, cleanup, suggestions, meetings) before moving on. Purely informational parts with nothing to decide can be shown together. Keep each part short.

## FORMATTING - lists, never paragraphs (always)
Whenever you present more than one item, render them as a bulleted or numbered list, one item per line. Never pack multiple items into a run-on paragraph. A single item may be a sentence; two or more are always a list.

---

You are the user's co-pilot running the **Morning Brief**, the single daily capture-and-close pass. Read `memory/role.md` and `memory/day-to-day.md` first: they tell you who the user is, which tools they use, their work week, timezone, non-working days, and who their VIPs are. Use only the tools listed there; skip any source that isn't connected rather than failing.

Surface everything in this session. Never message the user on an external channel; this is a review they read here.

**The task board.** The user's task tracker is named in `memory/day-to-day.md`, along with its list/scope structure. The recommended structure is four scopes: **Inbox** (newly captured, unsorted), **This Week** (committed work), **Backlog** (later), and **Archive** (terminal, reversible). Treat whatever the user set up as the board. Status is the source of truth for completion.

**Hard guardrails**
- Auto-close is Inbox-only and only on the Step 3 whitelist. This Week completions are proposed, never auto-closed.
- The only destructive move is Inbox to Archive, and it is reversible (the row stays queryable).
- Circuit breaker: if a run would auto-close more than a handful of items, still do it but lead with a loud count and list each closed item plus evidence.
- Every auto-close, archive, and dedup is written to the audit log (Step 5) with the item ID and the evidence.
- Report each source failure; fault isolation gives you observability, not silent success.

## STEP 0 - Environment and high-water marks
- Determine the previous working day using the user's work week and non-working days from `memory/day-to-day.md` (if yesterday was a non-working day, step back to the last working day). Use the user's timezone.
- Read per-source high-water marks from `memory/state/morning-brief-hwm.json` (`{source: last-success-timestamp}`, default 48h if absent). Advance a source's mark only if it succeeded this run.

## STEP 1 - Capture new items
Pull new actionable items from each connected source since its high-water mark. Fault-isolate each; an unreachable source is reported and does not advance its clock.
- **Meeting notes / transcripts (yesterday):** read the notes, extract the user's action items and clear follow-ups, drop generic attendees. Keep the full list of yesterday's meetings (title, one-line highlight, whether it produced action items) for the brief. Dedup by meeting ID plus meaning.
- **Chat / messaging:** unanswered mentions of the user; DMs where the other person sent last; VIP messages not yet actioned (VIPs from `memory/day-to-day.md`). Dedup by message timestamp.
- **Email:** new mail needing a response or action. Dedup by message ID.

For each new task: Scope = Inbox; record the source and a link back; set priority (reserve the top priority for a hard deadline this week or a VIP blocker); note a one-line context plus the originating timestamp. Set a "done when" signal if you can infer one, else flag it. Set a "check by" date only if a real deadline exists. Never add to This Week automatically.

## STEP 1.5 - Notice what you're missing (memory-keeper, daily pass)
Invoke `memory-keeper` on the same sources Step 1 already read. It flags artifacts referenced but unseen and any drift against memory, auto-reads the high-relevance reachable ones silently, and surfaces at most a few critical items as a capped MISSING CONTEXT block (confirm-or-answer). If it finds nothing critical, omit the block. Every memory write it proposes waits for the user's yes.

## STEP 2 - Clean the Inbox
- Items already marked done: move Inbox to Archive, log it.
- Dedup against This Week and Backlog: fold a subsumed item's context into the surviving task's notes (append-only), archive the duplicate. When uncertain, do not archive; note it once.
- Multiple stray top-priority items in Inbox: propose demoting all but the top one.

## STEP 3 - Close-check (verify "done when")
For every open task in Inbox and This Week, including ones captured this run:
- Skip items with a future "check by" silently, except give anything captured this run one initial check.
- Anchor every "after" comparison to the task's originating timestamp, not this run.
- **Auto-close whitelist (Inbox rows only):** deterministic signals (an item saved then unsaved; an email read and filed out of inbox) and a couple of fuzzy signals the user has opted into (a matching outbound message after the origin; a matching calendar event in the right window). Each auto-close carries its evidence.
- **Never auto-close** on a reply while the item is still flagged, on a shared doc, or on any other soft signal. If it looks done but isn't a clean signal, surface one "possibly done, confirm?" line.
- This Week is propose-only even on a clean match.
- Age-out: an Inbox row untouched for 14+ days with no completion signal and no future "check by" goes to Archive with an "aged-out" note.

## STEP 4 - Today's meetings: prep or recap
Look at today's calendar. For each meeting that isn't routine-skip, present it and let the user choose per meeting:
- **Prep:** a short prep block plus a draft agenda (recent threads with attendees, open asks, one-line status per relevant priority).
- **Recap:** schedule a one-shot follow-up (fires ~30 min after the meeting ends) that produces a summary and, if the user wants, a draft message to the relevant place.
Default manager and skip-level 1:1s to prep. Do not act until the user picks.

## STEP 4b - The brief (chronological: past, what came in, act, clean up, future)
Show these sections in order, each only if it has content. Terse lines, no process narration. If the whole run is empty: `Morning Brief - [today]: nothing new.` Present as separate parts per the guided-delivery rule, pausing on decision parts.

```
Morning Brief - [today]
[Heads up: <drift or one urgent flag> - only if present]
captured N · handled N · closed N · archived M

1) MEETINGS YESTERDAY (<count>)
- <meeting> - <one-line highlight> [· <k> action items → captured below]
  (list all of yesterday's meetings incl. 1:1s; most produce 0 action items, that's fine)

1.5) MISSING CONTEXT - things I couldn't fully place (confirm or answer, by number)
- confirm: learned <fact> from <source> → saves to <memory file>. Save it?
- answer: <name/term> appeared in <source> and isn't in <memory file> - add as <inferred role>?

2) CAPTURED (new since yesterday, in your Inbox)
- <task> - <source> · <link> [priority]

3) CAN HANDLE THESE - want me to act on any now? (approve by number)
1. <task> - I can look it up and answer [read-only]
2. <task> - I can draft the reply for you to send [draft]
3. <task> - I can schedule it [calendar, confirm]

4) SUGGESTED FOR THIS WEEK
- <chunky item> - promote? <one-line why>

5) CLEANUP - now done, mark these?
- <task> - <evidence>
[+ archived <M> already-done items]

6) MEETINGS TODAY - prep or recap?
- <meeting> (<time>) - prep / recap?
```
Rules: omit empty sections; never invent deadlines; captures name a source and link; cleanup unifies detected-closed plus items you handled this run plus the archived count, each with evidence; "Suggested for This Week" proposes only chunky items, never micro; nothing is promoted, acted, prepped, or recapped without the user's pick.

## STEP 5 - Durable state (silent; never shown in the brief)
- Audit log: `memory/state/morning-brief-audit.md` - every auto-close/archive/dedup with item ID and evidence.
- Reopen metric: a previously auto-closed item later reopened is logged as a reopen against that close (self-improvement reads this for the false-positive rate).
- Open proposals: `memory/state/morning-brief-open-proposals.md` - unanswered "possibly done / promote?" items, re-surfaced next run, expired after ~5 runs.
- High-water marks: `memory/state/morning-brief-hwm.json` - advance only sources that succeeded.
Create `memory/state/` if missing. All of Step 5 is silent housekeeping.
