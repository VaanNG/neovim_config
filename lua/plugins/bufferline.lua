return {
  'akinsho/bufferline.nvim'
  , version = '*'
  , dependencies = {
    'nvim-tree/nvim-web-devicons'
    , 'moll/vim-bbye' -- close current buffer
  }
  , config = function()
    local status_ok, bufferline = pcall(require, "bufferline")
    if not status_ok then
      return
    end
    bufferline.setup {
      highlights = {
        buffer_selected = {
          fg = '#c2df83',
          bold = true,
          italic = true,
        },
        fill = {
          fg = '#000000',
        }
      },
      -- options = {
      --   offsets = {
      --     filetype = "NvimTree",
      --     text = "File Explorer",
      --     separator = true
      --   }
      -- }
    }
  end
}
