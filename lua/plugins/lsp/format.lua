local M = {}

local utils = require("utils")

---Simple wrapper for vim.lsp.buf.format() to provide defaults
---@param opts table|nil
function M.format(opts)
  opts = opts or { async = true }
  local ok, conform = pcall(require, "conform")
  if ok then
    opts.lsp_fallback = true
    conform.format(opts)
  else
    vim.lsp.buf.format(opts)
  end
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
