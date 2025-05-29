return {
  "rebelot/heirline.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    local function setup_colors()
      return {
        fg = utils.get_highlight("StatusLine").fg,
        bg = utils.get_highlight("StatusLine").bg,
        normal_bg = utils.get_highlight("Normal").bg,
        normal_fg = utils.get_highlight("Normal").fg,
        bright_bg = utils.get_highlight("Folded").bg,
        bright_fg = utils.get_highlight("Folded").fg,
        red = utils.get_highlight("Error").fg,
        dark_red = utils.get_highlight("diffRemoved").fg,
        green = utils.get_highlight("String").fg,
        blue = utils.get_highlight("Function").fg,
        gray = utils.get_highlight("NonText").fg,
        orange = utils.get_highlight("Constant").fg,
        purple = utils.get_highlight("Statement").fg,
        cyan = utils.get_highlight("Special").fg,
        diag_warn = utils.get_highlight("DiagnosticWarn").fg,
        diag_error = utils.get_highlight("DiagnosticError").fg,
        diag_hint = utils.get_highlight("DiagnosticHint").fg,
        diag_info = utils.get_highlight("DiagnosticInfo").fg,
        git_del = utils.get_highlight("diffRemoved").fg,
        git_add = utils.get_highlight("diffAdded").fg,
        git_change = utils.get_highlight("diffChanged").fg,
      }
    end

    local align = { provider = "%=" }
    local space = { provider = " " }

    local vi_mode = {
      init = function(self)
        self.mode = vim.fn.mode()
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
        return "█ %2(" .. self.mode_names[self.mode] .. "%)"
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

    local file_icon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
          require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self)
        return self.icon and (self.icon .. " ")
      end,
      hl = function(self)
        if conditions.is_active() then
          return { fg = self.icon_color }
        end
      end,
    }

    local file_pathshorten_name = {
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
      hl = function()
        if conditions.is_active() then
          return { fg = "blue" }
        end
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
        provider = "[-]",
        hl = function()
          if conditions.is_active() then
            return { fg = "orange" }
          end
        end,
      },
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
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      space,
      file_icon,
      file_pathshorten_name,
      file_flags,
      space,
      file_size,
      { provider = "%<" }, -- this means that the statusline is cut here when there's not enough space
    }

    local file_encoding = {
      provider = function()
        local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        return enc
      end,
    }

    local file_type = {
      provider = function()
        return vim.bo.filetype
      end,
    }

    local file_format = {
      provider = function()
        return vim.bo.fileformat
      end,
    }

    local file_misc_block = {
      space,
      file_encoding,
      space,
      file_format,
      space,
      file_type,
      space,
      hl = function()
        if conditions.is_active() then
          return { fg = "cyan" }
        end
      end,
    }

    local git = {
      condition = conditions.is_git_repo,
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,
      {
        provider = function(self)
          return "  " .. self.status_dict.head
        end,
        hl = function()
          return { fg = "purple", bold = true }
        end,
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ("  " .. count)
        end,
        hl = { fg = "git_add" },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("  " .. count)
        end,
        hl = { fg = "git_change" },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("  " .. count)
        end,
        hl = { fg = "git_del" },
      },
      on_click = {
        name = "lazygit",
        callback = function()
          Snacks.lazygit()
        end,
      },
    }

    local diagnostics = {
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
          return self.errors > 0 and ("  " .. self.errors)
        end,
        hl = { fg = "diag_error" },
      },
      {
        provider = function(self)
          return self.warnings > 0 and ("  " .. self.warnings)
        end,
        hl = { fg = "diag_warn" },
      },
      {
        provider = function(self)
          return self.info > 0 and ("  " .. self.info)
        end,
        hl = { fg = "diag_info" },
      },
      {
        provider = function(self)
          return self.hints > 0 and ("  " .. self.hints)
        end,
        hl = { fg = "diag_hint" },
      },
      on_click = {
        name = "heirline_diagnostic",
        callback = function()
          vim.schedule(function()
            Snacks.picker.diagnostics_buffer()
          end)
        end,
      },
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
        return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
      end,
    }

    local macro_rec = {
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
      },
    }

    local lsp_active = {
      condition = conditions.lsp_attached,
      update = { "LspAttach", "LspDetach" },
      provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
          table.insert(names, server.name)
        end
        return " [" .. table.concat(names, " ") .. "]"
      end,
      hl = { fg = "green" },
      on_click = {
        name = "LspInfo",
        callback = function()
          Snacks.picker.lsp_config()
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
        return line .. ":" .. char .. " " .. progress
      end,
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

    local help_file_name = {
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
        end
      end,
    }

    local terminal_name = {
      provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname
      end,
      hl = function()
        if conditions.is_active() then
          return { fg = "blue", bold = true }
        end
      end,
    }

    -- stylua: ignore
    local default_statusline = {
      vi_mode, space, file_name_block, space, git, space, diagnostics, space, align,
      search_count, space, macro_rec, space, align,
      lsp_active, space, file_misc_block, space, ruler, space, scroll_bar,
    }

    local special_statusline = {
      condition = function()
        return conditions.buffer_matches({
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive" },
        })
      end,
      {
        space,
        file_type,
        space,
        hl = function()
          if conditions.is_active() then
            return { fg = "normal_bg", bg = "blue", bold = true }
          end
        end,
      },
      space,
      help_file_name,
      align,
    }

    local terminal_statusline = {
      condition = function()
        return conditions.buffer_matches({ buftype = { "terminal" } })
      end,
      space,
      terminal_name,
      align,
    }

    local inactive_statusline = {
      condition = conditions.is_not_active,
      file_name_block,
      align,
      file_misc_block,
    }

    local statuslines = {
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

    local tabline_offset = {
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
          return { fg = "blue", bold = true }
        else
          return { fg = "normal_fg" }
        end
      end,
    }

    local tabline_separator = {
      provider = "▎",
      hl = function(self)
        if self.is_active then
          return { fg = "blue" }
        else
          return { fg = "normal_bg" }
        end
      end,
    }

    local tabline_picker = {
      condition = function(self)
        return self._show_picker
      end,
      init = function(self)
        local bufname = self.filename
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

    local tabline_file_name = {
      provider = function(self)
        local filename = self.filename
        filename = filename == "" and "Empty" or vim.fn.fnamemodify(filename, ":t")
        return filename
      end,
      hl = function(self)
        if self.is_active then
          return { fg = "normal_fg", bold = true, italic = true }
        else
          return { fg = "fg", bold = false, italic = false }
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
          return ""
        else
          return ""
        end
      end,
      hl = { fg = "orange" },
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
        { provider = "", hl = { fg = "green" } },
      },
      {
        space,
        {
          provider = "",
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
        return "bg"
      end
    end, { tabline_separator, tabline_file_name_block, tabline_close_button, space })

    local buffer_line = utils.make_buflist(
      tabline_buffer_block,
      { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
      { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
    )

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

    local tab_pages = {
      -- only show this component if there's 2 or more tabpages
      condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
      end,
      { provider = "%=" },
      utils.make_tablist(tabpage),
      tabpage_close,
    }

    local tabline = {
      tabline_offset,
      buffer_line,
      tab_pages,
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

    local breadcrumbs = {
      condition = function()
        local ok, _ = pcall(require, "aerial")
        return ok
      end,
      init = function(self)
        local children = {}
        local separator = "  "
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
        if vim.tbl_isempty(children) then
          table.insert(children, { file_icon, file_pathshorten_name })
        end
        self.child = self:new(children, 1)
      end,
      provider = function(self)
        return self.child:eval()
      end,
      update = { "CursorMoved" },
    }

    local winbar = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      fallthrough = false,
      {
        condition = conditions.is_not_active,
        space,
        file_icon,
        file_pathshorten_name,
        align,
        space,
        hl = { fg = "gray", bg = "normal_bg", force = true },
      },
      {
        space,
        breadcrumbs,
        align,
        space,
        hl = { fg = "fg", bg = "normal_bg" },
      },
    }

    require("heirline").setup({
      statusline = statuslines,
      tabline = tabline,
      winbar = winbar,
      opts = {
        colors = setup_colors(),
        disable_winbar_cb = function(args)
          return conditions.buffer_matches({
            buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
            filetype = { "neo-tree", "aerial", "lazy", "lspinfo", "toggleterm" },
          }, args.buf)
        end,
      },
    })

    vim.api.nvim_create_augroup("_heirline", {})
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      group = "_heirline",
      callback = function()
        require("heirline.utils").on_colorscheme(setup_colors)
      end,
    })

    local function buffer_picker(callback)
      local buflist = vim.tbl_get(require("heirline").tabline, "_buflist", 1)
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

    require("which-key").add({
      {
        "<leader>bc",
        function()
          buffer_picker(function(bufnr)
            vim.cmd("confirm bd" .. (bufnr == nil and "" or bufnr))
          end)
        end,
        desc = "Close Buffer",
      },
      {
        "<leader>bs",
        function()
          buffer_picker(function(bufnr)
            vim.api.nvim_win_set_buf(0, bufnr)
          end)
        end,
        desc = "Switch Buffer",
      },
      { "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
      { "<leader>bp", "<cmd>bprevious<cr>", desc = "Prev Buffer" },
    })
  end,
}
