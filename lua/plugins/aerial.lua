local M = {}

M.setup = function()
  require("aerial").setup({
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = {
      min_width = 25,
    },
  })
end

return M
