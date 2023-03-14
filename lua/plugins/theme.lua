local M = {}

local user_themes = {
  ["tokyonight"] = function()
    local tokyonight = require("tokyonight")
    tokyonight.setup({
      style = "moon",
      light_style = "day",
      styles = {
        keywords = { italic = false },
      },
    })
    tokyonight.load()
  end,
  ["onedark"] = function()
    local onedark = require("onedark")
    onedark.setup({
      style = "dark",
    })
    onedark.load()
  end,
}

M.load = function(theme_name)
  local load_theme = user_themes[theme_name]
  if not load_theme then
    require("utils").notify(string.format("%s theme not exist.", theme_name), "error")
    return
  end
  load_theme()
end

return M
