local M = {}

local function configure_format_on_save()
  local format = require("plugins.lsp.format")
  if lvim.format_on_save == true then
    format.enable_format_on_save()
  else
    format.disable_format_on_save()
  end
end

function M.setup()
  require("plugins.lsp.lspconfig").setup()
  require("plugins.lsp.null-ls").setup()
  configure_format_on_save()
end

return M
