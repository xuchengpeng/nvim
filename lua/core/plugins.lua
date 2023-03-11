return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("plugins.theme").load("tokyonight")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
      require("plugins.theme").load("onedark")
    end,
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "goolord/alpha-nvim",
    lazy = true,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.alpha").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.bufferline").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = { "VimEnter" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.lualine").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeCollapse",
      "NvimTreeRefresh",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  {
    "stevearc/aerial.nvim",
    lazy = true,
    cmd = { "AerialToggle" },
    config = function()
      require("plugins.aerial").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        build = "make",
      },
    },
    config = function()
      require("plugins.telescope").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("plugins.cmp").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "folke/neodev.nvim",
    },
    config = function()
      require("plugins.lsp").setup()
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = { "BufRead", "BufNewFile", "BufWinEnter" },
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    config = function()
      require("plugins.treesitter").setup()
    end,
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    event = { "BufReadPre" },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    config = true,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.indent-blankline").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = true,
      },
      {
        "jbyuki/one-small-step-for-vimkind",
      },
    },
    config = function()
      require("plugins.dap").setup()
    end,
  },
  {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.illuminate").setup()
    end,
  },
  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false },
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      {
        "rcarriga/nvim-notify",
        config = function()
          vim.notify = require("notify")
        end,
      },
    },
    config = function()
      require("plugins.noice").setup()
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      require("plugins.dressing").init()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    config = function()
      require("plugins.toggleterm").setup()
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = "Spectre",
    config = true,
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    dependencies = { "folke/twilight.nvim" },
    config = function()
      require("plugins.zen-mode").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("plugins.which-key").setup()
    end,
  },
}
