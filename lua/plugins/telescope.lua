return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require("telescope").setup()

        local wk = require("which-key")
        wk.register({
            f = {
                name = "Telescope",
                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
                b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
                h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
                t = { "<cmd>Telescope<cr>", "Telescope" }
            }
        }, { prefix = "<leader>" })
    end
}

