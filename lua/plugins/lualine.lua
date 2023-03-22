local M = {}

function M.setup()
  require("lualine").setup({
    options = {
      disabled_filetypes = {
        statusline = { "alpha", "lazy" },
        winbar = {
          "aerial",
          "alpha",
          "dap-repl",
          "dap-terminal",
          "dapui_console",
          "dapui_hover",
          "DressingSelect",
          "lazy",
          "help",
          "neo-tree",
          "notify",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "Trouble",
        },
      },
    },
    winbar = {
      lualine_c = { "aerial" },
    },
    inactive_winbar = {},
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
