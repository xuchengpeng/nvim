return {
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- ensure_installed = { "clangd", "lua_ls", "pyright" }
      })
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
      lspconfig.cssls.setup({})
      lspconfig.html.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.ts_ls.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      if lvim.format_on_save == true then
        vim.api.nvim_create_augroup("_lsp_format_on_save", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = "_lsp_format_on_save",
          callback = function()
            require("conform").format({ timeout_ms = 2000, lsp_format = "fallback" })
          end,
        })
      else
        vim.schedule(function()
          pcall(function()
            vim.api.nvim_del_augroup_by_name("_lsp_format_on_save")
          end)
        end)
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        sh = { "shfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "4" },
        },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    },
  },
}
