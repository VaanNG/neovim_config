return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
        local status_ok, which_key = pcall(require, "which-key")
        if not status_ok then
            return
        end
        local setup = {
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20 -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = true, -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true -- bindings for prefixed with g
                }
            },
            -- add operators that will trigger motion and text object completion
            -- to enable all native operators, set the preset / operators plugin above
            -- operators = { gc = "Comments" },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
                ellipsis = "…",
                rules = {},
                mappings = false,
                colors = true
            },
            keys = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>" -- binding to scroll up inside the popup
            },
            win = {
                border = "rounded", -- none, single, double, shadow
                -- margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
                -- padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
                bo = {},
                wo = {
                    windblend = 0
                }
            },
            layout = {
                height = {min = 4, max = 25}, -- min and max height of the columns
                width = {min = 20, max = 50}, -- min and max width of the columns
                spacing = 3, -- spacing between columns
                align = "left" -- align columns left, center or right
            },
            show_help = true, -- show help message on the command line when the popup is visible
            triggers = {
                { "<auto>", mode = "nxsot" },
            },
            replace = {
                key = {
                    function(key)
                        return require("which-key.view").format(key)
                    end,
                    -- { "<Space>", "SPC" },
                },
                desc = {
                    { "<Plug>%(?(.*)%)?", "%1" },
                    { "^%+", "" },
                    { "<[cC]md>", "" },
                    { "<[cC][rR]>", "" },
                    { "<[sS]ilent>", "" },
                    { "^lua%s+", "" },
                    { "^call%s+", "" },
                    { "^:%s*", "" },
                },
            },
        }
        local mappings = {
            { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha", nowait = true, remap = false },
            { "<leader>b", group = "Bufferline", nowait = true, remap = false },
            { "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer", nowait = true, remap = false },
            { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Buffer", nowait = true, remap = false },
            { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer", nowait = true, remap = false },
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", nowait = true, remap = false },
            { "<leader>f", group = "Fuzzy Finder", nowait = true, remap = false },
            { "<leader>fF", "<cmd>FzfLua live_grep<cr>", desc = "Find Text", nowait = true, remap = false },
            { "<leader>fG", "<cmd>FzfLua git_bcommits<cr>", desc = "Find current file commits", nowait = true, remap = false },
            { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files", nowait = true, remap = false },
            { "<leader>fg", "<cmd>FzfLua git_commits<cr>", desc = "Find commits", nowait = true, remap = false },
            { "<leader>g", group = "Git", nowait = true, remap = false },
            { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
            { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
            { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
            { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
            { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Line Blame", nowait = true, remap = false },
            { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
            { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
            { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
            { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
            { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
            { "<leader>l", group = "LSP", nowait = true, remap = false },
            { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
            { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
            { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format", nowait = true, remap = false },
            { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
            { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
            { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
            { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
            { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
            { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
            { "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
            { "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
        }
        which_key.setup(setup)
        which_key.add(mappings)
    end
}
