require('nvim-tundra').setup({
  transparent_background = true,
  dim_inactive_windows = {
    enabled = false,
    color = nil,
  },
  editor = {
    search = {},
    substitute = {},
  },
  syntax = {
    booleans = { bold = true, italic = true },
    comments = { bold = true, italic = true , fg = "#9A9A9A" },
    conditionals = {},
    constants = { bold = true },
    fields = {},
    functions = {},
    keywords = {},
    loops = {},
    numbers = { bold = true },
    operators = { bold = true },
    punctuation = {},
    strings = {},
    types = { italic = true },
  },
  diagnostics = {
    errors = {},
    warnings = {},
    information = {},
    hints = {},
  },
  plugins = {
    lsp = true,
    treesitter = true,
    nvimtree = true,
    cmp = true,
    lualine = true,
    gitsigns = true,
  },
  overwrite = {
    colors = {},
    highlights = {
      LineNr = { fg = "#fff6b8" },
    },
  },
})

local colorscheme = "tundra"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
