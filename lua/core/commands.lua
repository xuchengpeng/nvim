local M = {}

local defaults = {
  {
    name = "ToggleFormatOnSave",
    callback = function()
      require("plugins.lsp.utils").toggle_format_on_save()
    end,
  },
}

function M.load_defaults()
  M.create_user_commands(defaults)
end

---Create user commands
---@param collection table the commands
function M.create_user_commands(collection)
  local utils = require("utils")
  local common_opts = { force = true }
  for _, cmd in pairs(collection) do
    local opts = utils.extend_tbl(common_opts, cmd.opts or {})
    vim.api.nvim_create_user_command(cmd.name, cmd.callback, opts)
  end
end

return M
