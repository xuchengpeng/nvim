local M = {}

function M.load()
  require("config.defaults").load_defaults()
  require("config.keymaps").load_defaults()
  require("config.autocmds").load_defaults()
  require("config.lazy").setup()
end

return M
