local conditions = require("heirline.conditions")
local components = require("plugins.heirline.components")

local align = { provider = "%=" }
local space = { provider = " " }

local default_statusline = {
  components.vi_mode,
  space,
  components.file_name_block,
  space,
  components.git,
  space,
  components.diagnostics,
  align,
  components.lsp_active,
  space,
  components.file_encoding,
  space,
  components.file_format,
  space,
  components.file_type,
  space,
  components.ruler,
  space,
  components.scroll_bar,
}

local inactive_statusline = {
  condition = conditions.is_not_active,
  components.file_type,
  space,
  components.file_name,
  align,
}

local special_statusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive" },
    })
  end,
  components.file_type,
  space,
  components.help_file_name,
  align,
}

local terminal_statusline = {
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,

  hl = { bg = "dark_red" },

  -- Quickly add a condition to the ViMode to only show it when buffer is active!
  { condition = conditions.is_active, components.vi_mode, space },
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
