return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    version = "v3.5.*",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup {
            indent = {
                smart_indent_cap = true,
                repeat_linebreak = true
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
                highlight = {"Function", "Label"}
                -- exclude = {
                --   language = {
                --     'lua'
                --   }
                -- }
            }
        }
    end
}

