return {
  'neovim/nvim-lspconfig'
  , dependencies = {
    'williamboman/mason.nvim'
    , 'williamboman/mason-lspconfig.nvim'
  }
  , config = function()
    local status_ok, lspconfig = pcall(require, "lspconfig")
    if not status_ok then
      return
    end
    local signs = {

      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
    local config = {
      virtual_text = true,
      signs = {
        active = signs, -- show signs
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }
    vim.diagnostic.config(config)

    require("mason").setup{
      ui = {
        border = "rounded",     -- UI window border style
        icons = {               -- Customize icons
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      log_level = vim.log.levels.INFO,  -- Set log level (INFO, DEBUG, etc.)
      max_concurrent_installers = 4,   -- Limit concurrent installations
    }
    local servers = {
      'lua_ls' --lua
      , 'pyright' -- python
    }
    require("mason-lspconfig").setup{
      ensure_installed = servers
    }
    lspconfig.lua_ls.setup{
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }
    lspconfig.pyright.setup{
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
          },
        },
      },
    }
  end
}
