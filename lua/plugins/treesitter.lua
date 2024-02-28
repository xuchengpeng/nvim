local M = {}

function M.setup()
  require("nvim-treesitter.install").prefer_git = true
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "vim",
      "vimdoc",
    },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
      disable = function(_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 10000
      end,
    },
    indent = { enable = true },
  })
end

return M
