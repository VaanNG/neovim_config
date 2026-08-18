-- Load plugins from the appropriate tiers
-- Core always loads. Full layers on top when NVIM_TIER=full
local plugins = {}

-- Core plugins (always loaded)
local core_dir = vim.fn.stdpath("config") .. "/lua/plugins/core"
for _, file in ipairs(vim.split(vim.fn.glob(core_dir .. "/*.lua"), "\n")) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    table.insert(plugins, require("plugins.core." .. name))
end

-- Full plugins (loaded on top of core)
if vim.env.NVIM_TIER == "full" then
    local full_dir = vim.fn.stdpath("config") .. "/lua/plugins/full"
    for _, file in ipairs(vim.split(vim.fn.glob(full_dir .. "/*.lua"), "\n")) do
        local name = vim.fn.fnamemodify(file, ":t:r")
        table.insert(plugins, require("plugins.full." .. name))
    end
end

return plugins
