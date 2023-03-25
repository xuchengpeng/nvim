local M = {}

function M.setup()
  require("aerial").setup({
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = {
      min_width = 25,
    },
    attach_mode = "global",
    filter_kind = false,
    show_guides = true,
    guides = {
      mid_item = "├ ",
      last_item = "└ ",
      nested_top = "│ ",
      whitespace = "  ",
    },
  })
end

return M
