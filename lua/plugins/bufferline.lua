local M = {}

function M.setup()
  require("bufferline").setup({
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  })
end

return M
