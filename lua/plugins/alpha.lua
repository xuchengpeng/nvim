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
    dashboard.button("r", ui.History .. "  > Recent Files", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("t", ui.FindText .. "  > Find Text", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("c", ui.Gear .. "  > Configuration", "<cmd>edit " .. require("utils").get_config_dir() .. "<CR>"),
    dashboard.button("u", ui.Update .. "  > Update Plugins", "<cmd>Lazy update<CR>"),
    dashboard.button("q", ui.Close .. "  > Quit NVIM", "<cmd>quit<CR>"),
  }

  local stats = require("lazy").stats()
  local text = require("utils.text")
  local nvim_version = require("utils.git").get_nvim_version()
  dashboard.section.footer.val = text.align_center({ width = 0 }, {
    "",
    "⚡ Neovim loaded " .. stats.count .. " plugins in " .. stats.startuptime .. "ms",
    nvim_version,
  }, 0.5)

  alpha.setup(dashboard.opts)
end

return M
