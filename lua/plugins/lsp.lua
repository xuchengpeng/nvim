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

            require("lspconfig").sumneko_lua.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            }
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
        end,
        keys = {
            { "<leader>cd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto definition" },
            { "<leader>cf", "<cmd>Lspsaga lsp_finder<cr>", desc = "Find definition" },
            { "<leader>cF", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
            { "<leader>co", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
            { "<leader>cr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
        },
    }
}
