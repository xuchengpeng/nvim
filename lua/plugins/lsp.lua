return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
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

      -- stylua: ignore
      require("which-key").add({
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
        { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help" },
        { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help" },
        { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
        { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" } },
        { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } },
        { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
        { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode = { "n" } },
        { "<leader>cs", function() Snacks.picker.lsp_symbols() end, desc = "Symbols" },
        { "<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
      })
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
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format",
      },
    },
  },
}
