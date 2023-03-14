local M = {}

M.setup = function()
  require("indent_blankline").setup({
    buftype_exclude = { "terminal", "nofile", "quickfix", "prompt" },
    filetype_exclude = {
      "checkhealth",
      "help",
      "lazy",
      "lspinfo",
      "man",
      "neo-tree",
      "Trouble",
      "text",
    },
    show_current_context = true,
    use_treesitter = true,
  })
end

return M
