--=============================================================================
-- Gruvbox Dark — Neovim Colorscheme
-- Warm earthy tones on a deep brown background with vibrant earthy accents.
-- Based on Gruvbox Dark (Medium Contrast) palette.
--
-- Options (set before loading the colorscheme):
--   vim.g.gruvbox_dark_transparent = 0   -- solid background (default: transparent)
--=============================================================================

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "gruvbox_dark"

-----------------------------------------------------------------------------
-- Palette
-----------------------------------------------------------------------------
local p = {
    dark0_hard  = "#1d2021",
    dark0       = "#282828",
    dark0_soft  = "#32302f",
    dark1       = "#3c3836",
    dark2       = "#504945",
    dark3       = "#665c54",
    dark4       = "#7c6f64",

    light0_hard = "#fbf1c7",
    light0      = "#ebdbb2",
    light1      = "#d5c4a1",
    light2      = "#bdae93",
    light3      = "#a89984",

    gray        = "#928374",

    red         = "#fb4934",
    green       = "#b8bb26",
    yellow      = "#fabd2f",
    blue        = "#83a598",
    purple      = "#d3869b",
    aqua        = "#8ec07c",
    orange      = "#fe8019",

    faded_red    = "#9d0006",
    faded_green  = "#79740e",
    faded_yellow = "#b57614",
    faded_blue   = "#076678",
    faded_purple = "#8f3f71",
    faded_aqua   = "#427b58",
    faded_orange = "#af3a03",
}

-----------------------------------------------------------------------------
-- Options
-----------------------------------------------------------------------------
-- Transparent by default; set g:gruvbox_dark_transparent = 0 to opt out
local transparent = vim.g.gruvbox_dark_transparent ~= 0
    and vim.g.gruvbox_dark_transparent ~= false
local bg = transparent and "NONE" or p.dark0
local float_bg = transparent and "NONE" or p.dark0_soft

