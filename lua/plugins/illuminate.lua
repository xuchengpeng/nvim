local M = {}

M.setup = function()
  require("illuminate").configure({
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 200,
    filetypes_denylist = {
      "aerial",
      "alpha",
      "DressingSelect",
      "help",
      "lazy",
      "lspinfo",
      "neo-tree",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "TelescopePrompt",
      "Trouble",
    },
  })
end

return M
