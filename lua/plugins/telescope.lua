return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require("telescope").setup()
    end,
    keys = {
        { "<leader>f", desc = "+Telescope" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
        { "<leader>ft", "<cmd>Telescope<cr>", desc = "Telescope" },
    },
}
