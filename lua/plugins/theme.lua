return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local tokyonight = require("tokyonight")
            tokyonight.setup({
                stype = "moon",
                light_style = "day",
                styles = {
                    keywords = { italic = false },
                },
            })
            tokyonight.load()
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin.nvim",
        lazy = true,
        config = function()
            local catppuccin = require("catppuccin")
            catppuccin.setup({
                flavour = "mocha",
            })
        end
    }
}
