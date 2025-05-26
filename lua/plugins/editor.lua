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
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
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
          "DressingSelect",
          "help",
          "lazy",
          "lspinfo",
          "mason",
          "NvimTree",
          "Outline",
          "snacks_dashboard",
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
