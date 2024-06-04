return {
  'rcarriga/nvim-notify'
  , version = '*'
  , config = function()
    local status_ok, notify = pcall(require, "notify")
    if not status_ok then
    return
    end
    notify.setup(
    {
      background_colour = "#000000", 
      fps = 30,
      icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
      },
      timeout = 3000,
      top_down = true
    }
    )
  vim.notify = require('notify') -- set default notification  
  end
}

