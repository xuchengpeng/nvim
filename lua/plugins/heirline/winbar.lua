local conditions = require("heirline.conditions")
local components = require("plugins.heirline.components")

return {
  fallthrough = false,
  {
    condition = conditions.is_not_active,
    components.file_name_block,
    hl = { fg = "gray", force = true },
  },
  components.breadcrumbs,
}
