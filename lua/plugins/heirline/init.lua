local M = {}

function M.setup()
  local setup_colors = require("plugins.heirline.colors").setup_colors
  local statusline = require("plugins.heirline.statusline")
  local tabline = require("plugins.heirline.tabline")
  local winbar = require("plugins.heirline.winbar")

  require("heirline").setup({
    statusline = statusline,
    winbar = winbar,
    tabline = tabline,
    opts = {
      colors = setup_colors(),
      disable_winbar_cb = function(args)
        local buf = args.buf
        local buftype = vim.tbl_contains({ "terminal", "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
        local filetype = vim.tbl_contains({ "neo%-tree", "aerial", "lazy", "lspinfo" }, vim.bo[buf].filetype)
        return buftype or filetype
      end,
    },
  })

  require("core.autocmds").create_autocmds({
    {
      "ColorScheme",
      {
        group = "_heirline",
        callback = function()
          require("heirline.utils").on_colorscheme(setup_colors)
        end,
      },
    },
  })
end

function M.buffer_picker()
  require("plugins.heirline.components").buffer_picker(function(bufnr)
    vim.api.nvim_win_set_buf(0, bufnr)
  end)
end

function M.buffer_close()
  require("plugins.heirline.components").buffer_picker(function(bufnr)
    vim.cmd("confirm bd" .. bufnr)
  end)
end

return M
