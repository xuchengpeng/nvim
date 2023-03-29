local M = {}

local utils = require("utils")

local function setup_colors()
  return {
    normal_bg = utils.get_highlight("Normal").bg,
    bright_bg = utils.get_highlight("Folded").bg,
    bright_fg = utils.get_highlight("Folded").fg,
    red = utils.get_highlight("Error").fg,
    green = utils.get_highlight("String").fg,
    blue = utils.get_highlight("Function").fg,
    gray = utils.get_highlight("NonText").fg,
    orange = utils.get_highlight("Constant").fg,
    purple = utils.get_highlight("Statement").fg,
    cyan = utils.get_highlight("Keyword").fg,
    diag_warn = utils.get_highlight("DiagnosticWarn").fg,
    diag_error = utils.get_highlight("DiagnosticError").fg,
    diag_hint = utils.get_highlight("DiagnosticHint").fg,
    diag_info = utils.get_highlight("DiagnosticInfo").fg,
    git_add = utils.get_highlight("diffAdded").fg,
    git_change = utils.get_highlight("diffChanged").fg,
    git_del = utils.get_highlight("diffRemoved").fg,
    stl_bg = utils.get_highlight("StatusLine").bg,
    stl_fg = utils.get_highlight("StatusLine").fg,
    type = utils.get_highlight("Type").fg,
    comment = utils.get_highlight("Comment").fg,
  }
end

function M.setup()
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