-----------------------------------------------------------------------------
-- Highlight Groups
-----------------------------------------------------------------------------
local groups = {
    -------------------------------------------------------------------------
    -- General UI
    -------------------------------------------------------------------------
    Normal        = { fg = p.light0, bg = bg },
    EndOfBuffer   = { fg = p.dark0, bg = bg },
    NonText       = { fg = p.dark2, bg = bg },
    ColorColumn   = { bg = p.dark1 },
    Conceal       = { fg = p.dark3 },
    Cursor        = { fg = p.dark0, bg = p.light0 },
    lCursor       = { fg = p.dark0, bg = p.light0 },
    CursorIM      = { fg = p.dark0, bg = p.light0 },
    CursorColumn  = { bg = p.dark0_soft },
    CursorLine    = { bg = p.dark0_soft },
    CursorLineNr  = { fg = p.yellow, bg = p.dark1 },
    LineNr        = { fg = p.dark3 },
    SignColumn    = { bg = bg },
    FoldColumn    = { fg = p.gray },
    Folded        = { fg = p.gray, bg = p.dark1 },
    VertSplit     = { fg = p.dark4, bg = bg },
    WinSeparator  = { fg = p.dark4, bg = bg },
    StatusLine    = { fg = p.light1, bg = p.dark1 },
    StatusLineNC  = { fg = p.dark3, bg = p.dark0_soft },
    WinBar        = { fg = p.light1, bg = bg },
    WinBarNC      = { fg = p.dark3, bg = bg },
    TabLine       = { fg = p.dark3, bg = p.dark1 },
    TabLineFill   = { fg = p.dark4, bg = p.dark1 },
    TabLineSel    = { fg = p.light3, bg = p.dark0 },
    Pmenu         = { fg = p.light1, bg = p.dark1 },
    PmenuSel      = { fg = p.light0, bg = p.dark2, bold = true },
    PmenuSbar     = { bg = p.dark2 },
    PmenuThumb    = { bg = p.dark4 },
    PmenuKind     = { fg = p.purple, bg = p.dark1 },
    PmenuKindSel  = { fg = p.purple, bg = p.dark2, bold = true },
    PmenuExtra    = { fg = p.dark3, bg = p.dark1 },
    PmenuExtraSel = { fg = p.dark3, bg = p.dark2 },
    NormalFloat   = { fg = p.light0, bg = float_bg },
    FloatBorder   = { fg = p.dark4, bg = float_bg },
    FloatTitle    = { fg = p.orange, bg = float_bg, bold = true },
    Visual        = { bg = p.dark2 },
    VisualNOS     = { bg = p.dark2 },
    Search        = { fg = p.dark0, bg = p.yellow },
    IncSearch     = { fg = p.dark0, bg = p.orange },
    CurSearch     = { link = "IncSearch" },
    Substitute    = { fg = p.dark0, bg = p.yellow },
    MatchParen    = { bg = p.dark2, bold = true },
    Directory     = { fg = p.blue },
    Title         = { fg = p.green, bold = true },
    ErrorMsg      = { fg = p.red, bold = true },
    WarningMsg    = { fg = p.orange },
    ModeMsg       = { fg = p.light3 },
    MoreMsg       = { fg = p.blue },
    Question      = { fg = p.aqua },
    MsgArea       = { fg = p.light0, bg = bg },
    MsgSeparator  = { fg = p.dark4, bg = bg },
    WildMenu      = { fg = p.light0, bg = p.dark2 },
    SpellBad      = { sp = p.red, undercurl = true },
    SpellCap      = { sp = p.yellow, undercurl = true },
    SpellLocal    = { sp = p.blue, undercurl = true },
    SpellRare     = { sp = p.purple, undercurl = true },
    SpecialKey    = { fg = p.dark3 },
    Whitespace    = { fg = p.dark2 },
    QuickFixLine  = { bg = p.dark1, bold = true },

    -------------------------------------------------------------------------
    -- Diff
    -------------------------------------------------------------------------
    DiffAdd       = { fg = p.green, bg = p.dark1 },
    DiffChange    = { fg = p.yellow, bg = p.dark1 },
    DiffDelete    = { fg = p.red, bg = p.dark1 },
    DiffText      = { fg = p.blue, bg = p.dark1, bold = true },
    diffAdded     = { fg = p.green },
    diffRemoved   = { fg = p.red },
    diffChanged   = { fg = p.yellow },
    diffOldFile   = { fg = p.red },
    diffNewFile   = { fg = p.green },
    diffFile      = { fg = p.blue },
    diffLine      = { fg = p.gray },

    -------------------------------------------------------------------------
    -- Syntax: General
    -------------------------------------------------------------------------
    Comment       = { fg = p.gray, italic = true },
    Constant      = { fg = p.red },
    String        = { fg = p.aqua },
    Character     = { fg = p.aqua },
    Number        = { fg = p.yellow },
    Boolean       = { fg = p.yellow, bold = true },
    Float         = { fg = p.yellow },
    Identifier    = { fg = p.light1 },
    Function      = { fg = p.blue, bold = true },
    Statement     = { fg = p.purple },
    Conditional   = { fg = p.purple },
    Repeat        = { fg = p.purple },
    Label         = { fg = p.yellow },
    Operator      = { fg = p.orange, bold = true },
    Keyword       = { fg = p.purple },
    Exception     = { fg = p.purple },
    PreProc       = { fg = p.blue },
    Include       = { fg = p.blue },
    Define        = { fg = p.blue },
    Macro         = { fg = p.blue },
    PreCondit     = { fg = p.blue },
    Type          = { fg = p.blue, bold = true },
    StorageClass  = { fg = p.orange, bold = true },
    Structure     = { fg = p.orange, bold = true },
    Typedef       = { fg = p.aqua, bold = true },
    Special       = { fg = p.blue },
    SpecialChar   = { fg = p.purple },
    Tag           = { fg = p.green },
    Delimiter     = { fg = p.light3 },
    SpecialComment = { fg = p.gray, italic = true, bold = true },
    Debug         = { fg = p.red },
    Underlined    = { fg = p.blue, underline = true },
    Ignore        = { fg = p.dark3 },
    Error         = { fg = p.red, bold = true },
    Todo          = { fg = p.purple, bold = true, italic = true },

    -------------------------------------------------------------------------
    -- LSP / Diagnostics
    -------------------------------------------------------------------------
    DiagnosticError = { fg = p.red },
    DiagnosticWarn  = { fg = p.yellow },
    DiagnosticInfo  = { fg = p.blue },
    DiagnosticHint  = { fg = p.aqua },
    DiagnosticOk    = { fg = p.green },
    DiagnosticUnderlineError = { sp = p.red, undercurl = true },
    DiagnosticUnderlineWarn  = { sp = p.yellow, undercurl = true },
    DiagnosticUnderlineInfo  = { sp = p.blue, undercurl = true },
    DiagnosticUnderlineHint  = { sp = p.aqua, undercurl = true },
    DiagnosticVirtualTextError = { fg = p.red, bg = p.dark1 },
    DiagnosticVirtualTextWarn  = { fg = p.yellow, bg = p.dark1 },
    DiagnosticVirtualTextInfo  = { fg = p.blue, bg = p.dark1 },
    DiagnosticVirtualTextHint  = { fg = p.aqua, bg = p.dark1 },
    DiagnosticFloatingError = { fg = p.red },
    DiagnosticFloatingWarn  = { fg = p.yellow },
    DiagnosticFloatingInfo  = { fg = p.blue },
    DiagnosticFloatingHint  = { fg = p.aqua },
    DiagnosticSignError = { fg = p.red },
    DiagnosticSignWarn  = { fg = p.yellow },
    DiagnosticSignInfo  = { fg = p.blue },
    DiagnosticSignHint  = { fg = p.aqua },
    LspReferenceText  = { bg = p.dark1 },
    LspReferenceRead  = { bg = p.dark1 },
    LspReferenceWrite = { bg = p.dark1 },

    -------------------------------------------------------------------------
    -- Treesitter (@ groups)
    -------------------------------------------------------------------------
    ["@annotation"]            = { fg = p.yellow },
    ["@attribute"]             = { fg = p.yellow },
    ["@boolean"]               = { fg = p.yellow, bold = true },
    ["@character"]             = { fg = p.aqua },
    ["@character.special"]     = { fg = p.purple },
    ["@comment"]               = { fg = p.gray, italic = true },
    ["@comment.documentation"] = { fg = p.gray, italic = true },
    ["@comment.error"]         = { fg = p.red, bold = true },
    ["@comment.note"]          = { fg = p.aqua, bold = true },
    ["@comment.todo"]          = { fg = p.purple, bold = true, italic = true },
    ["@comment.warning"]       = { fg = p.yellow, bold = true },
    ["@constant"]              = { fg = p.red },
    ["@constant.builtin"]      = { fg = p.blue, bold = true },
    ["@constant.macro"]        = { fg = p.blue, bold = true },
    ["@constructor"]           = { fg = p.yellow },
    ["@diff.plus"]             = { fg = p.green },
    ["@diff.minus"]            = { fg = p.red },
    ["@diff.delta"]            = { fg = p.yellow },
    ["@function"]              = { fg = p.blue, bold = true },
    ["@function.builtin"]      = { fg = p.aqua, bold = true },
    ["@function.call"]         = { fg = p.blue, bold = true },
    ["@function.macro"]        = { fg = p.red, bold = true },
    ["@function.method"]       = { fg = p.blue, bold = true },
    ["@function.method.call"]  = { fg = p.blue, bold = true },
    ["@keyword"]               = { fg = p.purple },
    ["@keyword.conditional"]   = { fg = p.purple },
    ["@keyword.coroutine"]     = { fg = p.purple },
    ["@keyword.debug"]         = { fg = p.purple },
    ["@keyword.directive"]     = { fg = p.blue },
    ["@keyword.exception"]     = { fg = p.purple },
    ["@keyword.function"]      = { fg = p.purple, bold = true },
    ["@keyword.import"]        = { fg = p.blue },
    ["@keyword.operator"]      = { fg = p.purple },
    ["@keyword.repeat"]        = { fg = p.purple },
    ["@keyword.return"]        = { fg = p.purple },
    ["@keyword.type"]          = { fg = p.purple },
    ["@label"]                 = { fg = p.yellow },
    ["@lsp.type.class"]        = { link = "@type" },
    ["@lsp.type.comment"]      = { link = "@comment" },
    ["@lsp.type.decorator"]    = { link = "@attribute" },
    ["@lsp.type.enum"]         = { link = "@type" },
    ["@lsp.type.enumMember"]   = { link = "@constant" },
    ["@lsp.type.function"]     = { link = "@function" },
    ["@lsp.type.interface"]    = { link = "@type" },
    ["@lsp.type.macro"]        = { link = "@function.macro" },
    ["@lsp.type.method"]       = { link = "@function.method" },
    ["@lsp.type.namespace"]    = { link = "@module" },
    ["@lsp.type.parameter"]    = { link = "@variable.parameter" },
    ["@lsp.type.property"]     = { link = "@property" },
    ["@lsp.type.struct"]       = { link = "@type" },
    ["@lsp.type.type"]         = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.variable"]     = { link = "@variable" },
    ["@markup.bold"]           = { bold = true },
    ["@markup.heading"]        = { fg = p.orange, bold = true },
    ["@markup.italic"]         = { italic = true },
    ["@markup.link"]           = { fg = p.blue, underline = true },
    ["@markup.link.label"]     = { fg = p.aqua },
    ["@markup.link.url"]       = { fg = p.faded_blue, underline = true },
    ["@markup.list"]           = { fg = p.purple },
    ["@markup.list.checked"]   = { fg = p.green },
    ["@markup.list.unchecked"] = { fg = p.gray },
    ["@markup.math"]           = { fg = p.blue, bold = true },
    ["@markup.quote"]          = { fg = p.light2, italic = true },
    ["@markup.raw"]            = { fg = p.aqua },
    ["@markup.strikethrough"]  = { strikethrough = true },
    ["@markup.underline"]      = { underline = true },
    ["@module"]                = { fg = p.blue },
    ["@namespace"]             = { fg = p.blue },
    ["@none"]                  = { fg = p.light1 },
    ["@number"]                = { fg = p.yellow },
    ["@number.float"]          = { fg = p.yellow },
    ["@operator"]              = { fg = p.orange, bold = true },
    ["@property"]              = { fg = p.light1 },
    ["@punctuation.bracket"]   = { fg = p.light3 },
    ["@punctuation.delimiter"] = { fg = p.light3 },
    ["@punctuation.special"]   = { fg = p.purple },
    ["@string"]                = { fg = p.aqua },
    ["@string.documentation"]  = { fg = p.green },
    ["@string.escape"]         = { fg = p.purple, bold = true },
    ["@string.regexp"]         = { fg = p.aqua, bold = true },
    ["@string.special"]        = { fg = p.blue },
    ["@string.special.path"]   = { fg = p.blue },
    ["@string.special.symbol"] = { fg = p.purple },
    ["@tag"]                   = { fg = p.red },
    ["@tag.attribute"]         = { fg = p.green },
    ["@tag.delimiter"]         = { fg = p.red },
    ["@type"]                  = { fg = p.blue, bold = true },
    ["@type.builtin"]          = { fg = p.orange, bold = true },
    ["@type.definition"]       = { fg = p.blue, bold = true },
    ["@type.qualifier"]        = { fg = p.purple },
    ["@variable"]              = { fg = p.light1 },
    ["@variable.builtin"]      = { fg = p.blue, bold = true },
    ["@variable.member"]       = { fg = p.light1 },
    ["@variable.parameter"]    = { fg = p.light1 },

    -- Legacy @text.* (older nvim-treesitter)
    ["@text"]                  = { fg = p.light0 },
    ["@text.danger"]           = { fg = p.red, bold = true },
    ["@text.diff.add"]         = { fg = p.green },
    ["@text.diff.delete"]      = { fg = p.red },
    ["@text.emphasis"]         = { italic = true },
    ["@text.literal"]          = { fg = p.aqua },
    ["@text.note"]             = { fg = p.aqua, bold = true },
    ["@text.strike"]           = { strikethrough = true },
    ["@text.strong"]           = { bold = true },
    ["@text.title"]            = { fg = p.orange, bold = true },
    ["@text.todo"]             = { fg = p.purple, bold = true, italic = true },
    ["@text.uri"]              = { fg = p.blue, underline = true },
    ["@text.warning"]          = { fg = p.yellow, bold = true },

    -------------------------------------------------------------------------
    -- Plugins: Git Signs
    -------------------------------------------------------------------------
    GitSignsAdd    = { fg = p.green },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },

    -------------------------------------------------------------------------
    -- Plugins: Neotree / File Explorers
    -------------------------------------------------------------------------
    NeoTreeDimText        = { fg = p.dark3 },
    NeoTreeDirectoryIcon  = { fg = p.blue },
    NeoTreeDirectoryName  = { fg = p.blue },
    NeoTreeFileName       = { fg = p.light0 },
    NeoTreeGitAdded       = { fg = p.green },
    NeoTreeGitConflict    = { fg = p.red },
    NeoTreeGitDeleted     = { fg = p.red },
    NeoTreeGitIgnored     = { fg = p.gray },
    NeoTreeGitModified    = { fg = p.yellow },
    NeoTreeGitUntracked   = { fg = p.aqua },
    NeoTreeIndentMarker   = { fg = p.dark3 },
    NeoTreeNormal         = { fg = p.light0, bg = bg },
    NeoTreeNormalNC       = { fg = p.light0, bg = bg },
    NeoTreeRootName       = { fg = p.orange, bold = true },
    NeoTreeTabActive      = { fg = p.light3, bg = p.dark1 },
    NeoTreeTabInactive    = { fg = p.dark3, bg = p.dark0_soft },

    -------------------------------------------------------------------------
    -- Plugins: Telescope / FzfLua
    -------------------------------------------------------------------------
    TelescopeBorder       = { fg = p.dark4 },
    TelescopePromptBorder = { fg = p.dark4 },
    TelescopeResultsBorder = { fg = p.dark4 },
    TelescopePreviewBorder = { fg = p.dark4 },
    TelescopeMatching     = { fg = p.yellow, bold = true },
    TelescopeSelection    = { fg = p.light0, bg = p.dark1 },
    TelescopeTitle        = { fg = p.orange, bold = true },
    FzfLuaBorder          = { fg = p.dark4 },
    FzfLuaTitle           = { fg = p.orange, bold = true },
    FzfLuaCursorLine      = { bg = p.dark1 },

    -------------------------------------------------------------------------
    -- Plugins: WhichKey / Noice
    -------------------------------------------------------------------------
    WhichKey          = { fg = p.blue },
    WhichKeyBorder    = { fg = p.dark4 },
    WhichKeyDesc      = { fg = p.light0 },
    WhichKeyGroup     = { fg = p.green },
    WhichKeySeparator = { fg = p.dark3 },
    NoiceCmdlinePopupBorder = { fg = p.dark4 },
    NoiceCmdlinePopupTitle  = { fg = p.orange, bold = true },
    NoiceCmdlineIcon        = { fg = p.green },

    -------------------------------------------------------------------------
    -- Plugins: Completion (nvim-cmp / blink)
    -------------------------------------------------------------------------
    CmpItemAbbr           = { fg = p.light0 },
    CmpItemAbbrDeprecated = { fg = p.gray, strikethrough = true },
    CmpItemAbbrMatch      = { fg = p.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.blue, underline = true },
    CmpItemKind           = { fg = p.purple },
    CmpItemMenu           = { fg = p.gray },
    BlinkCmpMenu          = { link = "Pmenu" },
    BlinkCmpMenuSelection = { link = "PmenuSel" },
    BlinkCmpLabelMatch    = { fg = p.blue, bold = true },
    BlinkCmpKind          = { fg = p.purple },

    -------------------------------------------------------------------------
    -- Plugins: Indent Blankline
    -------------------------------------------------------------------------
    IblIndent = { fg = p.dark1 },
    IblScope  = { fg = p.dark3 },
    IndentBlanklineChar        = { fg = p.dark1 },
    IndentBlanklineContextChar = { fg = p.dark3 },

    -------------------------------------------------------------------------
    -- Plugins: Notify
    -------------------------------------------------------------------------
    NotifyERRORBorder = { fg = p.red },
    NotifyWARNBorder  = { fg = p.yellow },
    NotifyINFOBorder  = { fg = p.blue },
    NotifyDEBUGBorder = { fg = p.gray },
    NotifyTRACEBorder = { fg = p.purple },
    NotifyERRORIcon   = { fg = p.red },
    NotifyWARNIcon    = { fg = p.yellow },
    NotifyINFOIcon    = { fg = p.blue },
    NotifyDEBUGIcon   = { fg = p.gray },
    NotifyTRACEIcon   = { fg = p.purple },
    NotifyERRORTitle  = { fg = p.red },
    NotifyWARNTitle   = { fg = p.yellow },
    NotifyINFOTitle   = { fg = p.blue },
    NotifyDEBUGTitle  = { fg = p.gray },
    NotifyTRACETitle  = { fg = p.purple },
}

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end

-----------------------------------------------------------------------------
-- Terminal Colors (:terminal)
-----------------------------------------------------------------------------
vim.g.terminal_color_0  = p.dark0
vim.g.terminal_color_1  = p.red
vim.g.terminal_color_2  = p.green
vim.g.terminal_color_3  = p.yellow
vim.g.terminal_color_4  = p.blue
vim.g.terminal_color_5  = p.purple
vim.g.terminal_color_6  = p.aqua
vim.g.terminal_color_7  = p.light3
vim.g.terminal_color_8  = p.gray
vim.g.terminal_color_9  = p.red
vim.g.terminal_color_10 = p.green
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_12 = p.blue
vim.g.terminal_color_13 = p.purple
vim.g.terminal_color_14 = p.aqua
vim.g.terminal_color_15 = p.light0
