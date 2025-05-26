return {
  {
    "folke/tokyonight.nvim",
    lazy = lvim.colorscheme ~= "tokyonight",
    opts = {
      style = "moon",
      light_style = "day",
      styles = {
        keywords = { italic = false },
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = lvim.colorscheme ~= "catppuccin",
    name = "catppuccin.nvim",
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      styles = {
        conditionals = {},
      },
    },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = { "NvimTreeOpen" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = { "VimEnter" },
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = {
            statusline = { "lspinfo", "snacks_dashboard" },
            winbar = {
              "aerial",
              "dap-repl",
              "dap-terminal",
              "dapui_console",
              "dapui_hover",
              "DressingSelect",
              "help",
              "lazy",
              "NvimTree",
              "Outline",
              "snacks_dashboard",
              "spectre_panel",
              "toggleterm",
              "Trouble",
            },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { { "filename", path = 1, separator = "" }, { "filesize", separator = "" }, "diagnostics" },
          lualine_x = { { "lsp_status", icon = "" } },
          lualine_y = {
            "encoding",
            { "fileformat", symbols = { unix = "unix", dos = "dos", mac = "mac" } },
            "filetype",
          },
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
          lualine_c = { { "filename", file_status = false, newfile_status = false, path = 0 }, "aerial" },
        },
        inactive_winbar = {
          lualine_c = { { "filename", file_status = false, newfile_status = false, path = 1 } },
        },
        extensions = {
          "aerial",
          "fzf",
          "lazy",
          "man",
          "mason",
          "nvim-dap-ui",
          "nvim-tree",
          "quickfix",
          "toggleterm",
          "trouble",
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = true,
    event = { "VimEnter" },
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        width = 50,
        preset = {
          keys = {
            { key = "f", icon = "", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { key = "n", icon = "", desc = "New File", action = ":enew" },
            { key = "g", icon = "", desc = "Grep Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { key = "r", icon = "", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              key = "c",
              icon = "",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { key = "l", icon = "󰒲", desc = "Lazy", action = ":Lazy" },
            { key = "q", icon = "", desc = "Quit", action = ":qa" },
          },
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      scope = { enabled = true },
    },
  },
}
