return {
  {
    "folke/tokyonight.nvim",
    lazy = lvim.colorscheme ~= "tokyonight",
    opts = {
      style = "moon",
      light_style = "day",
      styles = {
        keywords = { italic = false },
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = lvim.colorscheme ~= "catppuccin",
    name = "catppuccin.nvim",
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      styles = {
        conditionals = {},
      },
    },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "File Explorer" },
    },
    opts = {
      sources = { "filesystem", "buffers", "git_status" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "aerial" },
      window = {
        width = 30,
        mappings = {
          ["h"] = "close_node",
          ["l"] = "open",
          ["<space>"] = "none",
        },
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    },
  },
}
