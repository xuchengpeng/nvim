local M = {}

local utils = require("utils")

--- Get a list of registered null-ls providers for a given filetype
-- @param filetype the filetype to search null-ls for
-- @return a list of null-ls sources
function M.null_ls_providers(filetype)
  local registered = {}
  -- try to load null-ls
  local sources_avail, sources = pcall(require, "null-ls.sources")
  if sources_avail then
    -- get the available sources of a given filetype
    for _, source in ipairs(sources.get_available(filetype)) do
      -- get each source name
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
  end
  -- return the found null-ls sources
  return registered
end

--- Get the null-ls sources for a given null-ls method
-- @param filetype the filetype to search null-ls for
-- @param method the null-ls method (check null-ls documentation for available methods)
-- @return the available sources for the given filetype and method
function M.null_ls_sources(filetype, method)
  local methods_avail, methods = pcall(require, "null-ls.methods")
  return methods_avail and M.null_ls_providers(filetype)[methods.internal[method]] or {}
end

---filter passed to vim.lsp.buf.format
---always selects null-ls if it's available and caches the value per buffer
---@param client table client attached to a buffer
---@return boolean if client matches
function M.format_filter(client)
  local filetype = vim.bo.filetype
  local null_ls = require("null-ls")
  local sources = require("null-ls.sources")
  local method = null_ls.methods.FORMATTING
  local available_formatters = sources.get_available(filetype, method)

  if #available_formatters > 0 then
    return client.name == "null-ls"
  elseif client.supports_method("textDocument/formatting") then
    return true
  else
    return false
  end
end

---Simple wrapper for vim.lsp.buf.format() to provide defaults
---@param opts table|nil
function M.format(opts)
  opts = opts or { async = true }
  opts.filter = opts.filter or M.format_filter
  vim.lsp.buf.format(opts)
end

function M.enable_format_on_save()
  require("core.autocmds").create_autocmds({
    {
      "BufWritePre",
      {
        group = "_lsp_format_on_save",
        callback = function()
          M.format({ timeout_ms = 2000 })
        end,
      },
    },
  })
  utils.notify("enabled format-on-save")
end

function M.disable_format_on_save()
  require("core.autocmds").clear_autocmds("_lsp_format_on_save")
  utils.notify("disabled format-on-save")
end

function M.toggle_format_on_save()
  local exists, autocmd = pcall(vim.api.nvim_get_autocmds, {
    group = "_lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmd == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

return M
