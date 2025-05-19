-- plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    version = "*",
    event = "VeryLazy",
    config = function()
      -- Setup basic LSP signs and diagnostic behavior
      local signs = {
        Error = "", Warn = "", Hint = "", Info = ""
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Manual LSP server setup (example: Lua and Python)
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      })

      lspconfig.pyright.setup({})

    end
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    version = "*",
    build = ":MasonUpdate", -- optional
    config = function()
      require("mason").setup()
    end
  }
}

