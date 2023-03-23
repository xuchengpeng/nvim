local M = {}

function M.setup()
  local on_windows = vim.loop.os_uname().version:match("Windows")
  local eslint_opts = { command = on_windows and "eslint.cmd" or "eslint" }
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.code_actions.eslint.with(eslint_opts),
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.diagnostics.eslint.with(eslint_opts),
      null_ls.builtins.formatting.black.with({ extra_args = { "-l", "120" } }),
      null_ls.builtins.formatting.eslint.with(eslint_opts),
      null_ls.builtins.formatting.prettier.with({
        command = on_windows and "prettier.cmd" or "prettier",
        filetypes = { "html", "json", "jsonc", "yaml", "markdown" },
      }),
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.stylua,
    },
  })
end

return M
