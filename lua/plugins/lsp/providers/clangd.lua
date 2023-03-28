return {
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
}
