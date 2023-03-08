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
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Hover doc" },
      { "<leader>l", desc = "+Lsp" },
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
      { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
      {
        "<leader>lf",
        function()
          vim.lsp.buf.format({
            async = true,
            timeout_ms = 2000, -- No effect if async=true
            filter = function(client)
              local filetype = vim.bo.filetype
              local n = require("null-ls")
              local s = require("null-ls.sources")
              local method = n.methods.FORMATTING
              local available_formatters = s.get_available(filetype, method)

              if #available_formatters > 0 then
                return client.name == "null-ls"
              elseif client.supports_method("textDocument/formatting") then
                return true
              else
                return false
              end
            end,
          })
        end,
        desc = "Format",
      },
      { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
      { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "<leader>lR", vim.lsp.buf.rename, desc = "Rename" },
      { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>ln", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
      { "<leader>lp", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
    },
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
          null_ls.builtins.formatting.black,
        },
      })
    end,
  },
}
