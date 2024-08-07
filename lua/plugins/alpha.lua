return {
  "goolord/alpha-nvim",
  lazy = true,
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("n", "  > New File", "<cmd>enew<CR>"),
      dashboard.button("r", "  > Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("g", "  > Grep Text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("c", "  > Configuration", "<cmd>NvimTreeOpen " .. vim.fn.stdpath("config") .. "<CR>"),
      dashboard.button("u", "  > Update Plugins", "<cmd>Lazy update<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>quit<CR>"),
    }

    alpha.setup(dashboard.opts)
  end,
}
