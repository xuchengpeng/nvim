local M = {}

M.setup = function()
  require("zen-mode").setup({
    window = {
      backdrop = 0.95,
      width = 0.8,
      height = 1,
    },
  })
end

return M
