# Changelog

## 2026-09-26 — Read the shared gruvbox palette from dotfiles
**Task:** Manage one colour palette across kitty, pi and Neovim
**Changes:** `colors/gruvbox_dark.lua` now overrides its palette table with `~/.dotfiles/colors/gruvbox-dark` (or `$DOTFILES/colors/gruvbox-dark`) when that file exists. The file uses official gruvbox names; this colorscheme's light names are one step off, so a small map translates them. The built-in table stays as the fallback, so the minimal tier works on machines without the dotfiles.
**Notes:** Verified with a dump of all 584 highlight groups: identical with the shared file, identical without it, and changing `light1` in the palette changes `Normal`. Palette changes apply on the next start or `:colorscheme gruvbox_dark`.

## 2026-09-26 — Add Neogit as in-editor git interface
**Task:** Replace gitui with git tooling inside Neovim
**Changes:** Added `lua/plugins/full/neogit.lua` (Neogit with plenary, diffview and the fzf-lua integration), loaded only on `:Neogit` / `:DiffviewOpen` / `:DiffviewFileHistory`. New which-key mappings in the Git group: `<leader>gg` Neogit, `<leader>gS` stage buffer, `<leader>gD` repo diff, `<leader>gh` current file history, `<leader>gf` fzf-lua changed files. Existing `<leader>g` mappings are unchanged. README plugin list updated.
**Notes:** Full tier only; verified the minimal tier does not load Neogit. `<leader>gu` still calls gitsigns `undo_stage_hunk()`, which newer gitsigns deprecates in favour of toggling with `stage_hunk()` (belongs to backlog item 3, keymap audit).

## 2026-09-26 — Fix tree-sitter startup error on Neovim 0.12.5
**Task:** Neovim failed at startup with `module 'nvim-treesitter.config' not found` after upgrading to 0.12.5
**Changes:** The installed plugin was still the archived `master` branch; lazy.nvim only switches to `branch = "main"` on update, so `:Lazy update nvim-treesitter` fixed the error. `treesitter.lua` now sets `lazy = false` and `build = ":TSUpdate"` as the plugin README requires, skips parser install with a warning when the `tree-sitter` CLI is missing (so minimal-tier machines still start cleanly), and only sets the treesitter `indentexpr` when a parser started for the buffer.
**Notes:** On every other machine run `:Lazy update nvim-treesitter` once and install `tree-sitter-cli` 0.26.1+ from the package manager (not npm) plus a C compiler, or parsers will not build. The `nvim-treesitter/bin` PATH entry in `init.lua` points to a directory the main branch does not have.

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
