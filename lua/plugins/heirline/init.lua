local M = {}

local utils = require("utils")

local function setup_colors()
  local Normal = utils.get_highlight("Normal")
  local Folded = utils.get_highlight("Folded")
  local Error = utils.get_highlight("Error")
  local Constant = utils.get_highlight("Constant")
  local String = utils.get_highlight("String")
  local Function = utils.get_highlight("Function")
  local Statement = utils.get_highlight("Statement")
  local Keyword = utils.get_highlight("Keyword")
  local Type = utils.get_highlight("Type")
  local Comment = utils.get_highlight("Comment")
  local NonText = utils.get_highlight("NonText")
  local StatusLine = utils.get_highlight("StatusLine")
  local DiagnosticWarn = utils.get_highlight("DiagnosticWarn")
  local DiagnosticError = utils.get_highlight("DiagnosticError")
  local DiagnosticHint = utils.get_highlight("DiagnosticHint")
  local DiagnosticInfo = utils.get_highlight("DiagnosticInfo")
  local diffAdded = utils.get_highlight("diffAdded")
  local diffChanged = utils.get_highlight("diffChanged")
  local diffRemoved = utils.get_highlight("diffRemoved")
  return {
    normal_fg = Normal.fg,
    normal_bg = Normal.bg,
    bright_bg = Folded.bg,
    bright_fg = Folded.fg,
    red = Error.fg,
    dark_red = diffRemoved.fg,
    green = String.fg,
    blue = Function.fg,
    gray = NonText.fg,
    orange = Constant.fg,
    purple = Statement.fg,
    cyan = Keyword.fg,
    diag_warn = DiagnosticWarn.fg,
    diag_error = DiagnosticError.fg,
    diag_hint = DiagnosticHint.fg,
    diag_info = DiagnosticInfo.fg,
    git_add = diffAdded.fg,
    git_change = diffChanged.fg,
    git_del = diffRemoved.fg,
    stl_bg = StatusLine.bg,
    stl_fg = StatusLine.fg,
    type = Type.fg,
    comment = Comment.fg,
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
        local conditions = require("heirline.conditions")
        return conditions.buffer_matches({
          buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
          filetype = { "neo%-tree", "aerial", "lazy", "lspinfo", "toggleterm" },
        }, args.buf)
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
