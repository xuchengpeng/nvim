vim.api.nvim_create_augroup("_general_settings", {})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained", "TermClose", "TermLeave" }, {
  group = "_general_settings",
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = "_general_settings",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = "_general_settings",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_general_settings",
  pattern = {
    "aerial-nav",
    "checkhealth",
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
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_general_settings",
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_general_settings",
  pattern = { "aerial", "alpha", "dap-repl" },
  command = "set nobuflisted",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_general_settings",
  pattern = { "lua", "vim" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- automatically create missing directories when saving files
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = "_general_settings",
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = "_general_settings",
  callback = function(args)
    if not (vim.api.nvim_buf_get_name(args.buf) == "" or vim.bo[args.buf].buftype == "nofile") then
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
      end)
    end
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  group = "_general_settings",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
