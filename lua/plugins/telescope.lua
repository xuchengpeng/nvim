local M = {}

M.setup = function()
  require("telescope").setup()
  require("telescope").load_extension("file_browser")
  require("telescope").load_extension("live_grep_args")
  require("telescope").load_extension("fzf")
  local status_ok, _ = pcall(require, "aerial")
  if status_ok then
    require("telescope").load_extension("aerial")
  end
end

return M
