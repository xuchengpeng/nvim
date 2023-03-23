local M = {}

function M.setup()
  require("plugins.lsp.lspconfig").setup()
  require("plugins.lsp.null-ls").setup()
end

return M
