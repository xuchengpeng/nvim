local M = {}

local function configure_format_on_save()
  local format = require("plugins.lsp.format")
  if lvim.format_on_save == true then
    format.enable_format_on_save()
  else
    format.disable_format_on_save()
  end
end

function M.get_active_client_names()
  local ret = {}
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    table.insert(ret, client.name)
  end
  return ret
end

function M.setup()
  require("plugins.lsp.lspconfig").setup()
  require("plugins.lsp.conform").setup()
  configure_format_on_save()
end

return M
