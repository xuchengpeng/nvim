local M = {}

local utils = require("utils")

local function bool2str(bool)
  return bool and "on" or "off"
end

---Set colorscheme
M.set_colorscheme = function()
  vim.ui.select({ "tokyonight", "catppuccin", "nord", "onedark" }, {
    prompt = "Select Colorscheme",
  }, function(selected)
    if not selected then
      return
    end
    require("plugins.theme").load(selected)
  end)
end

---Set the indent and tab related numbers
M.set_indent = function()
  vim.ui.input({
    prompt = "Set indent value (>0 expandtab, <=0 noexpandtab): ",
  }, function(input)
    if not input then
      return
    end
    local indent = tonumber(input)
    if not indent or indent == 0 then
      return
    end
    vim.bo.expandtab = (indent > 0) -- local to buffer
    indent = math.abs(indent)
    vim.bo.tabstop = indent -- local to buffer
    vim.bo.softtabstop = indent -- local to buffer
    vim.bo.shiftwidth = indent -- local to buffer
    utils.notify(string.format("indent=%d %s", indent, vim.bo.expandtab and "expandtab" or "noexpandtab"))
  end)
end

---Toggle autopairs
M.toggle_autopairs = function()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if not ok then
    utils.notify("autopairs not available")
    return
  end

  if autopairs.state.disabled then
    autopairs.enable()
  else
    autopairs.disable()
  end
  utils.notify(string.format("autopairs %s", bool2str(autopairs.state.disabled)))
end

---Toggle background
M.toggle_background = function()
  vim.go.background = vim.go.background == "light" and "dark" or "light"
  utils.notify(string.format("background=%s", vim.go.background))
end

---Toggle laststatus=3|2|0
M.toggle_statusline = function()
  local laststatus = vim.opt.laststatus:get()
  if laststatus == 0 then
    vim.opt.laststatus = 2
  elseif laststatus == 2 then
    vim.opt.laststatus = 3
  elseif laststatus == 3 then
    vim.opt.laststatus = 0
  end
  utils.notify(string.format("statusline %d", vim.opt.laststatus:get()))
end

---Toggle wrap
M.toggle_wrap = function()
  vim.wo.wrap = not vim.wo.wrap -- local to window
  utils.notify(string.format("wrap %s", bool2str(vim.wo.wrap)))
end

---Toggle number
M.toggle_number = function()
  vim.wo.number = not vim.wo.number -- local to window
  utils.notify(string.format("number %s", bool2str(vim.wo.number)))
end

return M
