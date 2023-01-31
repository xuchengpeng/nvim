return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                debug = false,
                sources = {
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.lua_format,
                    null_ls.builtins.formatting.prettier,
                },
            })
        end,
        keys = {
            { "<leader>c", desc = "+Code" },
            { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format"},
        },
    },
}
