return {
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "User FileOpened" },
    config = true,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble" },
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = true,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
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
          "NvimTree",
          "notify",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "TelescopePrompt",
          "Trouble",
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "User FileOpened" },
    config = true,
  },
}
