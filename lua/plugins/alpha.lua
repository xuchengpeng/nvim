local M = {}

function M.setup()
  local config_dir = require("utils").get_config_dir()
  local ui = require("utils.icons").ui
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  local autocmds = require("core.autocmds")
  autocmds.create_autocmds({
    {
      "UIEnter",
      {
        group = "_alpha",
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
        end,
      },
    },
    {
      "User",
      {
        group = "_alpha",
        pattern = "AlphaReady",
        callback = function()
          local prev_showtabline = vim.opt.showtabline
          local prev_status = vim.opt.laststatus
          vim.opt.laststatus = 0
          vim.opt.showtabline = 0
          vim.opt_local.winbar = nil
          autocmds.create_autocmds({
            {
              "BufUnload",
              {
                pattern = "<buffer>",
                callback = function()
                  vim.opt.laststatus = prev_status
                  vim.opt.showtabline = prev_showtabline
                end,
              },
            },
          })
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
    dashboard.button("f", ui.FindFile .. "  > Find File", "<cmd>Telescope find_files<CR>"),
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
