return {
  {
    "folke/tokyonight.nvim",
    lazy = lvim.colorscheme ~= "tokyonight",
    config = function()
      require("plugins.theme").load("tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = lvim.colorscheme ~= "catppuccin",
    name = "catppuccin.nvim",
    config = function()
      require("plugins.theme").load("catppuccin")
    end,
  },
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim",        lazy = true },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VimEnter",
    config = function()
      require("plugins.notify").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = true,
    event = "VimEnter",
    config = function()
      require("plugins.alpha").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = lvim.statusline == "lualine",
    lazy = true,
    event = { "VimEnter" },
    config = function()
      require("plugins.bufferline").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = lvim.statusline == "lualine",
    lazy = true,
    event = { "VimEnter" },
    config = function()
      require("plugins.lualine").setup()
    end,
  },
  {
    "rebelot/heirline.nvim",
    enabled = lvim.statusline == "heirline",
    lazy = true,
    event = { "VimEnter" },
    config = function()
      require("plugins.heirline").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    cmd = { "Neotree" },
    config = function()
      require("plugins.neo-tree").setup()
    end,
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
      { "nvim-telescope/telescope-fzf-native.nvim", lazy = true, build = "make" },
    },
    config = function()
      require("plugins.telescope").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
      { "saadparwaiz1/cmp_luasnip" },
    },
    config = function()
      require("plugins.cmp").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "folke/neodev.nvim",
    },
    config = function()
      require("plugins.lsp").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = { "User FileOpened" },
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treeitter** module to be loaded in time.
      -- Luckily, the only thins that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    config = function()
      require("plugins.treesitter").setup()
    end,
    build = ":TSUpdate",
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
    event = { "User FileOpened" },
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
    event = { "User FileOpened" },
    main = "ibl",
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
    event = { "User FileOpened" },
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
    event = { "User FileOpened" },
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      require("plugins.dressing").init()
    end,
    config = function()
      require("plugins.dressing").setup()
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
