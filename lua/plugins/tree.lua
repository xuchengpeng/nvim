return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup()
        
        local wk = require("which-key")
        wk.register({
            t = {
                name = "Tree",
                t = { "<cmd>NvimTreeToggle<cr>", "Open or close the tree" },
                f = { "<cmd>NvimTreeFindFile<cr>", "Find current file" },
                c = { "<cmd>NvimTreeCollapse<cr>", "Collapses tree recursively" },
                r = { "<cmd>NvimTreeRefresh<cr>", "Refresh the tree" }
            }
        }, { prefix = "<leader>" })
    end
}

