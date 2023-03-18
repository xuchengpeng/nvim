local M = {}

local utils = require("utils")

M.setup = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    -- ensure_installed = { "clangd", "lua_ls", "pyright", "vimls" }
  })

  require("lspconfig").lua_ls.setup({
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME"),
            utils.get_config_dir(),
            require("neodev.config").types(),
          },
          maxPreload = 5000,
          preloadFileSize = 10000,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  require("lspconfig").clangd.setup({
    cmd = {
      "clangd",
      "--all-scopes-completion",
      "--background-index",
      "--clang-tidy",
      -- "--compile-commands-dir=cmake-build",
      "--completion-style=detailed",
      "--fallback-style=LLVM",
      "--function-arg-placeholders=false",
      "--header-insertion=iwyu",
      "--header-insertion-decorators",
      "--pretty",
      "--enable-config",
      "--pch-storage=memory",
      "-j=12",
    },
  })

  require("lspconfig").pyright.setup({})
  require("lspconfig").vimls.setup({})
  require("lspconfig").bashls.setup({})

  require("core.keymaps").set_keymaps("n", "K", { vim.lsp.buf.hover, { desc = "Hover" } })

  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.black,
    },
  })
end

---filter passed to vim.lsp.buf.format
---always selects null-ls if it's available and caches the value per buffer
---@param client table client attached to a buffer
---@return boolean if client matches
M.format_filter = function(client)
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
end

---Simple wrapper for vim.lsp.buf.format() to provide defaults
---@param opts table|nil
M.format = function(opts)
  opts = opts or { async = true }
  opts.filter = opts.filter or M.format_filter
  vim.lsp.buf.format(opts)
end

M.enable_format_on_save = function()
  require("core.autocmds").create_autocmds({
    {
      "BufWritePre",
      {
        group = "_lsp_format_on_save",
        callback = function()
          M.format({ timeout_ms = 2000 })
        end,
      },
    },
  })
  utils.notify("enabled format-on-save")
end

M.disable_format_on_save = function()
  require("core.autocmds").clear_autocmds("_lsp_format_on_save")
  utils.notify("disabled format-on-save")
end

M.toggle_format_on_save = function()
  local exists, autocmd = pcall(vim.api.nvim_get_autocmds, {
    group = "_lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmd == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

return M
