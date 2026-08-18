return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            "diagnostics",
            sources = {"nvim_diagnostic"},
            sections = {"error", "warn"},
            symbols = {error = " ", warn = " "},
            colored = false,
            update_in_insert = false,
            always_visible = true
        }

        local diff = {
            "diff",
            colored = true,
            symbols = {added = " ", modified = " ", removed = " "}, -- changes diff symbols
            cond = hide_in_width
        }

        local filename = {
            "filename",
            path = 4,
            icon = ""
        }

        local mode = {
            "mode",
            fmt = function(str)
                return "-- " .. str .. " --"
            end
        }

        local filetype = {
            "filetype",
            icons_enabled = true,
            icon = nil
        }

        local branch = {
            "branch",
            icons_enabled = true,
            icon = ""
        }

        local location = {
            "location",
            padding = 0
        }

        -- cool function for progress
        local progress = function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")
            local chars = {"__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"}
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
        end

        local spaces = function()
            return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end

        local colors = {
            black = "#062622",
            white = "#e2cca9",
            red = "#ff9494",
            green = "#cfee8a",
            blue = "#83a598",
            yellow = "#e9b143",
            orange = "#ffad7d"
        }

        local theme = {
            normal = {
                a = {bg = "none", fg = colors.white, gui = "bold"},
                b = {bg = "none", fg = colors.white},
                c = {bg = "none", fg = colors.white}
            },
            insert = {
                a = {bg = "none", fg = colors.green, gui = "bold"},
                b = {bg = "none", fg = colors.green},
                c = {bg = "none", fg = colors.white}
            },
            visual = {
                a = {bg = "none", fg = colors.yellow, gui = "bold"},
                b = {bg = "none", fg = colors.yellow},
                c = {bg = "none", fg = colors.white}
            },
            replace = {
                a = {bg = "none", fg = colors.red, gui = "bold"},
                b = {bg = "none", fg = colors.red},
                c = {bg = "none", fg = colors.white}
            },
            command = {
                a = {bg = "none", fg = colors.orange, gui = "bold"},
                b = {bg = "none", fg = colors.orange},
                c = {bg = "none", fg = colors.white}
            },
            inactive = {
                a = {bg = "none", fg = colors.white, gui = "bold"},
                b = {bg = "none", fg = colors.white},
                c = {bg = "none", fg = colors.white}
            }
        }

        lualine.setup(
            {
                options = {
                    icons_enabled = true,
                    theme = theme,
                    component_separators = {left = "", right = ""},
                    section_separators = {left = "", right = ""},
                    disabled_filetypes = {"alpha", "dashboard", "NvimTree", "Outline"},
                    always_divide_middle = true
                },
                sections = {
                    lualine_a = {branch, diagnostics, filename},
                    lualine_b = {mode},
                    lualine_c = {},
                    lualine_x = {
                        "diff",
                        spaces,
                        "encoding",
                        filetype
                    },
                    lualine_y = {location},
                    lualine_z = {progress}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {filename},
                    lualine_x = {location},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
        )
    end
}

