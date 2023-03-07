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
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff This" },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
    { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
    { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
    { "<leader>gP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
    { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer" },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
  },
}
