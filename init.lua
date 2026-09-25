-- Add tree-sitter CLI to PATH (0.26.x needed for 'build' command)
if vim.uv then
    vim.env.PATH = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/bin" .. ":" .. vim.env.PATH
    vim.env.PATH = vim.fn.expand("~/.local/bin") .. ":" .. vim.env.PATH
end

-- load default globals
require("default.keymaps")
require("default.options")
require("default.autocommands")

-- load the local colorscheme from colors/gruvbox_dark.lua
vim.cmd.colorscheme("gruvbox_dark")

-- plugin manager load
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(
    "plugins",
    {
        change_detection = {
            notify = false
        }
    }
)

