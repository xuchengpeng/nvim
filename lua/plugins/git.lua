return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("gitsigns").setup()
  end,
  keys = {
    { "<leader>g", desc = "+Git" },
    { "<leader>gg", "<cmd>Gitsigns<cr>", desc = "Gitsigns" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "blame_line" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "diffthis" },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "stage_hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "reset_hunk" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "preview_hunk" },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "undo_stage_hunk" },
    { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "stage_buffer" },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "reset_buffer" },
  },
}
