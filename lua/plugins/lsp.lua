return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                -- ensure_installed = { "clangd", "sumneko_lua", "pyright", "vimls" }
            })
        end
    },
    {
        "glepnir/lspsaga.nvim",
        lazy = true,
        event = { "BufRead" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lspsaga").setup()
        end
    },
}
