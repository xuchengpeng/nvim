return {
  "akinsho/toggleterm.nvim",
  lazy = true,
  cmd = { "ToggleTerm" },
  opts = {
    size = 15,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    float_opts = {
      border = "rounded",
      winblend = 0,
    },
  },
}
