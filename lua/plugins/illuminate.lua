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
      "NvimTree",
      "lazy",
      "lspinfo",
      "Trouble",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
  })
end

return M
