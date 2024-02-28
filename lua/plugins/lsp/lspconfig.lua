local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    -- ensure_installed = { "clangd", "lua_ls", "pyright", "vimls" }
  })

  local server_list = { "lua_ls", "clangd", "pyright", "vimls", "bashls", "cssls", "html", "jsonls", "tsserver" }
  for _, server_name in pairs(server_list) do
    local ok, opts = pcall(require, "plugins.lsp.providers." .. server_name)
    if not ok then
      opts = {}
    end
    require("lspconfig")[server_name].setup(opts)
  end

  require("lspconfig.ui.windows").default_options.border = "single"

  require("core.keymaps").set_keymaps("n", "K", { vim.lsp.buf.hover, { desc = "Hover" } })

  vim.diagnostic.config({ float = { border = "single" } })
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
end

return M
