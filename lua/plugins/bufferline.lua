local M = {}

function M.setup()
  require("bufferline").setup({
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  })
end

return M
