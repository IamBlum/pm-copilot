---
name: memory-keeper
description: Keeps your memory current with the least effort from you. Two triggers. (1) Capture - at the end of a turn or on "remember this", it notices a durable new fact and proposes a memory update. (2) Context - while reading a source (meeting, chat, email), it notices things named but unseen, and drift against what memory already says, and queues or surfaces them. Propose-only; it never writes to memory without your yes. Triggers on "remember this", "capture that", "what am I missing", "catch up your context", or automatically end-of-turn when confidence is high.
---

# Memory Keeper

The co-pilot handles a lot of the user's overhead, but it does not automatically notice its own blind spots or remember what it learns unless told. This skill closes both gaps. It captures durable facts and it flags what the co-pilot hasn't actually seen.

**Core principle: gate the write, not the read.** Reading is cheap and reversible; a memory edit needs the user's approval. So auto-read freely, but never auto-write. Every proposed change is surfaced for a yes.

Memory lives in the `memory/` folder next to the routing brain (CLAUDE.md). Route each fact to the right file using the routing table in CLAUDE.md.

---

## Trigger 1 - Capture (write-time)

Runs at the end of any turn (silently scoring for capture-worthy content) or on demand ("remember this", "capture that", "log this decision", "worth capturing?").

**The bar.** Fire only if the turn contains at least one of these, AND the fact is not already in the target file:

1. **Decision** - a call that closes an option ("we're going with X", "we killed Y"). Routes to `memory/decisions.md`.
2. **New person or role change** - someone joined, changed teams, or their role shifted. Routes to `memory/colleagues.md`.
3. **New mechanic or process rule** - a rule about how the user's world or work operates that isn't written down yet. Routes to `memory/scope.md` or a topic file.
4. **External fact** - a specific, durable fact about a competitor, partner, or market. Routes to the relevant topic file.
5. **Working-pattern change** - a new rule for how the user wants the co-pilot to behave. Routes to `CLAUDE.md` (working style) or `memory/voice.md`.
6. **Project evidence** - a finding or number that anchors an ongoing initiative. Routes to the matching `memory/topics/<topic>.md`.

**Skip:** opinions in flight, brainstorms, half-formed plans, anything already in memory, code, and ephemeral snippets.

**On a fire:** surface a single line, for example `Worth capturing to memory/<file>.md - propose the diff?` Then, on a yes, show a surgical before/after (a few lines, the specific addition only) and write only after the user confirms. Add a dated changelog line to the file.

---

## Trigger 2 - Context (read-time)

Runs while the co-pilot reads a source (a meeting transcript, chat, email, a doc). Two tracks, run together on sources already being read; no extra fetching for the daily pass.

**Track A - referenced artifacts (named but unseen).**
1. Extract every artifact the source points to: decks, docs, tickets, dashboards, links.
2. Dedup against the queue in `memory/context-gaps.md` (pending, ingested, muted).
3. Keep only artifacts that map to a topic in the CLAUDE.md routing table or a VIP in `memory/colleagues.md`. Drop the rest.
4. Auto-read the high-relevance, reachable ones now. Append to the queue as `auto-read, diff-pending` with a one-line note of what's new versus current memory. If unreachable, mark `needs-link`.
5. **Drift check:** if anything read contradicts a memory file (a decision reversed, a mechanic changed, a person moved), mark it `drift` and surface one line immediately, do not wait for the weekly sweep.

**Track B - new entities.** Pull candidate entities the co-pilot has no grounding for (terms, acronyms, milestones, dates, docs named but not linked, people not in `colleagues.md`). Dedup and drop anything already known. Score each: critical (a top priority, a VIP, recurs across 2+ sources, or sits next to a decision), routine (low signal), or noise (no memory home, drop). For each critical one, do one cheap grounding read, then resolve to either `understood` (propose a one-line memory save) or `needs-user` (ask a targeted question). Routine entities stay silent in the queue for the weekly sweep.

**What reaches the user (daily):** a capped block of at most a few critical items, each a confirm ("learned X, save it?") or an answer ("X appeared in Y and isn't in memory, add as Z?"). If nothing is critical, stay invisible.

---

## Weekly-sweep mode (called by self-improvement)

Read `memory/context-watchlist.md`, check each listed source for material change since it was last swept, append genuine routing-mapped gaps to `memory/context-gaps.md`, and advance the "last swept" marker only for sources that succeeded. Then hand the pending queue to the caller for triage (Ingest / Skip / Mute / Link). On Ingest, propose the diff and write only on approval.

---

## The queue file (`memory/context-gaps.md`)

One entry per gap with: a dedup key, the source it came from, a status (`pending` / `auto-read` / `needs-link` / `needs-user` / `drift` / `ingested` / `muted`), and a one-line note. Skipped items increment a surface count and age to `muted` after a few passes. Nothing here is a memory write; it's a to-look-at list. Create the file if missing.
