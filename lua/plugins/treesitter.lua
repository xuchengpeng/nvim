local M = {}

local utils = require("utils")

function M.setup()
  local path = utils.join_paths(utils.get_data_dir(), "lazy", "nvim-treesitter")
  vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
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
