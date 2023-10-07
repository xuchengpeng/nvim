local M = {}

local default_options = {
  opt = {
    autoindent = true,
    autoread = true,
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menu", "menuone", "noselect" },
    conceallevel = 0, -- so that `` is visible in markdown files
    cursorline = true, -- highlight the current line
    expandtab = true, -- convert tabs to spaces
    fileencoding = "utf-8", -- the encoding written to a file
    fileformats = "unix,dos,mac",
    foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
    foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    grepprg = "rg --vimgrep",
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    incsearch = true,
    laststatus = 3, -- always
    mouse = "a", -- allow the mouse to be used in neovim
    number = true, -- set numbered lines
    numberwidth = 2, -- set number column width to 2 {default 4}
    pumheight = 10, -- pop up menu height
    relativenumber = false,
    ruler = false,
    shiftround = true,
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    showcmd = false,
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always display tabline
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
  },
  g = {
    mapleader = " ",
    encoding = "UTF-8",
  },
}

function M.load_defaults()
  for scope, val_tbl in pairs(default_options) do
    for setting, value in pairs(val_tbl) do
      vim[scope][setting] = value
    end
  end

  vim.opt.shortmess:append("cI")
  vim.opt.whichwrap:append("<,>,[,],h,l")
end

return M
