local M = {}

function M.setup()
  require("ibl").setup({
    exclude = {
      buftypes = { "terminal", "nofile", "quickfix", "prompt" },
      filetypes = { "checkhealth", "help", "lazy", "lspinfo", "man", "mason", "neo-tree", "Trouble", "text" },
    },
  })
end

return M
