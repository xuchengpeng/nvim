local M = {}

function M.load()
  _G.lvim = vim.deepcopy(require("core.settings"))
  require("core.options")
  require("core.keymaps").load_defaults()
  require("core.autocmds").load_defaults()
  require("core.commands").load_defaults()
  require("core.lazy").setup()
end

return M
