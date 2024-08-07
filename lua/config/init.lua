local M = {}

function M.setup()
  _G.lvim = vim.deepcopy(require("config.settings"))
  require("config.options")
  require("config.keymaps")
  require("config.autocmds")
  require("config.lazy")
  vim.cmd.colorscheme(lvim.colorscheme)
end

return M
