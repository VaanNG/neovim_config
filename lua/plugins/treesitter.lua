return {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    build = ":TSUpdate",
    config = function()
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end

        configs.setup(
            {
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "bash",
                    "json",
                    "yaml",
                    "regex",
                    "markdown",
                    "markdown_inline",
                    "css",
                    "javascript",
                    "typescript",
                    "python",
                    "query",
                    "sql"
                }, -- one of "all" or a list of languages
                ignore_install = {}, -- List of parsers to ignore installing
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = {} -- list of language that will be disabled
                },
                autopairs = {
                    enable = true
                },
                indent = {
                    enable = true,
                    disable = {
                        "python"
                    }
                }
            }
        )

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

    parser_config.jinja2 = {
        install_info = {
            url = "https://github.com/dbt-labs/tree-sitter-jinja2.git", -- local path or git repo
            files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
            -- optional entries:
            branch = "main", -- default branch in case of git repo if different from master
            -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
            -- requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
            },
        queries = {
            highlight = {
                -- Simple example query to highlight variables:
                "((variable_name) @variable)",
                -- Add more patterns for other elements as needed
            },
        },
        filetype = {"sql"}, -- if filetype does not match the parser name
    }
    end
}

