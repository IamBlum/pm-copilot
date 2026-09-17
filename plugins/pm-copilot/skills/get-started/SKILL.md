---
name: get-started
description: Start here - sets up PM Co-Pilot for a new user by walking through a few questions and writing their routing brain and memory. Triggers on "set me up", "get started", "get me started", "set up pm co-pilot", "pm copilot setup", "onboard me", "how do I start", "help me start", or any first-time request to begin using PM Co-Pilot. This is the plain-language front door; it runs the same flow as the /pm-copilot:setup command.
---

The user wants to start using PM Co-Pilot. Run the full setup now.

Follow the setup flow in this plugin's `commands/setup.md` end to end: locate the workspace, check which tools are connected, ask the setup questions in short batches (proposing answers from connected tools where you can), write the `CLAUDE.md` routing brain and the `memory/` scaffold on their confirmation, then show them their memory as a short recap and point them to `/pm-copilot:first-run`.

If you cannot locate `commands/setup.md`, tell the user and ask them to run `/pm-copilot:setup` directly rather than improvising a different setup.

This skill exists so a plain-language "set me up" works without knowing the slash command. It is the same flow as `/pm-copilot:setup`; do not run a second, different setup.
