local M = {}

function M.setup()
  local notify = require("notify")
  notify.setup({
    timeout = 3000,
    max_width = 80,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { border = "single" })
    end,
  })
  vim.notify = notify
end

return M
