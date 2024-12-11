return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
        {"zbirenbaum/copilot-cmp", config = function()
                require("copilot_cmp").setup()
            end},
        "AndreM222/copilot-lualine"
    },
    config = function()
        local status_ok, copilot = pcall(require, "copilot")
        if not status_ok then
            return
        end

        copilot.setup(
            {
                panel = {
                    enabled = false,
                    auto_refresh = true,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4
                    }
                },
                suggestion = {
                    enabled = false,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>"
                    }
                },
                filetypes = {
                    yaml = false,
                    markdown = true,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false
                },
                copilot_node_command = "node", -- Node.js version must be > 18.x
                server_opts_overrides = {}
            }
        )
    end
}

