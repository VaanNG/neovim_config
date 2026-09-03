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

