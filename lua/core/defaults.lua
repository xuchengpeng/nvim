local M = {}

M.load_defaults = function()
  vim.g.mapleader = " "
  vim.g.encoding = "UTF-8"

  local default_options = {
    autoindent = true,
    autoread = true,
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" },
    conceallevel = 0, -- so that `` is visible in markdown files
    cursorline = true, -- highlight the current line
    expandtab = true, -- convert tabs to spaces
    fileencoding = "utf-8", -- the encoding written to a file
    fileformats = "unix,dos,mac",
    foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
    foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    incsearch = true,
    laststatus = 3,
    mouse = "a", -- allow the mouse to be used in neovim
    number = true, -- set numbered lines
    numberwidth = 2, -- set number column width to 2 {default 4}
    pumheight = 10, -- pop up menu height
    relativenumber = false,
    ruler = false,
    scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
    shiftround = true,
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    showcmd = false,
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    smartcase = true, -- smart case
    smartindent = true,
    softtabstop = 4,
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    tabstop = 4, -- insert 4 spaces for a tab
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeout = true,
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    title = true, -- set the title of window to the value of the titlestring
    undofile = false, -- disable persistent undo
    updatetime = 200, -- faster completion
    virtualedit = "block", -- allow going past end of line in visual block mode
    wrap = false, -- display lines as one long line
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  }

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end

  vim.opt.whichwrap:append("<,>,[,],h,l")
end

return M
