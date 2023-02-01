return {
    "RRethy/vim-illuminate",
    lazy = true,
    event = "BufReadPost",
    config = function()
        require("illuminate").configure({
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            delay = 200,
        })
    end
}

