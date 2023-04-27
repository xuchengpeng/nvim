local M = {}

function M.setup()
  local notify = require("notify")
  notify.setup({
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { border = "single" })
    end,
  })
  vim.notify = notify
end

return M
