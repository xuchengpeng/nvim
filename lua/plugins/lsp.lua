return {
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
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- ensure_installed = { "clangd", "lua_ls", "pyright", "vimls" }
      })

      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      require("lspconfig").clangd.setup({})
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
        },
      })
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lspsaga").setup()
    end,
    keys = {
      { "K", "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
      { "<leader>l", desc = "+Lsp" },
      { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto definition" },
      { "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", desc = "Find definition" },
      { "<leader>lF", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
      { "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
      { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
      { "<leader>lt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto type definition" },
      { "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Diagnostic next" },
      { "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Diagnostic prev" },
    },
  },
}
