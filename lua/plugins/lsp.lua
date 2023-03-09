local M = {}

M.setup = function()
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

  require("core.keymaps").set_keymaps("n", "K", { vim.lsp.buf.hover, { desc = "Hover" } })

  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.black,
    },
  })
end

---Simple wrapper for vim.lsp.buf.format() to provide defaults
M.format = function()
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
end

return M
