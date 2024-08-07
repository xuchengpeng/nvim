return {
  "stevearc/aerial.nvim",
  lazy = true,
  cmd = { "AerialToggle" },
  opts = {
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = {
      max_width = { 30, 0.2 },
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
  },
}
