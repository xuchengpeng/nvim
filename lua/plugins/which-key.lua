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
      { "<leader>p", group = "Plugins" },
      { "<leader>ph", "<cmd>Lazy home<cr>", desc = "Home" },
      { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
      { "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log" },
      { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile" },
      { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Install,Clean,Update" },
      { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },
      { "<leader>px", "<cmd>Lazy clean<cr>", desc = "Clean" },
      { "<leader>s", group = "Search" },
      { "<leader>q", "<cmd>confirm quit<cr>", desc = "Quit" },
    },
  },
}
