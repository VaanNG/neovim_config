# CLAUDE.md — Neovim Config

## What this repo is
Van's personal Neovim configuration. The goal is a clean two-tier plugin system:
- **Minimal** — runs on any machine. No LSP by default. Core editing only.
- **Full** — layers on top of minimal. Richer UI, AI tools, heavier plugins.
  Must never break or bloat minimal.

Exit condition for this project: stable minimal + full tier separation,
implemented and documented.

## Session start — do this before anything else
1. Read `docs/VISION.md`
2. Read `docs/BACKLOG.md`
3. Check if the top active task is already complete — if so, move it to
   the Archive section of BACKLOG.md with a completion date
4. State the current top task to Van and confirm before touching any file
5. Create a branch before touching any file:
   - Naming convention: `type/short-description`
   - Examples: `archive/obsidian-indentline`, `feat/tier-split`, `fix/keymaps`
   - State the branch name to Van
   - Run: `git checkout -b <branch-name>`

## How to behave
- Explain what you're doing and why as you go
- One logical change at a time — don't batch unrelated work
- If something is ambiguous, stop and ask rather than assume

## Session end — do this when the task is complete
1. Stage all changes: `git add .`
2. Commit with a clear message: `git commit -m "<type>: <short description>"`
3. Append an entry to `CHANGELOG.md` (format below)
4. Stage and commit the changelog: `git add CHANGELOG.md && git commit -m "docs: append changelog entry"`
5. State the branch name and tell Van to review and merge

## Conventions
- Plugins not in active use go to `lua/archive/` — not deleted
- Minimal tier plugins: `lua/plugins/core/`
- Full tier plugins: `lua/plugins/full/`
- `init.lua` controls which tier loads — do not change tier-loading logic
  without explicit instruction
- Never commit directly to main

## CHANGELOG.md format
Each entry must follow this structure exactly:
\```
## YYYY-MM-DD — <short title>
**Task:** What was asked
**Changes:** What was done and why
**Notes:** Anything Van should know or follow up on
\```
