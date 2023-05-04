local M = {}

function M.setup()
  require("indent_blankline").setup({
    buftype_exclude = { "terminal", "nofile", "quickfix", "prompt" },
    filetype_exclude = {
      "checkhealth",
      "help",
      "lazy",
      "lspinfo",
      "man",
      "mason",
      "neo-tree",
      "Trouble",
      "text",
    },
    show_current_context = true,
    use_treesitter = true,
  })
end

return M
