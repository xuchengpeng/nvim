local M = {}

M.get_config_dir = function()
  return vim.fn.stdpath("config")
end

M.get_data_dir = function()
  return vim.fn.stdpath("data")
end

M.get_runtime_dir = function()
  return vim.fn.stdpath("run")
end

M.get_state_dir = function()
  return vim.fn.stdpath("state")
end

local path_sep = vim.loop.os_uname().version:match("Windows") and "\\" or "/"

---Join path segments that were passed as input
---@return string
M.join_paths = function(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

--- Trigger an user event
-- @param event the event name
M.event = function(event)
  vim.schedule(function()
    vim.api.nvim_exec_autocmds("User", { pattern = event })
  end)
end

return M
