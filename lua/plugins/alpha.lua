local M = {}

M.setup = function()
  local ui = require("utils.icons").ui
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
    dashboard.button("e", ui.NewFile .. "  > New File", "<cmd>ene <BAR> startinsert <CR>"),
    dashboard.button("f", ui.FindFile .. "  > Find File", "<cmd>Telescope find_files<CR>"),
    dashboard.button("g", ui.FindText .. "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("r", ui.History .. "  > Recents", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("s", ui.Gear .. "  > Settings", "<cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("u", ui.Update .. "  > Update Plugins", "<cmd>Lazy update<CR>"),
    dashboard.button("q", ui.Close .. "  > Quit NVIM", "<cmd>quit<CR>"),
  }

  local stats = require("lazy").stats()
  dashboard.section.footer.val = {
    "",
    "",
    "⚡ Neovim loaded " .. stats.count .. " plugins in " .. stats.startuptime .. "ms",
  }

  alpha.setup(dashboard.opts)
end

return M
