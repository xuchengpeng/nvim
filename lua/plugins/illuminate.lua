local M = {}

function M.setup()
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
      "mason",
      "neo-tree",
      "notify",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "TelescopePrompt",
      "Trouble",
    },
  })
end

return M
