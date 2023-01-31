return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = {
        "NvimTreeToggle",
        "NvimTreeFindFile",
        "NvimTreeCollapse",
        "NvimTreeRefresh",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup()
    end,
    keys = {
        { "<leader>t", desc = "+Tree" },
        { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Open or close the tree" },
        { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file" },
        { "<leader>tc", "<cmd>NvimTreeCollapse<cr>", desc = "Collapses tree recursively" },
        { "<leader>tr", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh the tree" },
    },
}
