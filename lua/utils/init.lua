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

return M
