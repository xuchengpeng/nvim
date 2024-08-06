local M = {}

local icons = require("utils.icons")
local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

--- Add left and/or right padding to a string
-- @param str the string to add padding to
-- @param padding a table of the format `{ left = 0, right = 0}` that defines the number of spaces to include to the left and the right of the string
-- @return the padded string
function M.pad_string(str, padding)
  padding = padding or {}
  return str and str ~= "" and string.rep(" ", padding.left or 0) .. str .. string.rep(" ", padding.right or 0) or ""
end

local space = { provider = " " }

local vi_mode = {
  init = function(self)
    self.mode = vim.api.nvim_get_mode().mode
    local m = self.mode:sub(1, 1) -- get only the first mode character
    self.mode_color = self.mode_colors[m]
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
      R = "dark_red",
      r = "dark_red",
      ["!"] = "dark_red",
      t = "dark_red",
    },
  },
  provider = function(self)
    return "█ %2(" .. self.mode_names[self.mode] .. "%) "
  end,
  hl = function(self)
    return { fg = self.mode_color, bold = true }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd.redrawstatus()
    end),
  },
}

local git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    provider = function(self)
      return " " .. icons.git.Branch .. " " .. self.status_dict.head .. " "
    end,
    hl = function()
      return { fg = "purple", bold = true }
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (icons.git.LineAdded .. " " .. count .. " ")
    end,
    hl = { fg = "git_add" },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (icons.git.LineModified .. " " .. count .. " ")
    end,
    hl = { fg = "git_change" },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (icons.git.LineRemoved .. " " .. count .. " ")
    end,
    hl = { fg = "git_del" },
  },
  on_click = {
    name = "lazygit",
    callback = function()
      require("plugins.toggleterm").toggle_term_cmd("lazygit")
    end,
  },
}

local file_icon = {
  init = function(self)
    local filename = vim.api.nvim_buf_get_name(self and self.bufnr or 0)
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

local file_pathshorten_name = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self and self.bufnr or 0)
  end,
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return "Empty"
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = { fg = "blue" },
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
    provider = "[-]",
    hl = { fg = "orange" },
  },
}

M.file_type = {
  provider = function()
    return vim.bo.filetype
  end,
}

local file_encoding = {
  provider = function()
    local enc = (vim.bo.fileencoding ~= "" and vim.bo.fileencoding) or vim.o.encoding
    return enc
  end,
}

local file_format = {
  provider = function()
    return vim.bo.fileformat
  end,
}

