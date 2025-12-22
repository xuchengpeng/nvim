return {
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
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
    },
    build = ":TSUpdate",
  },
  {
    {
      "Wansmer/treesj",
      lazy = true,
      cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      opts = { use_default_keymaps = false },
      keys = {
        { "<leader>cj", "<cmd>TSJJoin<cr>", desc = "Join" },
        { "<leader>cs", "<cmd>TSJSplit<cr>", desc = "Split" },
      },
    },
  },
}
