return {
    "nvim-tree/nvim-tree.lua"
    , version = "*"
    , lazy = false
    , dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
    , config = function()
        local status_ok, nvim_tree = pcall(require, "nvim-tree")
        if not status_ok then
          return
        end
        
        nvim_tree.setup {
          update_focused_file = {
            enable = true,
            update_cwd = true,
          },
          git = {
            enable = true,
            ignore = false,
            show_on_dirs = true,
            timeout = 400,
          },
          renderer = {
            root_folder_modifier = ":t",
            icons = {
              glyphs = {
                default = "",
                symlink = "",
                folder = {
                  arrow_open = "",
                  arrow_closed = "",
                  default = "",
                  open = "",
                  empty = "",
                  empty_open = "",
                  symlink = "",
                  symlink_open = "",
                },
                git = {
                  unstaged = "",
                  staged = "S",
                  unmerged = "",
                  renamed = "➜",
                  untracked = "U",
                  deleted = "",
                  ignored = "◌",
                },
              },
            },
          },
          diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
              hint = "",
              info = "",
              warning = "",
              error = "",
            },
          },
          view = {
            adaptive_size = true,
            width = 20,
            side = "left",
            -- mappings = {
            --     -- ["<C-[>"] = "dir_up",
            --   list = {
            -- --     { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            -- --     { key = "h", cb = tree_cb "close_node" },
            -- --     { key = "v", cb = tree_cb "vsplit" },
            --     { key = "<C-[>", cb = tree_cb "dir_up" },
            --   },
            -- },
          },
        }        
    end
}