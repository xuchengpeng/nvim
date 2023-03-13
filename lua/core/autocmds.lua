local M = {}

M.load_defaults = function()
  local definitions = {
    -- Check if we need to reload the file when it changed
    {
      { "CursorHold", "CursorHoldI", "FocusGained", "TermClose", "TermLeave" },
      {
        group = "_general_settings",
        command = "checktime",
      },
    },
    -- Highlight on yank
    {
      "TextYankPost",
      {
        group = "_general_settings",
        callback = function()
          vim.highlight.on_yank()
        end,
      },
    },
    -- resize splits if window got resized
    {
      { "VimResized" },
      {
        group = "_auto_resize",
        callback = function()
          vim.cmd("tabdo wincmd =")
        end,
      },
    },
    -- close some filetypes with <q>
    {
      "FileType",
      {
        group = "_close_with_q",
        pattern = {
          "dap-float",
          "floaterm",
          "help",
          "lspinfo",
          "lsp-installer",
          "man",
          "notify",
          "qf",
          "spectre_panel",
          "startuptime",
          "tsplayground",
          "PlenaryTestPopup",
        },
        callback = function(event)
          vim.bo[event.buf].buflisted = false
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
        end,
      },
    },
    -- wrap and check for spell in text filetypes
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = { "gitcommit", "markdown" },
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.spell = true
        end,
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = { "aerial", "alpha", "dap-repl" },
        command = "set nobuflisted",
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = "lua",
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.shiftwidth = 2
        end,
      },
    },
    -- automatically create missing directories when saving files
    {
      "BufWritePre",
      {
        group = "_auto_create_dir",
        callback = function(event)
          local file = vim.loop.fs_realpath(event.match) or event.match
          vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        end,
      },
    },
    {
      { "BufReadPost", "BufNewFile" },
      {
        group = "_file_user_events",
        callback = function(args)
          local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
          if not (vim.fn.expand("%") == "" or buftype == "nofile") then
            require("utils").event("FileOpened")
          end
        end,
      },
    },
  }

  M.define_autocmds(definitions)
end

M.define_autocmds = function(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

return M
