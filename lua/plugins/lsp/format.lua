local M = {}

local utils = require("utils")

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
end

function M.disable_format_on_save()
  require("core.autocmds").clear_autocmds("_lsp_format_on_save")
end

function M.toggle_format_on_save()
  local exists, autocmd = pcall(vim.api.nvim_get_autocmds, {
    group = "_lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmd == 0 then
    M.enable_format_on_save()
    utils.notify("Enabled format-on-save")
  else
    M.disable_format_on_save()
    utils.notify("Disabled format-on-save")
  end
end

return M
