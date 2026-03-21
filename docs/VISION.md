# Vision — Neovim Config

## What this is

A personal Neovim configuration built for understanding, not accumulation.
Every plugin has a reason. Every change is intentional. The environment
reflects craft — not trends, not other people's configs.

This is the first sub-project of The Forge — Van's broader system for
building and learning with intention.

## The two-tier system

The core design decision: one config, two deployment modes.

### Minimal tier
- Runs on any machine — remote servers, fresh installs, low-resource environments
- No LSP by default. Zero assumptions about what language servers are available.
- Core editing only: navigation, search, git awareness, file management
- LSP is added manually when needed on a given machine

### Full tier
- Layers on top of minimal — never modifies or breaks it
- Richer UI, heavier plugins, AI tools
- Appropriate for Van's primary local machine only
- Loading is controlled in `init.lua` — explicit, not automatic

**The rule:** anything added to full must not touch minimal. If it does,
it belongs in minimal or it doesn't belong at all.

## Primary use context

- Languages: Python, SQL, shell. Occasionally others.
- Machines: primary local machine (full tier) + remote servers (minimal tier)
- Terminal: Kitty

## Design principles

1. **Understand before you add.** No plugin gets installed without knowing
   what problem it solves and roughly how it works.
2. **Minimal tier is sacred.** Changes to full must never break or bloat minimal.
3. **Changes are intentional and tracked.** Every meaningful change is logged.
   No drift.
4. **Learning is part of the work.** Speed is not the goal. Understanding is.
5. **The environment reflects personal taste.** Not trends, not other people's configs.

## Exit condition

This sub-project is complete when:
- Minimal and full tiers are cleanly separated in the file structure
- Both tiers are documented and stable
- The process for adding an LSP to minimal is written down and tested
