return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        padding = 1,
                    },
                },
            },
        })

        local wk = require("which-key")
        wk.register({
            b = {
                name = "Buffer",
                s = { "<cmd>BufferLinePick<cr>", "Switch buffer" },
                c = { "<cmd>BufferLinePickClose<cr>", "Close buffer" },
                n = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
                p = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
            }
        }, { prefix = "<leader>" })
    end
}

