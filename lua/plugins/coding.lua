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
    {
        "folke/trouble.nvim",
        lazy = true,
        cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
        config = function()
            require("trouble").setup()
        end,
        keys = {
            { "<leader>cx", desc = "+Trouble" },
            { "<leader>cxt", "<cmd>TroubleToggle<cr>", desc = "Toggle" },
            { "<leader>cxr", "<cmd>TroubleRefresh<cr>", desc = "Refresh" },
        },
    },
    {
        "folke/todo-comments.nvim",
        lazy = true,
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
        keys = {
            { "<leader>ct", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
            { "<leader>cT", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        },
    }
}
