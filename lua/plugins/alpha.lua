local M = {}

function M.setup()
  local config_dir = require("utils").get_config_dir()
  local ui = require("utils.icons").ui
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  local autocmds = require("core.autocmds")
  autocmds.create_autocmds({
    {
      "User",
      {
        group = "_alpha",
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          local text = require("utils.text")
          local nvim_version = require("utils.git").get_nvim_version()
          dashboard.section.footer.val = text.align_center({ width = 0 }, {
            "",
            "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms",
            nvim_version,
          }, 0.5)
          pcall(vim.cmd.AlphaRedraw)
        end,
      },
    },
    {
      { "User", "BufWinEnter" },
      {
        group = "_alpha",
        callback = function(event)
          if
            (
              (event.event == "User" and event.file == "AlphaReady")
              or (event.event == "BufWinEnter" and vim.bo[event.buf].filetype == "alpha")
            ) and not vim.g.before_alpha
          then
            vim.g.before_alpha = {
              showtabline = vim.opt.showtabline:get(),
              laststatus = vim.opt.laststatus:get(),
              cmdheight = vim.opt.cmdheight:get(),
            }
            vim.opt.showtabline, vim.opt.laststatus, vim.opt.cmdheight = 0, 0, 0
          elseif vim.g.before_alpha and event.event == "BufWinEnter" and vim.bo[event.buf].buftype ~= "nofile" then
            vim.opt.laststatus, vim.opt.showtabline, vim.opt.cmdheight =
              vim.g.before_alpha.laststatus, vim.g.before_alpha.showtabline, vim.g.before_alpha.cmdheight
            vim.g.before_alpha = nil
          end
        end,
      },
    },
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
    dashboard.button("f", ui.Search .. "  > Find File", "<cmd>Telescope find_files<CR>"),
    dashboard.button("n", ui.NewFile .. "  > New File", "<cmd>enew<CR>"),
    dashboard.button("r", ui.History .. "  > Recent Files", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("t", ui.FindText .. "  > Find Text", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("c", ui.Gear .. "  > Configuration", "<cmd>Neotree " .. config_dir .. "<CR>"),
    dashboard.button("u", ui.CloudDownload .. "  > Update Plugins", "<cmd>Lazy update<CR>"),
    dashboard.button("q", ui.SignOut .. "  > Quit NVIM", "<cmd>quit<CR>"),
  }

  alpha.setup(dashboard.opts)
end

return M
