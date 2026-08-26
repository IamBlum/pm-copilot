# PM Co-Pilot

A personal operating system for Claude. It learns who you are, who you work with, and how you like things done, then runs the weekly overhead of a product manager's job on a schedule: a daily brief, a start-of-week review, an open-loops digest, and a self-improvement pass that keeps getting better at helping you.

It is tool-agnostic. It doesn't assume Slack, or Notion, or any particular stack. During setup it asks what you use and adapts to it.

## Requirements

- **Claude Cowork** (the desktop app's Cowork mode). Installing the plugin and running `/pm-copilot:install-cadence` (which creates your scheduled tasks) need Cowork. Plain claude.ai Chat won't run the scheduled side.
- **Your everyday tools connected as Cowork connectors** (whichever you use: chat, task tracker, email, calendar, notes). The workflows read from these. Anything you don't connect is simply skipped, so you can start with one or two and add more later.

## What you get

- **A routing brain** (`CLAUDE.md`) that loads the right context automatically, so you stop re-explaining yourself.
- **A memory scaffold** that remembers your role, your people, your priorities, your voice, and your decisions.
- **Four workflows** that run on a schedule you choose:
  - *Morning brief* - captures new action items from your tools, cleans your task inbox, checks what's done, preps or recaps today's meetings.
  - *Weekly prep* - a guided start-of-week review that sets your priorities.
  - *Open loops* - twice a week, what's waiting on you and what you're waiting on.
  - *Self-improvement* - weekly, learns from your own use and proposes improvements to the system itself.
- **A memory layer** that keeps itself current: a light always-on `memory-keeper`, plus a biweekly `sync` + `consolidate` refresh.

## How it works, in one minute

Three surfaces, each with one job:

- **Your tools are the input.** You live in your chat, email, and calendar all day. The workflows read from there, so work enters the system without you copying anything.
- **Cowork is where you decide.** Every workflow surfaces its output here and asks "yes / adjust / that's wrong." This is your few minutes a day. Nothing is sent or changed on your behalf without your yes.
- **Your memory is the record.** A `memory/` folder holds who you are, your people, your priorities, and your decisions. It starts mostly empty and fills in as you use it. The routing brain reads the right piece automatically per message.

The system compounds: the more it runs and the more you correct it, the sharper it gets. Your first brief may be short. That's expected, it grows as memory fills and your tools are connected.

## Install (Claude Cowork)

1. In Cowork, open **Customize → Plugins**.
2. Click **Add marketplace** and paste this repository's URL.
3. Find **PM Co-Pilot** and click **Install**.
4. Run **`/pm-copilot:setup`**. It asks a short set of questions about your tools, your rhythm, and you (with sensible defaults, skip anything), and writes your routing brain and memory into your Claude working folder. If your tools are connected, it will propose your key channels and people for you to confirm rather than making you type them.
5. Run **`/pm-copilot:first-run`** to run all the workflows once, right now, so you can see the output and calibrate before anything runs on a schedule.
6. Run **`/pm-copilot:install-cadence`** to turn the workflows on at the times you chose. (Optional at first, you can just run the workflows by hand until you trust them.)

## Install (Claude Code CLI)

```
/plugin marketplace add <owner>/<repo>
/plugin install pm-copilot@pm-copilot
/pm-copilot:setup
/pm-copilot:first-run
/pm-copilot:install-cadence
```

## Working with your co-pilot

A normal day: in the morning, read the brief in Cowork and approve or adjust it. During the day, work in your tools as usual. That's it. Once a week you get the weekly prep; twice a week, open loops; weekly, the self-improvement pass. Here's what each asks of you:

- **Morning brief (daily):** yesterday's meetings summarized, new tasks captured, a close-check on open items, today's meetings to prep or recap. Your job: skim, approve the captures and closes, pick prep vs recap. ~2 minutes.
- **Weekly prep (start of week):** a guided review that proposes your week. Your job: confirm or adjust, one section at a time. Don't skip the confirmation, it's what makes the week intentional.
- **Open loops (twice a week):** threads waiting on you and threads you're waiting on. Your job: decide what to nudge, track, or drop.
- **Self-improvement (weekly):** proposes memory updates and improvements to the system from your own use. Optional to act on, worth a 2-minute read.

Keeping it healthy:
- **Correct it openly.** If an output is wrong, say so in plain language. It captures the correction to memory so it stops repeating the mistake.
- **Let the inbox accumulate.** You don't need to clear it constantly; weekly prep helps you decide what matters.
- **Don't groom the record mid-week.** Manually reorganizing your tracker fights with what the automation will propose. Let it stay accurate in the background.

## How it treats your data

- Everything it writes goes into your own Claude working folder (`CLAUDE.md` and a `memory/` folder). Nothing leaves your machine because of this plugin.
- It never messages anyone or changes anything on your behalf without asking. Every memory write and every action is proposed first; you say yes.
- The memory refresh backs up your memory folder before it touches it.

## Make it yours

- Skipped a setup question? Fine. Fill it in later, or just tell Claude and it'll update the right memory file.
- New recurring project? Add a file under `memory/topics/` and a row in the routing table; the system starts loading it automatically.
- Want a workflow at a different time? Just ask Claude to reschedule it, or re-run `/pm-copilot:install-cadence`.

## License

MIT. Take it, change it, make it yours.
