# Backlog — Neovim Config

Prioritized. Top = next. Claude Code reads this at the start of every session.
Do not reorder without a reason. Do not add items without a reason.

---

## Active

### 1. Archive obsidian.nvim and indent-blankline
**Why:** Both removed from active use. obsidian is workspace-specific and
not appropriate for a general config. indent-blankline is cosmetic and
unnecessary.
**Task:**
- Move `lua/plugins/obsidian.lua` → `lua/archive/obsidian.lua`
- Move `lua/plugins/indentline.lua` → `lua/archive/indentline.lua`
- Update README plugin list to remove both
- Append CHANGELOG.md entry
**Done when:** Both files are in archive, README is updated, changelog appended.

---

### 2. Implement minimal / full tier split
**Why:** This is the exit condition for the project. Everything else
is scaffolding for this.
**Decisions already made:**
- Minimal: no LSP by default
- Full: layers on top, never breaks minimal
- Minimal plugins live in `lua/plugins/core/`
- Full plugins live in `lua/plugins/full/`
- `init.lua` controls which tier loads — method TBD before this task starts
**Task:**
- Confirm tier-loading mechanism with Van before touching files
- Reorganize plugins into `core/` and `full/` per the tier map in VISION.md
- Update `init.lua` accordingly
- Verify both tiers load cleanly
- Append CHANGELOG.md entry
**Done when:** Both tiers load independently without errors.

---

### 3. Audit and clean up keymaps
**Why:** `whichkey.lua` contains deprecated Neovim API calls
(`vim.lsp.diagnostic.goto_next/prev`, `LspInstallInfo`). Should be
addressed after tier split stabilizes the config.
**Task:**
- Audit `lua/plugins/whichkey.lua` for deprecated mappings
- Audit `lua/default/keymaps.lua` for anything unused or redundant
- Fix or remove deprecated calls
- Append CHANGELOG.md entry
**Done when:** No deprecated API calls remain, keymaps reflect actual usage.

---

### 4. Update README
**Why:** Currently just ASCII art and a plugin list. Should reflect
the two-tier structure and point to docs/.
**Task:**
- Rewrite README to describe the project, the two tiers, and the docs folder
- Can be done standalone or appended to another session
**Done when:** README accurately describes the current state of the config.

---

## Future

### 5. Document LSP setup process for minimal tier
**Why:** Minimal is LSP-free by default, but adding one should be
repeatable and documented — not archaeology.
**Task:** Write a clear, tested process for adding a language server
to a minimal install. Location TBD.
**Done when:** Van can add an LSP to a fresh minimal install by following
the doc without referencing anything else.

---

## Archive

*Completed tasks move here with a completion date.*
