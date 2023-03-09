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
      "nvim-dap-ui",
      "nvim-tree",
      "quickfix",
      "toggleterm",
    },
  })
end

return M
