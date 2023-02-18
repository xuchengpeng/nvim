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
        fileencoding = "utf-8", -- the encoding written to a file
        fileformats = "unix,dos,mac",
        foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
        foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
        guifont = "monospace:h17", -- the font used in graphical neovim applications
        hidden = true, -- required to keep multiple buffers and open multiple buffers
        hlsearch = true, -- highlight all matches on previous search pattern
        ignorecase = true, -- ignore case in search patterns
        incsearch = true,
        mouse = "a", -- allow the mouse to be used in neovim
        pumheight = 10, -- pop up menu height
        showmode = false, -- we don't need to see things like -- INSERT -- anymore
        smartcase = true, -- smart case
        smartindent = true,
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        swapfile = false, -- creates a swapfile
        termguicolors = true, -- set term gui colors (most terminals support this)
        timeout = true,
        timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
        title = true, -- set the title of window to the value of the titlestring
        undofile = false, -- disable persistent undo
        updatetime = 100, -- faster completion
        writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
        expandtab = true, -- convert tabs to spaces
        shiftround = true,
        shiftwidth = 4, -- the number of spaces inserted for each indentation
        tabstop = 4, -- insert 4 spaces for a tab
        cursorline = true, -- highlight the current line
        number = true, -- set numbered lines
        numberwidth = 4, -- set number column width to 2 {default 4}
        relativenumber = false,
        signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
        softtabstop = 4,
        wrap = false, -- display lines as one long line
        scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
        sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.
        showcmd = false,
        ruler = false,
        laststatus = 3,
    }

    for k, v in pairs(default_options) do
        vim.opt[k] = v
    end
end

return M
