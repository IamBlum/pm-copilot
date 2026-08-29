---
name: open-loops
description: Your open-loops digest. Finds threads waiting on someone else (you sent the last message and got no reply) and unfinished work from your recent sessions, ranks them, and surfaces them for triage. Run it in a new chat whenever you want.
---

## GUIDED DELIVERY - one part at a time (always)
Do not present both sections in one dump. Show Section A (Waiting on others) as its own turn led by a one-line intro and let the user triage it, then Section B (Waiting on you) as its own turn. Keep each ranked list bulleted.

## FORMATTING - lists, never paragraphs (always)
Whenever you present more than one item, render them as a bulleted or numbered list, one item per line. Never pack multiple items into a run-on paragraph. A single item may be a sentence; two or more are always a list.

---

You are running the user's **Open Loops** digest. Read `memory/role.md` and `memory/day-to-day.md` first for their chat tool, priority channels, VIPs, work week, and timezone. Find the two kinds of open loop and surface them as one ranked digest in this session for triage. Never message the user externally, never post on their behalf. Concise, no em-dashes.

## SECTION A - Waiting on others (chat)
Find threads in the user's chat tool where the user sent the last message with a question, request, or mention and no one has responded.
- What counts as waiting: the user's message is most recent; it contained a question/request/mention; 24+ hours passed and it isn't clearly resolved; when in doubt, flag it.
- Search a ~21-day window across the user's priority channels and key DMs (from `memory/day-to-day.md`), plus any currently active channels. Use the chat tool's search for "messages from the user that end a thread with a question."
- Verify: read each candidate thread. Discard only if someone replied after the user, or the user explicitly closed it.
- Rank: HIGH (senior leadership, explicit deadline, 5+ days, or blocking a deliverable); MEDIUM (cross-functional, 2 to 5 days); LOW (exploratory, under 2 days, no blocker).

## SECTION B - Waiting on you (recent sessions)
Find sessions from the past 7 days with unfinished work. List recent sessions, filter to activity within 7 days, exclude the current one. For each, read the transcript and look for: open todos (a task left pending or in-progress is the strongest signal); uncommitted next steps ("I'll do X next", "want me to also", "ready when you are" with no follow-up); mid-flight stops. Exclude sessions that ended clean, trivial Q&A, or where the user said done. Capture: session ID, one-line topic, last activity (relative), up to 3 open todos or the last proposed step.

## OUTPUT - one part at a time (Section A, then Section B)
```
Open Loops - [date]

Waiting on others ([N])
🔴 #channel - X days · your ask: "[snippet]" · waiting on @person
🟡 ...
🟢 ...

Waiting on you ([N])
1. [topic] - [last activity] · open: [todos, max 3]
2. ...
```
Show top 5 per section if many. Empty section: "nothing waiting". Both empty: "No open loops. You're clear."

Then offer triage:
- Section A per thread: `nudge` (draft a follow-up in the user's voice for them to review and send), `track` (create a board task with a "done when" and "check by" so the loop persists), `snooze`, or `drop`.
- Section B per thread: `continue` (pull it back, surface the todos, be ready to do the work), `track` (create a board task capturing the unfinished work), `done`, `snooze`, or `archive`.

`track` is the bridge from an ephemeral loop to a tracked task: it becomes a board row (Inbox or This Week per the user's choice) with a "done when" and "check by" so the morning brief's close-check picks it up. Never auto-create these; only on a `track` instruction. The board is named in `memory/day-to-day.md`.

Wait for the user's reply, then act on each. Do not pre-summarize or editorialize before they triage. Nothing sent or closed on their behalf.
