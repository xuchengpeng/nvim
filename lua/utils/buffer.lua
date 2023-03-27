local M = {}

function M.close()
  local ok, _ = pcall(require, "bufferline")
  if ok then
    vim.cmd.BufferLinePickClose()
  else
    require("plugins.heirline").buffer_close()
  end
end

function M.pick()
  local ok, _ = pcall(require, "bufferline")
  if ok then
    vim.cmd.BufferLinePick()
  else
    require("plugins.heirline").buffer_picker()
  end
end

function M.next()
  local ok, _ = pcall(require, "bufferline")
  if ok then
    vim.cmd.BufferLineCycleNext()
  else
    vim.cmd.bnext()
  end
end

function M.prev()
  local ok, _ = pcall(require, "bufferline")
  if ok then
    vim.cmd.BufferLineCyclePrev()
  else
    vim.cmd.bprevious()
  end
end

return M
