local M = {}

function M.close()
  if lvim.statusline == "heirline" then
    require("plugins.heirline").buffer_close()
  else
    vim.cmd.BufferLinePickClose()
  end
end

function M.pick()
  if lvim.statusline == "heirline" then
    require("plugins.heirline").buffer_picker()
  else
    vim.cmd.BufferLinePick()
  end
end

function M.next()
  if lvim.statusline == "heirline" then
    vim.cmd.bnext()
  else
    vim.cmd.BufferLineCycleNext()
  end
end

function M.prev()
  if lvim.statusline == "heirline" then
    vim.cmd.bprevious()
  else
    vim.cmd.BufferLineCyclePrev()
  end
end

return M
