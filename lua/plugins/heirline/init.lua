local M = {}

function M.setup()
  local setup_colors = require("plugins.heirline.colors").setup_colors
  local statusline = require("plugins.heirline.statusline")
  local tabline = require("plugins.heirline.tabline")

  require("heirline").setup({
    statusline = statusline,
    tabline = tabline,
    opts = {
      colors = setup_colors(),
    },
  })

  require("core.autocmds").create_autocmds({
    {
      "ColorScheme",
      {
        group = "_heirline",
        callback = function()
          require("heirline.utils").on_colorscheme(setup_colors)
        end,
      },
    },
  })
end

return M
