return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    main = "nvim-treesitter",
    lazy = false, -- main branch does not support lazy-loading
    build = ":TSUpdate", -- parsers must match the plugin version after updates
    init = function()
        -- Ensure parsers are installed (skip if already installed)
        local ensureInstalled = {
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
            "sql",
        }
        local alreadyInstalled = require("nvim-treesitter.config").get_installed()
        local parsersToInstall = {}
        for _, parser in ipairs(ensureInstalled) do
            if not vim.tbl_contains(alreadyInstalled, parser) then
                table.insert(parsersToInstall, parser)
            end
        end
        if #parsersToInstall > 0 then
            -- Building parsers needs the tree-sitter CLI (0.26.1+) and a C compiler
            if vim.fn.executable("tree-sitter") == 1 then
                require("nvim-treesitter").install(parsersToInstall)
            else
                vim.notify("nvim-treesitter: tree-sitter CLI not found, skipping parser install", vim.log.levels.WARN)
            end
        end

        -- Enable treesitter per buffer
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                if pcall(vim.treesitter.start) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
