local M = {}

local icons = require("utils.icons")
local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local space = { provider = " " }

M.vi_mode = {
  init = function(self)
    self.mode = vim.api.nvim_get_mode().mode
  end,
  static = {
    mode_names = {
      ["n"] = "NORMAL",
      ["no"] = "O-PENDING",
      ["nov"] = "O-PENDING",
      ["noV"] = "O-PENDING",
      ["no\22"] = "O-PENDING",
      ["niI"] = "NORMAL",
      ["niR"] = "NORMAL",
      ["niV"] = "NORMAL",
      ["nt"] = "NORMAL",
      ["ntT"] = "NORMAL",
      ["v"] = "VISUAL",
      ["vs"] = "VISUAL",
      ["V"] = "V-LINE",
      ["Vs"] = "V-LINE",
      ["\22"] = "V-BLOCK",
      ["\22s"] = "V-BLOCK",
      ["s"] = "SELECT",
      ["S"] = "S-LINE",
      ["\19"] = "S-BLOCK",
      ["i"] = "INSERT",
      ["ic"] = "INSERT",
      ["ix"] = "INSERT",
      ["R"] = "REPLACE",
      ["Rc"] = "REPLACE",
      ["Rx"] = "REPLACE",
      ["Rv"] = "V-REPLACE",
      ["Rvc"] = "V-REPLACE",
      ["Rvx"] = "V-REPLACE",
      ["c"] = "COMMAND",
      ["cv"] = "EX",
      ["ce"] = "EX",
      ["r"] = "REPLACE",
      ["rm"] = "MORE",
      ["r?"] = "CONFIRM",
      ["!"] = "SHELL",
      ["t"] = "TERMINAL",
    },
    mode_colors = {
      n = "blue",
      i = "green",
      v = "purple",
      V = "purple",
      ["\22"] = "purple",
      c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "red",
      r = "red",
      ["!"] = "red",
      t = "red",
    },
  },
  provider = function(self)
    return "█ %2(" .. self.mode_names[self.mode] .. "%)"
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode], bold = true }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd.redrawstatus()
    end),
  },
}

local file_name_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self and self.bufnr or 0)
  end,
}

local file_icon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local file_name = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return "[No Name]"
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
}

local file_flags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
    hl = { fg = "orange" },
  },
}

local file_name_modifer = {
  hl = function()
    if vim.bo.modified then
      -- use `force` because we need to override the child's hl foreground
      return { fg = "cyan", bold = true, force = true }
    end
  end,
}

M.file_name_block = utils.insert(
  file_name_block,
  file_icon,
  utils.insert(file_name_modifer, file_name),
  file_flags,
  { provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)

M.file_type = {
  provider = function()
    return vim.bo.filetype
  end,
  hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

M.file_encoding = {
  provider = function()
    local enc = (vim.bo.fileencoding ~= "" and vim.bo.fileencoding) or vim.o.encoding
    return enc
  end,
  hl = { fg = utils.get_highlight("Type").fg },
}

M.file_format = {
  provider = function()
    return vim.bo.fileformat
  end,
  hl = { fg = utils.get_highlight("Type").fg },
}

M.file_size = {
  provider = function()
    local suffix = { "b", "k", "M", "G", "T", "P", "E" }
    local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
    fsize = (fsize < 0 and 0) or fsize
    if fsize < 1024 then
      return fsize .. suffix[1]
    end
    local i = math.floor((math.log(fsize) / math.log(1024)))
    return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
  end,
}

M.file_last_modified = {
  provider = function()
    local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
    return (ftime > 0) and os.date("%c", ftime)
  end,
}

M.git_branch = {
  condition = conditions.is_git_repo,
  hl = { fg = "orange" },
  {
    provider = function()
      return icons.git.Branch .. " " .. vim.b.gitsigns_head
    end,
    hl = { bold = true },
  },
}

M.git_diff = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
  end,
  on_click = {
    name = "lazygit",
    callback = function()
      require("plugins.toggleterm").toggle_term_cmd("lazygit")
    end,
  },

  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" " .. icons.git.LineAdded .. count)
    end,
    hl = { fg = "git_add" },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" " .. icons.git.LineModified .. count)
    end,
    hl = { fg = "git_change" },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" " .. icons.git.LineRemoved .. count)
    end,
    hl = { fg = "git_del" },
  },
}

