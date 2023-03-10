local M = {}

M.setup = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({
    defaults = {
      path_display = { "truncate" },
      mappings = {
        i = {
          ["<C-c>"] = actions.close,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
        },
        n = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
        },
      },
    },
  })
  telescope.load_extension("file_browser")
  telescope.load_extension("live_grep_args")
  telescope.load_extension("fzf")
  local status_ok, _ = pcall(require, "aerial")
  if status_ok then
    telescope.load_extension("aerial")
  end
  telescope.load_extension("notify")
end

return M
