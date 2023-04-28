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
  components.special_file_type,
  space,
  components.help_file_name,
  align,
}

local terminal_statusline = {
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  hl = { bg = "stl_bg" },
  components.terminal_name,
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

  special_statusline,
  terminal_statusline,
  inactive_statusline,
  default_statusline,
}
