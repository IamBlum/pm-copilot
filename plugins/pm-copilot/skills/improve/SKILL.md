---
name: improve
description: Evaluate an external idea about AI agents, Claude setups, or agent infrastructure against your own setup, and get concrete, prioritized upgrades. Triggers on "/improve", on pasting a URL or a technique with phrases like "what do you think", "should we try this", "are we doing this right", "how does this compare", or any request to weigh an outside setup idea against your current one. Scope is strictly infrastructure - your CLAUDE.md, memory files, installed skills, scheduled tasks, connected tools, hooks, and agent patterns. It does NOT cover PM process (specs, meetings, board conventions); those belong to the workflows.
---

# Improve - Setup Upgrade Skill

## Purpose

Keep your setup evolving by turning outside best-practice content (posts, threads, articles, videos, repos) into concrete, prioritized, actionable upgrades that actually fit what you already run.

This skill solves one problem: there is too much "how to run agents better" content, and most of it is either low-signal novelty or does not apply to your setup. You need a filter, not a firehose. This is the reactive counterpart to `self-improvement`: that one learns from how you worked this week, this one reacts to an idea you bring in.

## When to trigger

- You type `/improve`.
- You paste a URL (X, LinkedIn, a blog, Substack, a GitHub repo, YouTube) and ask "what do you think", "should we try this", "are we doing this right", "how does this compare", "is this relevant".
- You describe a technique you read or heard about and ask whether it applies to your setup.
- You ask to "improve" your CLAUDE.md, memory, skills, or agent setup.

## Scope guardrails

**In scope:**
- CLAUDE.md structure, routing logic, working-style instructions
- Memory file organization and content
- Skill creation, modification, or retirement
- Scheduled tasks and how you run the workflows
- Connected tools and how the workflows use them
- Agent patterns (sub-agents, delegation, hooks, guardrails)
- Slash commands and prompt templates

**Out of scope - decline and redirect:**
- PM process (spec templates, meeting cadence, board workflows) -> that is the workflows' job, not infrastructure
- Product strategy or roadmap changes -> not infrastructure
- Personal productivity habits unrelated to your Claude setup

## Execution steps

### 1. Ingest the source

If you were given a URL:
- Fetch it (WebFetch first). If that fails or it is behind a login wall, open it in the browser and read the page text; screenshot if needed.
- For X posts, a screenshot is often needed because text extraction returns replies only.
- For YouTube, use the transcript if available.
- For a repo, read the README and the key files.
- **If you have no way to fetch it** (no web or browser tool available, or the page is blocked), say so and ask the user to paste the text or the key quotes. Never guess at what a link says.

If you were given raw content (pasted text, a described technique), work directly from it.

Pull out the **core technique** in plain language. If the source has several ideas, list each one separately.

### 2. Inventory the current setup

Before recommending anything, read what is actually in place. Do not re-read everything every time; read only the slices relevant to the incoming idea. Memory lives in the `memory/` folder next to `CLAUDE.md` (the paths are recorded during `/setup`; substitute them here).

Read, in this order, only what is relevant:
1. `CLAUDE.md` - routing brain, working style
2. `memory/` - only the files the idea touches (`role.md`, `day-to-day.md` for tools, etc.)
3. Installed skills (from the available-skills context, or by scanning the skills folder)
4. Any scheduled tasks you run
5. Connected tools (`memory/day-to-day.md` lists them)

If the idea is about memory hygiene, read `CLAUDE.md` plus a couple of memory files. If it is about sub-agents, read the skills list. Match the read to the idea.

> If a location does not resolve, ask rather than guessing.

### 3. Produce the verdict

Output this exact structure. No preamble, no cheerleading.

```
## Improve - [one-line summary of the source]

**Source:** [URL or "pasted content"]
**Core idea:** [1-2 sentences, plain language]

---

### Verdict

| Idea | Verdict | Rationale |
|------|---------|-----------|
| [Technique 1] | Adopt / Adapt / Skip | [1 line: why, and what specifically changes in your setup] |
| [Technique 2] | Adopt / Adapt / Skip | [1 line] |

---

### If Adopt/Adapt: concrete changes

**[Technique name]**
- File to change: [full path in your workspace, or "new skill in your own skills folder"]
- Change: [what specifically - "add a routing row for X", "create a skill triggered on Y", "add a scheduled task"]
- Effort: [S / M / L]
- Expected outcome: [what you gain]

---

### Ship it?
[One line: apply the Adopt items now, or save them for the self-improvement loop?]
```

### 4. Honest filtering

Apply these before you output. If an idea fails one, mark it Skip with the reason.

- **Redundancy:** Do you already do this? If yes -> Skip, "already in place at [location]".
- **Fit:** Is it a concept that does not map to your setup? -> Skip, "N/A here".
- **Value:** Would it change an outcome, or just shuffle files? Pure cosmetic refactor -> Skip, "no outcome gain".
- **Maintenance:** Does it add ongoing overhead out of proportion to the value? -> Skip, or Adapt to a lighter version.

Do not pad the table with weak Adopts to look busy. "All three Skip" is a valid, useful answer.

### 5. Apply or defer

**Never apply without explicit confirmation** ("yes, apply" / "ship it"). This skill surfaces opportunities; you approve them.

**Back up first (before any write).** Snapshot the workspace files you are about to touch so a bad edit is reversible, same pattern the memory skills use:

```bash
WORKSPACE="<the folder that holds your CLAUDE.md and memory/>"
BACKUP="<your backups folder>/improve_$(date +%Y-%m-%d_%H%M%S)"
mkdir -p "$BACKUP" && cp -R "$WORKSPACE/CLAUDE.md" "$WORKSPACE/memory" "$BACKUP/" 2>/dev/null \
  && echo "Backed up to $BACKUP" || echo "Backup failed - STOP, do not write."
```
If the backup fails, STOP and do not write.

**What is safe to edit in place.** Your `CLAUDE.md` and your `memory/` files live in your workspace and persist, so routing rows, working-style lines, and memory edits apply directly.

**Creating a new skill.** Write it to *your own* skills folder (for example `~/.claude/skills/<name>/SKILL.md`), never inside the installed PM Co-Pilot plugin package. The plugin is managed and gets overwritten whenever it updates, so anything written there is lost. If you are not sure where the user's own skills folder is, ask.

**Improving a PM Co-Pilot skill itself.** Do not edit the bundled skill file in place (same reason - it will not survive a plugin update). Instead log it as a suggestion in the friction log (below) and tell the user it is a change to the shipped skill, so they can carry it forward deliberately.

**On apply:** make each approved change per the rules above, add a dated changelog line to each changed workspace file (`[YYYY-MM-DD] What changed. Why.`), and summarize what you did in three lines.

**Defer (on "save for later"):**
- Append each Adopt/Adapt item to the friction log at `memory/skill-improvements.md`, one per line:
  `- YYYY-MM-DD | "<source + idea>" | proposed change in one line | open`
- The next `self-improvement` run reads that log in its apply phase and walks you through applying them. That is how this skill feeds the self-improvement loop.

## Working style

- Crisp over verbose. Aim to say it in half the words.
- No "great idea" / "fantastic approach". Direct and honest.
- Frame Adopt items as opportunities, not fixes.
- Max three clarifying questions, and only if the source is genuinely ambiguous. Answer first, then ask.

## Anti-patterns

- Recommending change for novelty's sake
- Treating every external post as gospel
- Suggesting a heavy refactor when a one-line memory edit would do
- Missing that you already do the thing (always check first)
- Copying a technique verbatim instead of adapting it to your setup
