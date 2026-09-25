return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    main = "nvim-treesitter",
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
            require("nvim-treesitter").install(parsersToInstall)
        end

        -- Enable treesitter per buffer
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
