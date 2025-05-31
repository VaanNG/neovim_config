return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local status_ok, nvim_tree = pcall(require, "nvim-tree")
        if not status_ok then
            return
        end

        -- User for NvimTree
        local gwidth = vim.api.nvim_list_uis()[1].width
        local gheight = vim.api.nvim_list_uis()[1].height
        local width = 45
        local height = 40

        nvim_tree.setup {
            update_focused_file = {
                enable = true,
                update_cwd = true
            },
            git = {
                enable = true,
                ignore = false,
                show_on_dirs = true,
                timeout = 400
            },
            renderer = {
                root_folder_modifier = ":t",
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = ""
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌"
                        }
                    }
                }
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = ""
                }
            },
            view = {
                float = {
                    enable = true,
                    quit_on_focus_loss = true,
                    open_win_config = {
                        relative = "editor",
                        width = width,
                        height = height,
                        row = (gheight - height) * 0.4,
                        col = (gwidth - width) * 0.05,
                        border = "rounded"
                    }
                }
            }
        }
    end
}

