# CLAUDE.md — Neovim Config

## What this repo is
Van's personal Neovim configuration. The goal is a clean two-tier plugin system:
- **Minimal** — runs on any machine. No LSP by default. Core editing only.
- **Full** — layers on top of minimal. Richer UI, AI tools, heavier plugins.
  Must never break or bloat minimal.

Exit condition for this project: stable minimal + full tier separation,
implemented and documented.

## Before you start any session
1. Read `docs/VISION.md`
2. Read `docs/BACKLOG.md`
3. Confirm the task with Van before touching any file

## How to behave
- Explain what you're doing and why as you go
- One logical change at a time — don't batch unrelated work
- If something is ambiguous, stop and ask rather than assume
- When done, append an entry to `CHANGELOG.md` (format below)

## Branch management
- Create a branch at the start of every session before touching any file
- Naming convention: `type/short-description`
  - Examples: `archive/obsidian-indentline`, `feat/tier-split`, `fix/keymaps`
- State the branch name to Van at the start of the session
- Never commit directly to main
- Van reviews the diff and merges manually

## Conventions
- Plugins not in active use go to `lua/archive/` — not deleted
- Minimal tier plugins: `lua/plugins/core/`
- Full tier plugins: `lua/plugins/full/`
- `init.lua` controls which tier loads — do not change tier-loading logic
  without explicit instruction

## CHANGELOG.md format
Each entry:
\```
## YYYY-MM-DD — <short title>
**Task:** What was asked
**Changes:** What was done and why
**Notes:** Anything Van should know or follow up on
\```
