local M = {}

local utils = require("utils")

M.setup = function()
  local lazypath = utils.get_data_dir() .. "/lazy/lazy.nvim"
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

  local plugins = require("core.plugins")
  local opts = {
    root = utils.get_data_dir() .. "/lazy",
    lockfile = utils.get_config_dir() .. "/lazy-lock.json",
    install = { colorscheme = { "tokyonight", "habamax" } },
  }

  require("lazy").setup(plugins, opts)
end

return M