M.ruler = {
  provider = function()
    local line = vim.fn.line(".")
    local char = vim.fn.virtcol(".")
    local text = "%p%%"
    if line == 1 then
      text = "Top"
    elseif line == vim.fn.line("$") then
      text = "Bot"
    end
    return line .. ":" .. char .. " " .. text
  end,
}

M.scroll_bar = {
  provider = function()
    local sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #sbar) + 1
    if sbar[i] then
      return string.rep(sbar[i], 2)
    end
  end,
  hl = { fg = "blue", bg = "bright_bg" },
}

M.lsp_active = {
  condition = conditions.lsp_attached,
  update = {
    "LspAttach",
    "LspDetach",
    "BufEnter",
    callback = vim.schedule_wrap(function()
      vim.cmd.redrawstatus()
    end),
  },
  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return " [" .. table.concat(names, " ") .. "]"
  end,
  hl = { fg = "green", bold = true },
  on_click = {
    name = "LspInfo",
    callback = function()
      vim.cmd.LspInfo()
    end,
  },
}

M.diagnostics = {
  condition = conditions.has_diagnostics,
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  update = { "DiagnosticChanged", "BufEnter" },

  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (" " .. icons.diagnostics.Error .. self.errors)
    end,
    hl = { fg = "diag_error" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (" " .. icons.diagnostics.Warning .. self.warnings)
    end,
    hl = { fg = "diag_warn" },
  },
  {
    provider = function(self)
      return self.info > 0 and (" " .. icons.diagnostics.Information .. self.info)
    end,
    hl = { fg = "diag_info" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (" " .. icons.diagnostics.Hint .. self.hints)
    end,
    hl = { fg = "diag_hint" },
  },
  on_click = {
    name = "heirline_diagnostic",
    callback = function()
      vim.schedule(function()
        require("telescope.builtin").diagnostics()
      end)
    end,
  },
}

M.terminal_name = {
  condition = function()
    return vim.bo.filetype == "toggleterm"
  end,
  provider = function()
    return "ToggleTerm #" .. vim.b.toggle_number
  end,
  hl = { fg = "blue", bold = true },
}

M.help_file_name = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ":t")
  end,
  hl = { fg = "blue" },
}

M.search_count = {
  condition = function()
    return vim.v.hlsearch ~= 0
  end,
  init = function(self)
    local ok, search = pcall(vim.fn.searchcount)
    if ok and search.total then
      self.search = search
    end
  end,
  provider = function(self)
    local search = self.search
    return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
  end,
}

M.macro_rec = {
  condition = function()
    return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
  end,
  provider = " ",
  hl = { fg = "orange", bold = true },
  utils.surround({ "[", "]" }, nil, {
    provider = function()
      return vim.fn.reg_recording()
    end,
    hl = { fg = "green", bold = true },
  }),
  update = {
    "RecordingEnter",
    "RecordingLeave",
    -- redraw the statusline on recording events
    callback = vim.schedule_wrap(function()
      vim.cmd.redrawstatus()
    end),
  },
}

local tabline_bufnr = {
  provider = function(self)
    return tostring(self.bufnr) .. ". "
  end,
  hl = "Comment",
}

local tabline_file_name = {
  provider = function(self)
    -- self.filename will be defined later
    local filename = self.filename
    filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
    return filename
  end,
  hl = function(self)
    if self.is_active or self.is_visible then
      return { bold = true, italic = false }
    else
      return { bold = false, italic = true }
    end
  end,
}

