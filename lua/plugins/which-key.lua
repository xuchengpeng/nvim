return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Coding" },
      { "<leader>d", group = "Debug" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>s", group = "Search" },
    },
  },
}
