return {
    'akinsho/bufferline.nvim'
    -- , commit = '83bf4dc7bff642e145c8b4547aa596803a8b4dc4'
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
        }        
    end 
}