local tabline_file_flags = {
  {
    condition = function(self)
      return vim.api.nvim_buf_get_option(self.bufnr, "modified")
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function(self)
      return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
        or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
    end,
    provider = function(self)
      if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
        return "  "
      else
        return ""
      end
    end,
    hl = { fg = "orange" },
  },
}

local tabline_file_name_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self.bufnr)
  end,
  on_click = {
    callback = function(_, minwid, _, button)
      if button == "m" then -- close on mouse middle click
        vim.schedule(function()
          vim.api.nvim_buf_delete(minwid, { force = false })
        end)
      else
        vim.api.nvim_win_set_buf(0, minwid)
      end
    end,
    minwid = function(self)
      return self.bufnr
    end,
    name = "heirline_tabline_buffer_callback",
  },
  tabline_bufnr,
  file_icon,
  tabline_file_name,
  tabline_file_flags,
}

local tabline_close_button = {
  condition = function(self)
    return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
  end,
  space,
  {
    provider = "",
    hl = { fg = "gray" },
    on_click = {
      callback = function(_, minwid)
        vim.schedule(function()
          vim.api.nvim_buf_delete(minwid, { force = false })
        end)
        vim.cmd.redrawtabline()
      end,
      minwid = function(self)
        return self.bufnr
      end,
      name = "heirline_tabline_close_buffer_callback",
    },
  },
}

local tabline_buffer_block = utils.surround({ "", "" }, function(self)
  if self.is_active then
    return "blue"
  else
    return "bright_bg"
  end
end, { space, tabline_file_name_block, tabline_close_button, space })

M.buffer_line = utils.make_buflist(
  tabline_buffer_block,
  { provider = " ", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
  { provider = " ", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
)

M.tabline_offset = {
  condition = function(self)
    local win = vim.api.nvim_tabpage_list_wins(0)[1]
    local bufnr = vim.api.nvim_win_get_buf(win)
    self.winid = win

    if vim.bo[bufnr].filetype == "neo-tree" then
      self.title = "Explorer"
      return true
    end
  end,

  provider = function(self)
    local title = self.title
    local width = vim.api.nvim_win_get_width(self.winid)
    local pad = math.ceil((width - #title) / 2)
    return string.rep(" ", pad) .. title .. string.rep(" ", pad)
  end,

  hl = function(self)
    if vim.api.nvim_get_current_win() == self.winid then
      return "TablineSel"
    else
      return "Tabline"
    end
  end,
}

local tabpage = {
  provider = function(self)
    return "%" .. self.tabnr .. "T " .. self.tabpage .. " %T"
  end,
  hl = function(self)
    if not self.is_active then
      return "TabLine"
    else
      return "TabLineSel"
    end
  end,
}

local tabpage_close = {
  provider = "%999X  %X",
  hl = "TabLine",
}

M.tab_pages = {
  -- only show this component if there's 2 or more tabpages
  condition = function()
    return #vim.api.nvim_list_tabpages() >= 2
  end,
  { provider = "%=" },
  utils.make_tablist(tabpage),
  tabpage_close,
}

M.breadcrumbs = {
  condition = function()
    local ok, _ = pcall(require, "aerial")
    return ok
  end,
  init = function(self)
    local children = {}
    local separator = "  "
    local data = require("aerial").get_location(true) or {}
    for i, d in ipairs(data) do
      local child = {
        { provider = d.icon, hl = string.format("Aerial%sIcon", d.kind) },
        { provider = string.gsub(d.name, "%%", "%%%%"):gsub("%s*->%s*", "") },
      }
      if #data > 1 and i < #data then
        table.insert(child, { provider = separator })
      end
      table.insert(children, child)
    end
    self.child = self:new(children, 1)
  end,
  provider = function(self)
    return self.child:eval()
  end,
  hl = { fg = "gray" },
  update = { "CursorMoved" },
}

return M
