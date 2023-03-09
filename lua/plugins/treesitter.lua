local M = {}

M.setup = function()
  local path = vim.fn.stdpath("data") .. "/lazy" .. "/nvim-treesitter"
  vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "help",
      "lua",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "vim",
    },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
    },
  })
end

return M
