return {
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
}
