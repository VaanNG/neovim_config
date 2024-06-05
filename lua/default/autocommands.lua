-- General settings
vim.api.nvim_create_augroup("_general_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "_general_settings",
    pattern = { "qf", "help", "man", "lspinfo" },
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "q", ":close<CR>", { silent = true })
    end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "_general_settings",
    callback = function()
        vim.highlight.on_yank({ higroup = "vim.apiisual", timeout = 200 })
    end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = "_general_settings",
    callback = function()
        vim.opt_local.formatoptions:remove("cro")
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    group = "_general_settings",
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- Git settings
vim.api.nvim_create_augroup("_git", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "_git",
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Markdown settings
vim.api.nvim_create_augroup("_markdown", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "_markdown",
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- Auto resize
vim.api.nvim_create_augroup("_auto_resize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
    group = "_auto_resize",
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
