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
      shfmt = {
        prepend_args = { "-i", "4" },
      },
    },
  })
end

return M
