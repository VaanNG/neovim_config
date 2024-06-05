return {
  'gelguy/wilder.nvim'
    , enabled = false
  , build = ':UpdateRemotePlugins'
  , config = function()
    local status_ok, wilder = pcall(require, 'wilder')
    if not status_ok then
    return
    end

    wilder.setup({
      modes = {':', '/', '?'},
      next_key = '<Tab>',
      previous_key = '<S-Tab>',
      accept_key = '<Down>',
      reject_key = '<Up>'
    })

    wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline({
      -- sets the language to use, 'vim' and 'python' are supported
      language = 'python',
      -- 0 turns off fuzzy matching
      -- 1 turns on fuzzy matching
      -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
      fuzzy = 2,
      }),
      wilder.python_search_pipeline({
      -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
      pattern = wilder.python_fuzzy_pattern(),
      -- omit to get results in the order they appear in the buffer
      sorter = wilder.python_difflib_sorter(),
      -- can be set to 're2' for performance, requires pyre2 to be installed
      -- see :h wilder#python_search() for more details
      engine = 're',
      })
    ),
    })

    -- DEFAULT LIKE DEFAULT
    -- wilder.set_option('renderer', wilder.wildmenu_renderer({
    --   -- wilder.wildmenu_lualine_theme({
    --     highlights = {
    --       default = 'StatusLine',
    --       accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#cfee8a', background = 'bg_color'}}),
    --     },
    --     highlighter = wilder.basic_highlighter(),
    --     separator = ' · ',
    --   })
    -- })
    -- )

    -- POPUP MENU
    wilder.set_option('renderer', wilder.popupmenu_renderer({
    highlights = {
      default = 'StatusLine',
      accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#cfee8a', background = 'bg_color'}}),
    },
    highlighter = wilder.basic_highlighter(),
    left = {' ', wilder.popupmenu_devicons()},
    }))

    -- MENU
    -- wilder.set_option('renderer', wilder.popupmenu_renderer(
    --   wilder.popupmenu_palette_theme({
    --     -- 'single', 'double', 'rounded' or 'solid'
    --     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    --     highlights = {
    --       default = 'StatusLine',
    --       accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#cfee8a', background = 'bg_color'}}),
    --     },
    --     highlighter = wilder.basic_highlighter(),
    --     border = 'rounded',
    --     max_height = '50%',      -- max height of the palette
    --     min_height = '50%',          -- set to the same as 'max_height' for a fixed height window
    --     max_width = '50%',
    --     min_width = '50%',
    --     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
    --     reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
    --   })
    -- ))
  end
}
