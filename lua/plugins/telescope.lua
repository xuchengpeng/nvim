local M = {}

function M.setup()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({
    defaults = {
      border = true,
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
  telescope.load_extension("fzf")
  local conditional_func = require("utils").conditional_func
  conditional_func(telescope.load_extension, pcall(require, "aerial"), "aerial")
  conditional_func(telescope.load_extension, pcall(require, "notify"), "notify")
end

return M
