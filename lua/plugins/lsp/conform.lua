local M = {}

function M.setup()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      sh = { "shfmt" },
    },
    formatters = {
      black = {
        prepend_args = { "-l", "120" },
      },
    },
  })
end

return M
