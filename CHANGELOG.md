# Changelog

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
