local conditions = require("heirline.conditions")
local components = require("plugins.heirline.components")

local align = { provider = "%=" }
local space = { provider = " " }

-- stylua: ignore
local default_statusline = {
  components.section_a, components.section_b, components.section_c, align,
  components.section_d, align,
  components.section_x, components.section_y, components.section_z,
}

local inactive_statusline = {
  condition = conditions.is_not_active,
  components.section_c,
  align,
}

local special_statusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive" },
    })
  end,
  space,
  components.file_type,
  space,
  components.help_file_name,
  align,
  hl = function()
    if conditions.is_not_active() then
      return { fg = "normal_fg", force = true }
    else
      return { fg = "blue", force = true }
    end
  end,
}

local terminal_statusline = {
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  hl = { bg = "stl_bg" },
  components.terminal_name,
  align,
}

local sidebar_statusline = {
  condition = function()
    return conditions.buffer_matches({ filetype = { "neo%-tree", "aerial" } })
  end,
  components.sidebar_name,
  align,
}

return {
  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,

  fallthrough = false,

  sidebar_statusline,
  special_statusline,
  terminal_statusline,
  inactive_statusline,
  default_statusline,
}
