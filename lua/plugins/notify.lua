local M = {}

function M.setup()
  local notify = require("notify")
  notify.setup({
    timeout = 3000,
    max_width = 80,
  })
  vim.notify = notify
end

return M
