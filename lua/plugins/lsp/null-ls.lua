local M = {}

--- Get a list of registered null-ls providers for a given filetype
-- @param filetype the filetype to search null-ls for
-- @return a list of null-ls sources
function M.null_ls_providers(filetype)
  local registered = {}
  -- try to load null-ls
  local sources_avail, sources = pcall(require, "null-ls.sources")
  if sources_avail then
    -- get the available sources of a given filetype
    for _, source in ipairs(sources.get_available(filetype)) do
      -- get each source name
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
  end
  -- return the found null-ls sources
  return registered
end

--- Get the null-ls sources for a given null-ls method
-- @param filetype the filetype to search null-ls for
-- @param method the null-ls method (check null-ls documentation for available methods)
-- @return the available sources for the given filetype and method
function M.null_ls_sources(filetype, method)
  local methods_avail, methods = pcall(require, "null-ls.methods")
  return methods_avail and M.null_ls_providers(filetype)[methods.internal[method]] or {}
end

function M.setup()
  local on_windows = vim.loop.os_uname().version:match("Windows")
  local eslint_opts = { command = on_windows and "eslint.cmd" or "eslint" }
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.code_actions.eslint.with(eslint_opts),
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.diagnostics.eslint.with(eslint_opts),
      null_ls.builtins.formatting.black.with({ extra_args = { "-l", "120" } }),
      null_ls.builtins.formatting.eslint.with(eslint_opts),
      null_ls.builtins.formatting.prettier.with({
        command = on_windows and "prettier.cmd" or "prettier",
        filetypes = { "html", "json", "jsonc", "yaml", "markdown" },
      }),
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.stylua,
    },
  })
end

return M
