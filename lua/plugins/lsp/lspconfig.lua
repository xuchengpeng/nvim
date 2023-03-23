local M = {}

function M.setup()
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
            require("utils").get_config_dir(),
            require("neodev.config").types(),
          },
          maxPreload = 5000,
          preloadFileSize = 10000,
          checkThirdParty = false,
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
    capabilities = {
      offsetEncoding = "utf-8",
    },
  })

  require("lspconfig").pyright.setup({})
  require("lspconfig").vimls.setup({})
  require("lspconfig").bashls.setup({})

  require("core.keymaps").set_keymaps("n", "K", { vim.lsp.buf.hover, { desc = "Hover" } })
end

return M
