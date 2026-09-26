# Changelog

## 2026-09-26 — Add Neogit as in-editor git interface
**Task:** Replace gitui with git tooling inside Neovim
**Changes:** Added `lua/plugins/full/neogit.lua` (Neogit with plenary, diffview and the fzf-lua integration), loaded only on `:Neogit` / `:DiffviewOpen` / `:DiffviewFileHistory`. New which-key mappings in the Git group: `<leader>gg` Neogit, `<leader>gS` stage buffer, `<leader>gD` repo diff, `<leader>gh` current file history, `<leader>gf` fzf-lua changed files. Existing `<leader>g` mappings are unchanged. README plugin list updated.
**Notes:** Full tier only; verified the minimal tier does not load Neogit. `<leader>gu` still calls gitsigns `undo_stage_hunk()`, which newer gitsigns deprecates in favour of toggling with `stage_hunk()` (belongs to backlog item 3, keymap audit).

## 2026-09-03 — Default to local Gruvbox Dark
**Task:** Load the custom colorscheme in `colors/` by default
**Changes:** Archived the Catppuccin plugin configuration and configured `init.lua` to load the local `gruvbox_dark` colorscheme before plugin initialization.
**Notes:** The colorscheme applies to both minimal and full tiers and was verified with a headless Neovim launch.

## 2026-03-20

### Archived

- **obsidian.nvim** — moved `lua/plugins/obsidian.lua` → `lua/archive/obsidian.lua`.
  Workspace-specific plugin (hardcoded zettelkasten path); not appropriate for a general config.

- **indent-blankline.nvim** — moved `lua/plugins/indentline.lua` → `lua/archive/indentline.lua`.
  Cosmetic plugin with no material benefit; removed to keep the config lean.

README plugin list updated to remove both entries.

## 2025-07-15 — Minimal/Full tier split
**Task:** Implement the two-tier plugin system (exit condition for the project)
**Changes:**
- Created `lua/plugins/core/` — 6 minimal-tier plugins (autopairs, colorscheme, comment, git, oil, treesitter)
- Created `lua/plugins/full/` — 8 full-tier plugins (alpha, bufferline, cmp, fzf-lua, lsp, lualine, noice, whichkey)
- Added `lua/plugins/init.lua` — tier loader that reads `NVIM_TIER` env var
- `init.lua` unchanged except for the lazy setup path
**Notes:**
- Default is minimal — `nvim` loads core only
- Full tier layers on top: `NVIM_TIER=full nvim`
- Add `export NVIM_TIER=full` to `~/.zshrc` for permanent full mode on primary machine
