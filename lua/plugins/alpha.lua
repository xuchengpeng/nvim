local M = {}

M.setup = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

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
    dashboard.button("e", "  > New File", "<cmd>ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  > Find File", "<cmd>Telescope find_files<CR>"),
    dashboard.button("g", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("r", "  > Recents", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("s", "  > Settings", "<cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("u", "  > Update Plugins", "<cmd>Lazy update<CR>"),
    dashboard.button("q", "  > Quit NVIM", "<cmd>quit<CR>"),
  }

  alpha.setup(dashboard.opts)
end

return M
