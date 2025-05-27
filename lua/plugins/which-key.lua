return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "coding" },
      { "<leader>d", group = "debug" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "search" },
      { "<leader>u", group = "ui" },
    },
  },
}
