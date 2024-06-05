return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline"
    },
    config = function()
        --   פּ ﯟ   some other good icons
        local kind_icons = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
            Copilot = ""
        }
        -- find more here: https://www.nerdfonts.com/cheat-sheet

        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return
        end
        cmp.setup {
            mapping = cmp.mapping.preset.insert(
                {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({select = false}),
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                -- elseif luasnip.expandable() then
                                --   luasnip.expand()
                                -- elseif luasnip.expand_or_jumpable() then
                                --   luasnip.expand_or_jump()
                                -- elseif check_backspace() then
                                --   fallback()
                                cmp.select_next_item(
                                    {
                                        behavior = cmp.SelectBehavior,
                                        select = false
                                    }
                                )
                            else
                                fallback()
                            end
                        end,
                        {
                            "i",
                            "s"
                        }
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                -- elseif luasnip.jumpable(-1) then
                                --   luasnip.jump(-1)
                                cmp.select_prev_item(
                                    {
                                        behavior = cmp.SelectBehavior,
                                        select = false
                                    }
                                )
                            else
                                fallback()
                            end
                        end,
                        {
                            "i",
                            "s"
                        }
                    )
                }
            ),
            formatting = {
                fields = {"kind", "abbr", "menu"}, -- name ordered by kind, abbr, menu
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    -- Source
                    vim_item.menu =
                        ({
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        path = "Path",
                        copilot = "[Copilot]"
                    })[entry.source.name]
                    return vim_item
                end
            },
            sources = {
                {name = "nvim_lsp"},
                {name = "buffer"},
                {name = "path"},
                {name = "copilot"}
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    cmp.config.compare.order,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length
                }
            },
            window = {
                documentation = {
                    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
                }
            }
        }

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(
            {"/", "?"},
            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    {name = "buffer"}
                }
            }
        )

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(
            ":",
            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                    {
                        {name = "path"}
                    },
                    {
                        {name = "cmdline"}
                    }
                ),
                matching = {disallow_symbol_nonprefix_matching = false}
            }
        )
    end
}
