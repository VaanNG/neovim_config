return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "moll/vim-bbye" -- close current buffer
    },
    config = function()
        local status_ok, bufferline = pcall(require, "bufferline")
        if not status_ok then
            return
        end
        bufferline.setup {
            highlights = {
                buffer_selected = {
                    fg = "#c2df83",
                    bold = true,
                    italic = true
                },
                background = {
                    fg = "#bebebe"
                }
            },
            options = {
                mode = "buffers",
                truncate_names = true,
                separator_style = "thin",
                enforce_regular_tabs = true,
                always_show_bufferline = false,
                max_name_length = 30,
                max_prefix_length = 30,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = function()
                            return vim.fn.getcwd()
                        end,
                        highlight = "Directory",
                        separator = true
                    }
                }
            }
        }
    end
}
