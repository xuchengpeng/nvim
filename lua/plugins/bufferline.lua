return {
    "akinsho/bufferline.nvim",
    lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        })
    end,
    keys = {
        { "<leader>b", desc = "+Buffer" },
        { "<leader>bs", "<cmd>BufferLinePick<cr>", desc = "Switch buffer" },
        { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Close buffer" },
        { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    },
}
