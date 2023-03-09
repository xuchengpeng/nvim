local M = {}

M.setup = function()
  require("noice").setup({
    debug = false,
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
    },
  })
end

return M
