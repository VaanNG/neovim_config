return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify"
    },
    version = "*",
    config = function()
        require("notify").setup(
            {
                background_colour = "#000000",
                fps = 30,
                icons = {
                    DEBUG = "",
                    ERROR = "",
                    INFO = "",
                    TRACE = "✎",
                    WARN = ""
                },
                level = 2,
                minimum_width = 50,
                render = "default",
                stages = "fade_in_slide_out",
                time_formats = {
                    notification = "%T",
                    notification_history = "%FT%T"
                },
                timeout = 2500,
                top_down = true
            }
        )
        require("noice").setup(
            {
                cmdline = {
                    enabled = true, -- enables the Noice cmdline UI
                    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                    opts = {}, -- global options for the cmdline. See section on views
                    ---@type table<string, CmdlineFormat>
                    format = {
                        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                        -- view: (default is cmdline view)
                        -- opts: any options passed to the view
                        -- icon_hl_group: optional hl_group for the icon
                        -- title: set to anything or empty string to hide
                        cmdline = {pattern = "^:", icon = "", lang = "vim"},
                        search_down = {kind = "search", pattern = "^/", icon = " ", lang = "regex"},
                        search_up = {kind = "search", pattern = "^%?", icon = " ", lang = "regex"},
                        filter = {pattern = "^:%s*!", icon = "$", lang = "bash"},
                        lua = {pattern = {"^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*"}, icon = "", lang = "lua"},
                        help = {pattern = "^:%s*he?l?p?%s+", icon = ""},
                        input = {} -- Used by input()
                        -- lua = false, -- to disable a format, set to `false`
                    }
                },
                notify = {
                    -- Noice can be used as `vim.notify` so you can route any notification like other messages
                    -- Notification messages have their level and other properties set.
                    -- event is always "notify" and kind can be any log level as a string
                    -- The default routes will forward notifications to nvim-notify
                    -- Benefit of using Noice for this is the routing and consistent history view
                    enabled = true,
                    view = "notify",
                },
                popupmenu = {
                    enabled = true, -- enables the Noice popupmenu UI
                    ---@type 'nui'|'cmp'
                    backend = "nui", -- backend to use to show regular cmdline completions
                    ---@type NoicePopupmenuItemKind|false
                    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
                    kind_icons = {} -- set to `false` to disable icons
                },
                views = {
                    cmdline_popup = {
                        position = {
                            row = 5,
                            col = "50%"
                        },
                        size = {
                            width = 60,
                            height = "auto"
                        }
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = 8,
                            col = "50%"
                        },
                        size = {
                            width = 60,
                            height = 10
                        },
                        border = {
                            style = "rounded",
                            padding = {0, 1}
                        },
                        win_options = {
                            winhighlight = {Normal = "Normal", FloatBorder = "DiagnosticInfo"}
                        }
                    }
                },
                smart_move = {
                    -- noice tries to move out of the way of existing floating windows.
                    enabled = true -- you can disable this behaviour here
                    -- add any filetypes here, that shouldn't trigger smart move.
                    -- excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
                }
            }
        )
    end
}

