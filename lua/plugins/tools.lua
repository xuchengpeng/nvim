return {
    {
        "folke/which-key.nvim",
            lazy = true,
            event = "VeryLazy",
            config = function()
                require("which-key").setup()
            end
    },
    {
        "folke/zen-mode.nvim",
        lazy = true,
        cmd = "ZenMode",
        dependencies = { "folke/twilight.nvim" },
        config = function()
            require("zen-mode").setup({
                window = {
                    backdrop = 0.95,
                    width = 0.8,
                    height = 1,
                },
            })
        end,
        keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    }
}
