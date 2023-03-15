local M = {}

local defaults = {
  {
    name = "ToggleFormatOnSave",
    callback = function()
      require("plugins.lsp").toggle_format_on_save()
    end,
  },
}

M.load_defaults = function()
  M.create_user_commands(defaults)
end

---Create user commands
---@param collection table the commands
M.create_user_commands = function(collection)
  local utils = require("utils")
  local common_opts = { force = true }
  for _, cmd in pairs(collection) do
    local opts = utils.extend_tbl(common_opts, cmd.opts or {})
    vim.api.nvim_create_user_command(cmd.name, cmd.callback, opts)
  end
end

return M
