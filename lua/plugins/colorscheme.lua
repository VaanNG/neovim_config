return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup(
            {
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                -- background = {
                --     -- :h background
                --     light = "latte",
                --     dark = "mocha"
                -- },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15 -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = {
                    -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = {"italic"}, -- Change the style of comments
                    conditionals = {"italic"},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {}
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {
                    mocha = {
                        rosewater = "#ffc6be",
                        flamingo = "#ff9494", -- red
                        pink = "#ff75a0",
                        mauve = "#ff9494", -- red
                        red = "#ff9494", -- red
                        maroon = "#ff9494", -- red
                        peach = "#FFAD7D",
                        yellow = "#e9b143",
                        green = "#cfee8a", -- green
                        teal = "#cfee8a", -- green
                        sky = "#7daea3",
                        sapphire = "#689d6a",
                        blue = "#b1d6d1",
                        lavender = "#e2cca9",
                        text = "#e2cca9",
                        subtext1 = "#e2cca9",
                        subtext0 = "#e2cca9",
                        overlay2 = "#8C7A58",
                        overlay1 = "#735F3F",
                        overlay0 = "#806234",
                        surface2 = "#665c54",
                        surface1 = "#3c3836",
                        surface0 = "#32302f",
                        base = "#282828",
                        mantle = "#1d2021",
                        crust = "#1b1b1b",
                    }
                },
                custom_highlights = {
                    LineNr = {fg = "#bebebe"},
                    Normal = {bg = "none"},
                    NormalFloat = {bg = "none"},
                    NonText = {fg = "#bebebe"},
                    Pmenu = {bg = "none"},
                    Comment = {fg = "#bebebe"},
                },
                default_integrations = true,
                integrations = {
                    alpha = true,
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    indent_blankline = {
                        enabled = true,
                        scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                        colored_indent_levels = false,
                    },
                    which_key = true,
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                }
            }
        )
        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
    end
}
