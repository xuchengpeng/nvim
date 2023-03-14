local M = {}

M.setup = function()
  require("lualine").setup({
    options = {
      disabled_filetypes = { statusline = { "alpha", "lazy" } },
    },
    extensions = {
      "aerial",
      "fzf",
      "man",
      "neo-tree",
      "nvim-dap-ui",
      "quickfix",
      "toggleterm",
    },
  })
end

return M
