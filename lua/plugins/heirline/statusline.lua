local conditions = require("heirline.conditions")
local components = require("plugins.heirline.components")

local align = { provider = "%=" }
local space = { provider = " " }

-- stylua: ignore
local default_statusline = {
  components.vi_mode, space, components.git_branch, space, components.file_name_block, space, components.git_diff, space, components.diagnostics, align,
  components.macro_rec, space, components.search_count, align,
  components.lsp_active, space, components.file_misc_info, space, space, components.ruler, space, components.scroll_bar,
}

local inactive_statusline = {
  condition = conditions.is_not_active,
  components.file_name_block,
  align,
  components.file_type,
  space,
  components.ruler,
  hl = { fg = "gray", force = true },
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
  hl = function()
    if conditions.is_not_active() then
      return { fg = "gray", force = true }
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
