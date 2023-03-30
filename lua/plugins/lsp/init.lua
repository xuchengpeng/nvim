local M = {}

local function configure_format_on_save()
  local format = require("plugins.lsp.format")
  if lvim.format_on_save == true then
    format.enable_format_on_save()
  else
    format.disable_format_on_save()
  end
end

function M.get_active_client_names()
  local client_names = {}
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    if client.name == "null-ls" then
      local sources = {}
      for _, type in ipairs({ "FORMATTING", "DIAGNOSTICS" }) do
        for _, source in ipairs(require("plugins.lsp.null-ls").null_ls_sources(vim.bo.filetype, type)) do
          sources[source] = true
        end
      end
      local sources_name = vim.tbl_keys(sources)
      vim.list_extend(client_names, sources_name, 1, #sources_name)
    else
      table.insert(client_names, client.name)
    end
  end
  return client_names
end

function M.setup()
  require("plugins.lsp.lspconfig").setup()
  require("plugins.lsp.null-ls").setup()
  configure_format_on_save()
end

return M
