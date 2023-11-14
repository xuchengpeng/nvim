local M = {}

function M.setup()
  require("ibl").setup({
    scope = { show_start = false, show_end = false },
    exclude = {
      buftypes = { "terminal", "nofile", "quickfix", "prompt" },
      filetypes = { "checkhealth", "help", "lazy", "lspinfo", "man", "mason", "neo-tree", "Trouble", "text" },
    },
  })
end

return M
