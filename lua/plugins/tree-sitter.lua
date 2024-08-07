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
    config = function()
      require("nvim-treesitter.install").prefer_git = true
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "vim",
          "vimdoc",
        },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(_, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 10000
          end,
        },
        indent = { enable = true },
      })
    end,
    build = ":TSUpdate",
  },
  {
    {
      "Wansmer/treesj",
      lazy = true,
      cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      opts = { use_default_keymaps = false },
    },
  },
}
