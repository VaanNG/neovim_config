return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local status_ok, copilot_lualine_spinners = pcall(require, "copilot-lualine.spinners")
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

        local copilot = {
            "copilot",
            -- Default values
            symbols = {
                status = {
                    icons = {
                        enabled = " :  ",
                        sleep = " :  ", -- auto-trigger disabled
                        disabled = " :  ",
                        warning = " :  ",
                        unknown = " :  "
                    },
                    hl = {
                        enabled = "#7FFFD4", -- aquamarine
                        sleep = "#AEB7D0", -- grey
                        disabled = "#6272A4", -- blue
                        warning = "#FFB86C", -- orange
                        unknown = "#FF5555" -- red
                    }
                },
                spinners = copilot_lualine_spinners.dots,
                spinner_color = "#6272A4" -- blue
            },
            show_colors = true,
            show_loading = true
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

        lualine.setup(
            {
                options = {
                    icons_enabled = true,
                    theme = "auto",
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
                        copilot,
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

