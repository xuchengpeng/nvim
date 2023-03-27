local M = {}

local function lsp_client_names()
  local buf_client_names = {}
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    if client.name == "null-ls" then
      local sources = {}
      for _, type in ipairs({ "FORMATTING", "DIAGNOSTICS" }) do
        for _, source in ipairs(require("plugins.lsp.utils").null_ls_sources(vim.bo.filetype, type)) do
          sources[source] = true
        end
      end
      local sources_name = vim.tbl_keys(sources)
      vim.list_extend(buf_client_names, sources_name, 1, #sources_name)
    else
      table.insert(buf_client_names, client.name)
    end
  end
  if #buf_client_names == 0 then
    return ""
  end
  return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

function M.setup()
  require("lualine").setup({
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "alpha", "lazy", "lspinfo" },
        winbar = {
          "aerial",
          "alpha",
          "dap-repl",
          "dap-terminal",
          "dapui_console",
          "dapui_hover",
          "DressingSelect",
          "help",
          "lazy",
          "neo-tree",
          "notify",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "Trouble",
        },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1, separator = "" }, "diagnostics" },
      lualine_x = { lsp_client_names },
      lualine_y = { "encoding", { "fileformat", symbols = { unix = "unix", dos = "dos", mac = "mac" } }, "filetype" },
      lualine_z = {
        { "location", separator = " ", padding = { left = 1, right = 0 } },
        { "progress", padding = { left = 0, right = 1 } },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location", "progress" },
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_c = { "aerial" },
    },
    inactive_winbar = {
      lualine_c = {
        {
          "filename",
          file_status = false,
          newfile_status = false,
          path = 1,
        },
      },
    },
    extensions = {
      "aerial",
      "fzf",
      "man",
      "neo-tree",
      "nvim-dap-ui",
      "quickfix",
      "toggleterm",
    },
  })
end

return M
