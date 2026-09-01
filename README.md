# PM Co-Pilot

> 🎙️ **Featured on How I AI with Claire Vo** — [Watch](https://www.youtube.com/watch?v=p2qmX6TM0kw) · [Listen](https://open.spotify.com/episode/75Adi3KXzDDXIZEJmnv6N6) · [Read](https://www.lennysnewsletter.com/p/how-i-turned-claude-into-a-self-improving)

Being a PM means holding fifty things in your head at once. Tasks pile up across email, chat, and meetings and keep reshuffling while you're stuck in back-to-back calls. The real work, talking to users and digging into the data, gets squeezed out.

PM Co-Pilot carries that overhead so you can get back to it. It catches what comes at you, keeps it organized, and surfaces what actually needs you.

It runs inside Claude Cowork, and works in Claude Code too.

## How it works

You give it context up front: your role, your people, your priorities, how you like to work. After that it keeps that memory up to date as you go, and fills its own gaps instead of waiting for you to spell everything out.

The more you give it, the more it can do. Dump in a lot of context early (dictating with a transcription tool is the fastest way), connect more of your tools, and run more of your work through it.

Four workflows handle the day-to-day, and they build on each other:

- **Weekly prep** starts your week. It pulls from your tools and walks you through setting your priorities and your focus.
- **Morning brief** refreshes that each morning: what came in, what's done, what today needs.
- **Open loops** catches the threads you'd otherwise lose, what you're waiting on and who's waiting on you.
- **Self-improvement** closes the week by learning from how you worked and improving your setup for the next one.

It checks with you before doing anything, and its memory of you stays on your machine.

## What's included

Setup writes two things into your workspace: a **`CLAUDE.md`** routing brain that loads the right memory by topic, and a **`memory/`** folder for your role, people, priorities, decisions, and voice. It keeps that memory current as you work.

**Skills (7)**

- The four workflows above: morning-brief, weekly-prep, open-loops, self-improvement.
- memory-keeper, sync, and consolidate, which keep your memory captured, refreshed, and tidy.

**Commands (2)**

- `/pm-copilot:setup` and `/pm-copilot:first-run`.

> **Already use a `CLAUDE.md`?** This creates its own. Point setup at a fresh folder, or have Claude help you merge it into what you've got, so it works alongside your setup instead of replacing it.

## What you need

- **Claude Cowork or Claude Code.**
- **Your tools connected.** Hook up whatever you already use through Claude's connectors or your own MCP servers, and it works with them. Connect a couple now, add more whenever.

## Get it

Install it once, then open a new chat and it walks you through the rest.

> ⚠️ **Install by URL, not by downloading the ZIP.** This repo is a Claude plugin *marketplace* (the plugin itself lives in `plugins/pm-copilot/`), so a downloaded ZIP won't install as a plugin. Add it as a marketplace using the steps below and it's one click.

**In Claude Cowork**

1. Go to **Customize > Plugins > Add marketplace** and paste this repo's link.
2. Find **PM Co-Pilot** and click **Install**.
3. Open a new chat and run **`/pm-copilot:setup`**. Answer a few questions (skip any you want) and it sets itself up.
4. Run **`/pm-copilot:first-run`** to see it work once, so you can fix anything that's off.

**In Claude Code**

Run:

```
/plugin marketplace add IamBlum/pm-copilot
/plugin install pm-copilot@pm-copilot
```

Then run **`/pm-copilot:setup`**, followed by **`/pm-copilot:first-run`**.

## Running it

Open a new chat and run a workflow whenever you want it: `morning-brief` each morning, `weekly-prep` at the start of your week, `open-loops` and `self-improvement` for a periodic sweep, and `sync` then `consolidate` to refresh your memory every couple of weeks.

**Why you run them yourself.** While testing this I noticed Claude seems to run scheduled tasks in the cloud, where they can't reach your local memory. So for now you run the workflows yourself, in a normal chat on your machine. Once local files and cloud runs connect again, scheduling should just work.

## Feedback

Tried it and have thoughts, or hit a snag? Email me at [itsdanielsagent@gmail.com](mailto:itsdanielsagent@gmail.com).

## License

MIT.

## Working on it (development)

Want to hack on it or contribute?

1. Clone it: `git clone https://github.com/IamBlum/pm-copilot.git`
2. The plugin lives in `plugins/pm-copilot/` — its commands, skills, hooks, and memory templates. Edit there.
3. To test your changes, point a marketplace at your local clone in Claude Code: `/plugin marketplace add <path-to-your-clone>`, then `/plugin install pm-copilot@pm-copilot` and reload.

PRs welcome.
