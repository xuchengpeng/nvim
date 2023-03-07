return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      lazy = true,
      build = "make",
    },
  },
  config = function()
    require("telescope").setup()
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("fzf")
  end,
  keys = {
    { "<leader>f", desc = "+Telescope" },
    { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    {
      "<leader>fg",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
      desc = "Live Grep (Args)",
    },
    { "<leader>fG", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recents Files" },
    { "<leader>fs", "<cmd>Telescope buffers<cr>", desc = "Switch Buffers" },
    { "<leader>ft", "<cmd>Telescope<cr>", desc = "Telescope" },
  },
}
