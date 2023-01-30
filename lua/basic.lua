-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- utf8
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8"
-- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 1
-- jk移动时光标下上方保留8行
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- 不使用相对行号
vim.opt.number = true
vim.opt.relativenumber = false
-- 高亮所在行
vim.opt.cursorline = true
-- 缩进4个空格等于一个Tab
vim.opt.tabstop = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
-- >> << 时移动长度
vim.opt.shiftwidth = 4
-- 新行对齐当前行，空格替代tab
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 搜索高亮
vim.opt.hlsearch = true
-- 边输入边搜索
vim.opt.incsearch = true
-- we don't need to see things like -- INSERT -- anymore
vim.opt.showmode = false
-- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
-- 禁止折行
vim.opt.wrap = false
-- 允许隐藏被修改过的buffer
vim.opt.hidden = true
-- 鼠标支持
vim.opt.mouse = "a"
-- 禁止创建备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
-- faster completion
vim.opt.updatetime = 100
-- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 1000
-- split window 从下边和右边出现
vim.opt.splitbelow = true
vim.opt.splitright = true
-- set term gui colors (most terminals support this)
vim.opt.termguicolors = true
