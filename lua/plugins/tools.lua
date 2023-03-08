return {
  {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    config = function()
      if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 then
        vim.opt.shellcmdflag = "-c"
        vim.opt.shellquote = ""
        vim.opt.shellxquote = ""
      end

      require("toggleterm").setup({
        active = true,
        on_config_done = nil,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        direction = "float",
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        float_opts = {
          border = "curved",
          winblend = 0,
        },
      })
    end,
    keys = {
      { "<leader>t", desc = "+Terminal" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
      {
        "<leader>tl",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            on_open = function(_)
              vim.cmd("startinsert!")
            end,
            on_close = function(_) end,
          })

          lazygit:toggle()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>tb",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local bottom = Terminal:new({
            cmd = "btm",
            hidden = true,
            direction = "float",
          })

          bottom:toggle()
        end,
        desc = "Bottom",
      },
      {
        "<leader>td",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local gdu = Terminal:new({
            cmd = "gdu",
            hidden = true,
            direction = "float",
          })

          gdu:toggle()
        end,
        desc = "Disk usage",
      },
      {
        "<leader>tg",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local glow = Terminal:new({
            cmd = "glow",
            hidden = true,
            direction = "float",
          })

          glow:toggle()
        end,
        desc = "Glow",
      },
      {
        "<leader>tp",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local python = Terminal:new({
            cmd = "python",
            hidden = true,
            direction = "float",
          })

          python:toggle()
        end,
        desc = "Python",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    dependencies = { "folke/twilight.nvim" },
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95,
          width = 0.8,
          height = 1,
        },
      })
    end,
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = "Spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
}