local file_size = {
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

local file_name_block = {
  space,
  file_icon,
  file_pathshorten_name,
  file_flags,
  space,
  file_size,
  space,
  { provider = "%<" }, -- this means that the statusline is cut here when there's not enough space
}

local diagnostics = {
  condition = conditions.has_diagnostics,
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    self.has_diagnostics = self.errors > 0 or self.warnings > 0 or self.info > 0 or self.hints > 0
  end,
  update = { "DiagnosticChanged", "BufEnter" },
  {
    condition = function(self)
      return self.has_diagnostics
    end,
    provider = " ",
  },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (" " .. icons.diagnostics.Error .. " " .. self.errors)
    end,
    hl = { fg = "diag_error" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (" " .. icons.diagnostics.Warning .. " " .. self.warnings)
    end,
    hl = { fg = "diag_warn" },
  },
  {
    provider = function(self)
      return self.info > 0 and (" " .. icons.diagnostics.Information .. " " .. self.info)
    end,
    hl = { fg = "diag_info" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (" " .. icons.diagnostics.Hint .. " " .. self.hints)
    end,
    hl = { fg = "diag_hint" },
  },
  {
    condition = function(self)
      return self.has_diagnostics
    end,
    provider = " ",
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

local ruler = {
  provider = function()
    local line = vim.fn.line(".")
    local char = vim.fn.charcol(".")
    local progress = "%p%%"
    if line == 1 then
      progress = "Top"
    elseif line == vim.fn.line("$") then
      progress = "Bot"
    end
    return " " .. line .. ":" .. char .. " " .. progress .. " "
  end,
  -- hl = { fg = "normal_fg" },
}

local scroll_bar = {
  provider = function()
    local sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #sbar) + 1
    if sbar[i] then
      return string.rep(sbar[i], 2)
    end
  end,
  hl = { fg = "blue" },
}

local lsp_active = {
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
    local names = require("plugins.lsp").get_active_client_names()
    if #names == 0 then
      return ""
    end
    return icons.ui.Gears .. " [" .. table.concat(names, " ") .. "] "
  end,
  on_click = {
    name = "LspInfo",
    callback = function()
      vim.cmd.LspInfo()
    end,
  },
}

local treesitter = {
  condition = function(self)
    local ok, _ = pcall(require, "nvim-treesitter")
    if not ok then
      return false
    end
    local parsers = require("nvim-treesitter.parsers")
    return parsers.has_parser(parsers.get_buf_lang(self.bufnr or vim.api.nvim_get_current_buf()))
  end,
  provider = function()
    return "  TS "
  end,
  hl = { fg = "green" },
}

M.terminal_name = {
  condition = function()
    return vim.bo.filetype == "toggleterm"
  end,
  {
    provider = function()
      local str = icons.ui.Console .. " ToggleTerm #" .. vim.b.toggle_number
      return M.pad_string(str, { left = 1, right = 1 })
    end,
    hl = function()
      if conditions.is_active() then
        return { fg = "normal_bg", bg = "dark_red", bold = true }
      else
        return { fg = "normal_fg", bg = "bright_bg" }
      end
    end,
  },
  {
    provider = function()
      return icons.ui.BoldDividerRight
    end,
    hl = function()
      if conditions.is_active() then
        return { fg = "dark_red" }
      else
        return { fg = "bright_bg" }
      end
    end,
  },
}

M.special_file_type = {
  {
    space,
    M.file_type,
    space,
    hl = function()
      if conditions.is_active() then
        return { fg = "normal_bg", bg = "blue", bold = true }
      else
        return { fg = "normal_fg", bg = "bright_bg" }
      end
    end,
  },
  {
    provider = function()
      return icons.ui.BoldDividerRight
    end,
    hl = function()
      if conditions.is_active() then
        return { fg = "blue" }
      else
        return { fg = "bright_bg" }
      end
    end,
  },
}

M.help_file_name = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ":t")
  end,
  hl = function()
    if conditions.is_active() then
      return { fg = "blue" }
    else
      return { fg = "stl_fg" }
    end
  end,
}

local search_count = {
  condition = function()
    return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
  end,
  init = function(self)
    local ok, search = pcall(vim.fn.searchcount)
    if ok and search.total then
      self.search = search
    end
  end,
  provider = function(self)
    local search = self.search
    return string.format(" [%d/%d] ", search.current, math.min(search.total, search.maxcount))
  end,
}

local macro_rec = {
  condition = function()
    return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
  end,
  provider = icons.ui.Record .. " ",
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
  },
}

M.section_a = { vi_mode }

M.section_b = { file_name_block }

M.section_c = { git, diagnostics }

M.section_d = { search_count, macro_rec }

M.section_x = { lsp_active, treesitter }

M.section_y = {
  space,
  file_encoding,
  space,
  file_format,
  space,
  M.file_type,
  space,
}

M.section_z = { ruler, scroll_bar }

local tabline_picker = {
  condition = function(self)
    return self._show_picker
  end,
  init = function(self)
    local bufname = vim.api.nvim_buf_get_name(self.bufnr)
    bufname = bufname == "" and "Empty" or vim.fn.fnamemodify(bufname, ":t")
    local label = bufname:sub(1, 1)
    local i = 2
    while string.match(label, "%w") == nil or self._picker_labels[label] do
      if i > #bufname then
        break
      end
      label = bufname:sub(i, i)
      i = i + 1
    end
    self._picker_labels[label] = self.bufnr
    self.label = label
  end,
  provider = function(self)
    return self.label and (self.label .. " ")
  end,
  hl = { fg = "red", bold = true, italic = true },
}

--- Run the buffer picker and execute the callback function on the selected buffer
-- @param callback function with a single parameter of the buffer number
function M.buffer_picker(callback)
  local tabline = require("heirline").tabline
  local buflist = tabline and tabline._buflist and tabline._buflist[1]
  if buflist then
    buflist._picker_labels = {}
    buflist._show_picker = true
    vim.cmd.redrawtabline()
    local char = vim.fn.getcharstr()
    local bufnr = buflist._picker_labels[char]
    if bufnr then
      callback(bufnr)
    end
    buflist._show_picker = false
    vim.cmd.redrawtabline()
  end
end

local tabline_separator = {
  provider = icons.ui.BoldLineLeft,
  hl = function(self)
    if self.is_active then
      return { fg = "blue" }
    else
      return { fg = "normal_bg" }
    end
  end,
}

local tabline_file_name = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self.bufnr)
  end,
  provider = function(self)
    local filename = self.filename
    filename = filename == "" and "Empty" or vim.fn.fnamemodify(filename, ":t")
    return filename
  end,
  hl = function(self)
    if self.is_active or self.is_visible then
      return { fg = "normal_fg", bold = true, italic = true }
    else
      return { fg = "comment", bold = false, italic = false }
    end
  end,
}

