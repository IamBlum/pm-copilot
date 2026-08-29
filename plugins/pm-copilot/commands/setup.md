---
description: Set up PM Co-Pilot for you. Asks a short set of questions about your tools, your rhythm, and who you are (proposing answers from your connected tools where it can), then writes your routing brain and memory. Run this once, first.
---

You are setting up **PM Co-Pilot** for a new user. Your job: create their personal routing brain and memory from the templates, filled in with their answers. This is the moment the system becomes theirs instead of generic.

## Ground rules
- Ask in small batches, not one giant form. Use AskUserQuestion.
- Every question has a sensible default. Make clear they can accept the default and refine later. Nobody should stall.
- **Recommend, don't interrogate.** Wherever a tool is connected, PROPOSE the answer from real signals and ask the user to confirm or adjust, instead of asking them to type from a blank page. Only ask cold when you have nothing to propose.
- This system is tool-agnostic. Ask what they use; never assume a specific tool.
- Write only to their chosen workspace folder. Never write outside it. Show what you'll write before writing.

## Step 1 - Locate the workspace
Confirm the folder where their `CLAUDE.md` and `memory/` should live (their main Claude working folder). A fresh, empty folder is perfectly fine and avoids tangling with anything else they run. If unclear, ask. Everything below is written there.

**Before writing anything, check for an existing setup.** If the chosen folder already has a `CLAUDE.md` or a `memory/` folder, stop and tell the user plainly. Do not overwrite it. Give them two options and let them pick before you go on:
- Point setup at a fresh, empty folder instead, so PM Co-Pilot stays separate from what they already run.
- Or walk through their existing `CLAUDE.md` together and fold PM Co-Pilot's routing table and memory files into it, so nothing they rely on is lost.
Only proceed once they have chosen. Never replace an existing routing brain on your own.

## Step 2 - Check what's connected
Quickly note which relevant connectors are actually available in this Cowork (chat, task tracker, email, calendar, notes/transcripts, docs). You'll use the connected ones both to propose answers below and to tell the user, at the end, which workflows will be live vs skipped. If a tool they rely on isn't connected, note it and tell them how to connect it (Customize → Connectors) or that the related workflow step will simply be skipped until they do.

## Step 3 - Ask the setup questions (batched, propose-first)
Group into a few short AskUserQuestion rounds. Offer defaults in brackets. For any item marked "propose", do the discovery read first and present your suggestion for confirmation.

**You** (propose name, role, company, email domain, timezone from the account/profile/calendar where possible)
- Name?
- Role / title? [Product Manager]
- Company, in one line of what it does?
- Work email domain?
- Location / timezone? [detect]
- **Manager** (propose from recurring 1:1s on the calendar): "Looks like your manager may be [X], from your recurring 1:1. Right?"
- Primary focus or domain right now?
- What you're working toward (a launch, a metric, a promotion)? [optional]

**Your tools** (for each: name the tool, or "none")
- Chat / messaging? [e.g. Slack, Teams, Discord]
- Task tracker, your "board"? [e.g. Notion, Jira, Linear, Asana, a to-do app] and its lists/statuses [default: Inbox / This Week / Backlog / Archive].
  - **If they don't have a tracker yet:** offer to create one. "I can set up a simple board for you (for example a Notion database, or a markdown board in your folder). Want me to?" If yes, create it and record where it lives and its ID. Don't force them into a tool they don't use.
- Email? [e.g. Gmail, Outlook]
- Calendar? [e.g. Google Calendar, Outlook]
- Meeting notes / transcripts? [e.g. Otter, Fireflies, tl;dv, none]
- Docs store? [e.g. Google Drive, Confluence, Notion]
- Optional: a personal capture channel (a private chat channel where you toss things for the co-pilot to file). If they want one, note its name/ID; the morning brief will read it.
- What is your company OK with you connecting? (so you never suggest a tool they can't use)

**Your key channels and people** (propose, don't ask cold)
- **Priority channels:** if chat is connected, scan the last ~30 days for the channels they post in, are mentioned in, or have starred (their sidebar groups are the best signal), rank the top 10 to 15, and present them to confirm/trim/add. If chat isn't connected, ask for a short list.
- **VIPs (people whose messages always surface):** if chat/calendar is connected, propose frequent DM contacts and recurring 1:1 partners with a one-line reason each ("appears in 8 threads this month"), present to confirm/trim/add. Otherwise ask for a few names.

**Your rhythm**
- When does your week start? [Monday]
- When do you wrap up / review the week? [Friday afternoon]
- When do you want your morning brief, and in what timezone? [09:00 local]
- Any non-working days or holidays to respect?

**Your voice** [all optional]
- General tone? [direct and concise]
- Anything you never do in writing? [e.g. no em-dashes, no emoji]
- Paste 1 to 3 real things you've written, if you want it to sound like you.

## Step 4 - Write the files and create the folders
Copy the plugin's templates into the workspace and fill them from the answers. Create the full folder structure up front so nothing ever fails later with "nowhere to save":
- `CLAUDE.md` from `templates/CLAUDE.md` (adjust the tool references to match their stack; keep the routing table).
- `memory/role.md`, `memory/colleagues.md`, `memory/scope.md`, `memory/day-to-day.md`, `memory/voice.md`, `memory/decisions.md` from `templates/memory/`, filled with their answers. Record their priority channels and capture channel in `day-to-day.md`. Leave blanks where they skipped; do not invent anything.
- Create these empty so every workflow has a home: `memory/topics/`, `memory/state/`, `memory/context-gaps.md`, `memory/context-watchlist.md`, `memory/skill-improvements.md`, `memory/meeting-prep-recurring.md`, and a `memory/_backups/` folder for the sync/consolidate backups.
Show the user exactly what you're about to write (a short summary per file), then write on their confirmation. Never fabricate a fact they didn't give.

## Step 5 - Point them to the next steps
Confirm what was written, and which workflows will be live vs skipped based on their connected tools. Then tell them:
- Their system is live; from now on Claude reads `CLAUDE.md` and loads the right memory automatically.
- Run `/pm-copilot:first-run` to run all the workflows once right now, see the output, and calibrate.
- After that, run any workflow whenever they want by opening a new chat and naming it: `morning-brief` each morning, `weekly-prep` at the start of the week, `open-loops` and `self-improvement` for a periodic sweep, `sync` then `consolidate` to refresh memory. Tell them to run these in a normal chat so they execute on their machine with access to this memory folder. Claude's scheduled tasks currently run in the cloud and cannot see local files, so do not schedule these for now.
- They can add topic files under `memory/topics/` any time; `sync` and `consolidate` keep memory current.
