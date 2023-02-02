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

            require("lspconfig").sumneko_lua.setup {}
            require("lspconfig").clangd.setup {}
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
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                debug = false,
                sources = {
                    null_ls.builtins.formatting.prettier,
                },
            })
        end,
        keys = {
            { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
        },
    },
}
