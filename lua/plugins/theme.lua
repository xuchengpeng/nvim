return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local tokyonight = require("tokyonight")
            tokyonight.setup({
                style = "moon",
                light_style = "day",
                styles = {
                    keywords = { italic = false },
                },
            })
            tokyonight.load()
        end
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        config = function()
            local onedark = require("onedark")
            onedark.setup({
                style = "dark",
            })
            onedark.load()
        end
    },
}
