local M = {}

local user_themes = {
  ["tokyonight"] = function()
    require("tokyonight").setup({
      style = "moon",
      light_style = "day",
      styles = {
        keywords = { italic = false },
      },
    })
  end,
  ["catppuccin"] = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
    })
  end,
  ["nord"] = function()
    require("nord").setup()
  end,
}

function M.load(theme_name)
  local setup_theme = user_themes[theme_name]
  if not setup_theme then
    require("utils").notify(string.format("%s theme not exist.", theme_name), "error")
    return
  end
  setup_theme()
  vim.cmd.colorscheme(theme_name)
end

return M
