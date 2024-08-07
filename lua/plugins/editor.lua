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
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("colorizer").setup({
        user_default_options = {
          names = false,
        },
      })
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
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
