local M = {}

---Get user configuration directory
M.get_config_dir = function()
  return vim.fn.stdpath("config")
end

---Get user data directory
M.get_data_dir = function()
  return vim.fn.stdpath("data")
end

---Get runtime directory: temporary, local storage for sockets, named pipes, etc.
M.get_runtime_dir = function()
  return vim.fn.stdpath("run")
end

---Get session state directory: storage for file drafts, swap, undo, shada
M.get_state_dir = function()
  return vim.fn.stdpath("state")
end

---Get cache directory: arbitrary temporary storage for plugins, etc
M.get_cache_dir = function()
  return vim.fn.stdpath("cache")
end

local path_sep = vim.loop.os_uname().version:match("Windows") and "\\" or "/"

---Join path segments that were passed as input
---@return string
M.join_paths = function(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

--- Merge extended options with a default table of options
-- @param default the default table that you want to merge into
-- @param opts the new options that should be merged with the default table
-- @return the merged table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

--- Call function if a condition is met
-- @param func the function to run
-- @param condition a boolean value of whether to run the function or not
function M.conditional_func(func, condition, ...)
  -- if the condition is true or no condition is provided, evaluate the function with the rest of the parameters and return the result
  if condition and type(func) == "function" then
    return func(...)
  end
end

--- Serve a notification with a title of Nvim
-- @param msg the notification body
-- @param type the type of the notification (:help vim.log.levels)
-- @param opts table of nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function()
    vim.notify(msg, type, M.extend_tbl({ title = "Nvim" }, opts))
  end)
end

--- Trigger an user event
-- @param event the event name
M.event = function(event)
  vim.schedule(function()
    vim.api.nvim_exec_autocmds("User", { pattern = event })
  end)
end

return M
