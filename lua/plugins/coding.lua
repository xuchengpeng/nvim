return {
    {
        "folke/trouble.nvim",
        lazy = true,
        cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
        config = function()
            require("trouble").setup()
        end,
        keys = {
            { "<leader>c",   desc = "+Coding" },
            { "<leader>cx",  desc = "+Trouble" },
            { "<leader>cxt", "<cmd>TroubleToggle<cr>",  desc = "Toggle" },
            { "<leader>cxr", "<cmd>TroubleRefresh<cr>", desc = "Refresh" },
        },
    },
    {
        "folke/todo-comments.nvim",
        lazy = true,
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
        keys = {
            { "<leader>ct", "<cmd>TodoTrouble<cr>",   desc = "Todo (Trouble)" },
            { "<leader>cT", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        },
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
        event = { "BufRead" },
        config = function()
            require("Comment").setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = { "BufRead" },
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
                use_treesitter = true,
            })
        end
    },
}