local tabline_file_flags = {
  condition = function(self)
    return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
      or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
  end,
  provider = function(self)
    if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
      return icons.ui.Console
    else
      return icons.ui.Lock
    end
  end,
  hl = { fg = "orange" },
}

local tabline_file_name_block = {
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
  tabline_picker,
  {
    condition = function(self)
      return not self._show_picker
    end,
    file_icon,
  },
  tabline_file_name,
  tabline_file_flags,
}

local tabline_close_button = {
  fallthrough = false,
  {
    condition = function(self)
      return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
    end,
    space,
    { provider = icons.ui.FileModified, hl = { fg = "green" } },
  },
  {
    space,
    {
      provider = icons.ui.Close,
      hl = { fg = "gray" },
      on_click = {
        callback = function(_, minwid)
          vim.schedule(function()
            vim.api.nvim_buf_delete(minwid, { force = false })
            vim.cmd.redrawtabline()
          end)
        end,
        minwid = function(self)
          return self.bufnr
        end,
        name = "heirline_tabline_close_buffer_callback",
      },
    },
  },
}

local tabline_buffer_block = utils.surround({ "", "" }, function(self)
  if self.is_active then
    return "normal_bg"
  else
    return "stl_bg"
  end
end, { tabline_separator, tabline_file_name_block, tabline_close_button, space })

M.buffer_line = utils.make_buflist(
  tabline_buffer_block,
  { provider = icons.ui.ChevronBoldLeft, hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
  { provider = icons.ui.ChevronBoldRight, hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
)

M.tabline_offset = {
  condition = function(self)
    local win = vim.api.nvim_tabpage_list_wins(0)[1]
    local bufnr = vim.api.nvim_win_get_buf(win)
    self.winid = win

    if vim.bo[bufnr].filetype == "NvimTree" then
      self.title = "Explorer"
      return true
    end
  end,

  provider = function(self)
    local title = self.title
    local width = vim.api.nvim_win_get_width(self.winid)
    local pad = math.ceil((width - #title) / 2)
    return M.pad_string(title, { left = pad, right = pad })
  end,

  hl = function(self)
    if vim.api.nvim_get_current_win() == self.winid then
      return { fg = "blue", bold = true }
    else
      return { fg = "normal_fg" }
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
  provider = "%999X  %X",
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

--- Encode a position to a single value that can be decoded later
-- @param line line number of position
-- @param col column number of position
-- @param winnr a window number
-- @return the encoded position
local function encode_pos(line, col, winnr)
  return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
end

--- Decode a previously encoded position to it's sub parts
-- @param c the encoded position
-- @return line number, column number, window id
local function decode_pos(c)
  -- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
  return bit.rshift(c, 16), bit.band(bit.rshift(c, 6), 1023), bit.band(c, 63)
end

M.winbar_filename = {
  file_icon,
  file_pathshorten_name,
}

M.breadcrumbs = {
  condition = function()
    local ok, _ = pcall(require, "aerial")
    return ok
  end,
  init = function(self)
    local children = {}
    local separator = " " .. icons.ui.ChevronRight .. " "
    local data = require("aerial").get_location(true) or {}
    for i, d in ipairs(data) do
      local child = {
        { provider = d.icon, hl = string.format("Aerial%sIcon", d.kind) },
        { provider = string.gsub(d.name, "%%", "%%%%"):gsub("%s*->%s*", "") },
        on_click = {
          minwid = encode_pos(d.lnum, d.col, self.winnr),
          callback = function(_, minwid)
            local lnum, col, winnr = decode_pos(minwid)
            vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { lnum, col })
          end,
          name = "heirline_breadcrumbs",
        },
      }
      if #data > 1 and i < #data then
        table.insert(child, { provider = separator })
      end
      table.insert(children, child)
    end
    if #children == 0 then
      table.insert(children, M.winbar_filename)
    end
    table.insert(children, 1, space) -- padding 1 space left
    self.child = self:new(children, 1)
  end,
  provider = function(self)
    return self.child:eval()
  end,
  hl = { fg = "stl_fg" },
  update = { "CursorMoved" },
}

return M
