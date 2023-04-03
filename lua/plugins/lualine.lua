local M = {}

local icons = require("utils.icons")

local function lsp_client_names()
  local buf_client_names = require("plugins.lsp").get_active_client_names()
  if #buf_client_names == 0 then
    return ""
  end
  return icons.ui.Gears .. " [" .. table.concat(buf_client_names, ", ") .. "]"
end

function M.setup()
  require("lualine").setup({
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "alpha", "lspinfo" },
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
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { { "diagnostics", separator = "" }, lsp_client_names },
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
      "lazy",
      "man",
      "neo-tree",
      "nvim-dap-ui",
      "quickfix",
      "toggleterm",
    },
  })
end

return M
