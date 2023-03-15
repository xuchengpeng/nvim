local M = {}

M.load = function()
  require("core.defaults").load_defaults()
  require("core.keymaps").load_defaults()
  require("core.autocmds").load_defaults()
  require("core.commands").load_defaults()
  require("core.lazy").setup()
end

return M
