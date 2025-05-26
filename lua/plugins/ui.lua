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
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VimEnter",
    opts = {
      timeout = 3000,
      max_width = 80,
    },
    init = function()
      vim.notify = require("notify")
    end,
  },
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
              "NvimTree",
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
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "User FileOpened" },
    main = "ibl",
    opts = {
      scope = { show_start = false, show_end = false },
      exclude = {
        buftypes = { "terminal", "nofile", "quickfix", "prompt" },
        filetypes = { "checkhealth", "help", "lazy", "lspinfo", "man", "mason", "NvimTree", "Trouble", "text" },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    dependencies = { "folke/twilight.nvim" },
    opts = {
      window = {
        backdrop = 0.95,
        width = 0.8,
        height = 1,
      },
    },
  },
}
