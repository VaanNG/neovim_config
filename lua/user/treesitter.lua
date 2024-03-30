local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = { 
    "lua"
    , "vim"
    , "vimdoc"
    , "bash"
    , "json"
    , "yaml"
    , "markdown"
    , "markdown_inline"
    , "css"
    , "javascript"
    , "typescript"
    , "python"
    , "query"
  }, -- one of "all" or a list of languages
	ignore_install = { 
  }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { 
    }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { 
    enable = true
    , disable = { 
      "python",
    }
  },
})
