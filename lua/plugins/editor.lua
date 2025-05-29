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
    config = true,
    -- stylua: ignore
    keys = {
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
      { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
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
          "help",
          "lazy",
          "lspinfo",
          "mason",
          "neo-tree",
          "Outline",
          "snacks_dashboard",
          "spectre_panel",
          "toggleterm",
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
  {
    "folke/flash.nvim",
    lazy = true,
    event = { "User FileOpened" },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
