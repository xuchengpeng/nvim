local path_sep = vim.loop.os_uname().version:match("Windows") and "\\" or "/"

local function join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

local lazypath = join_paths(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" } },
  root = join_paths(vim.fn.stdpath("data"), "lazy"),
  lockfile = join_paths(vim.fn.stdpath("config"), "lazy-lock.json"),
  install = { colorscheme = { lvim.colorscheme, "habamax" } },
  ui = { border = "rounded" },
})
