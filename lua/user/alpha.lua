local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣦⡀⠀⠀⣿⣤⠤⠴⠶⠶⠒⠒⠒⠒⠒⠶⠶⠤⣤⣼⣿⣿⠇⠀⣶⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣽⣿⣿⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠀⣤⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠃⢀⠠⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠀⠀⠐⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠤⣤⣀⣀⣀⡀⠀⠀⣠⣿⣿⣿⣿⠊⠀⠰⢿⠿⠀⢢⠀⠀⠀⠠⠤⠤⣄⣀⣀⠀⠄⠀⠀⠀⢠⠋⢿⣿⠆⠈⢢⠀⠘⣧⡀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠉⠉⠙⠛⣿⣿⣿⣿⣿⠏⠢⣀⠀⠀⣀⡠⠊⠀⠀⠀⠀⠀⠉⠛⠛⠉⠁⠀⠀⠀⠀⠸⣄⠀⠀⠀⢀⠜⠀⣠⡼⢷⠒⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀",
"⠉⠙⠛⠒⠒⠒⠲⠶⣶⣿⣿⣿⣿⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠠⠤⠼⢷⡤⠤⠤⠤⠤⠤⠤⠤⠤⠀⠀",
"⠀⠀⠀⠀⠀⢀⣀⣀⣿⣿⣿⣿⣿⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠺⢷⡶⠶⠦⣤⣤⣄⣀⠀⠀⠀",
"⠀⠒⠛⠛⠉⠉⢉⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣄⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⣀⣤⣶⠶⠖⠛⠋⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠓⠲⠦⢤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⠀⠀⠀⠀⠀",
"⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣯⡤⠖⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠳⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠳⣄⠀⠀⠀",

}

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":FzfLua files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("t", "  Find text", ":FzfLua live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
    local function get_table_size(t)
      local count = 0
      for _, __ in pairs(t) do
        count = count + 1
      end
      return count
    end
    local opt, start = require('packer.plugin_utils').list_installed_plugins()
    local plugin_count = get_table_size(opt) + get_table_size(start)
    local version = vim.version()
    local nvim_version_info = " v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return string.format(
        "The Nugget |  %d plugins 🟢 | %s",
        plugin_count,
        nvim_version_info
    )
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
