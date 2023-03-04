return {
    {
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
                filetypes_denylist = {
                    "dirvish",
                    "fugitive",
                    "alpha",
                    "NvimTree",
                    "lazy",
                    "neogitstatus",
                    "Trouble",
                    "lir",
                    "Outline",
                    "spectre_panel",
                    "toggleterm",
                    "DressingSelect",
                    "TelescopePrompt",
                },
            })
        end
    },
    {
        "Wansmer/treesj",
        lazy = true,
        cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
        opts = { use_default_keymaps = false },
        keys = {
            { "<leader>cj", "<cmd>TSJJoin<cr>",  desc = "Join" },
            { "<leader>cs", "<cmd>TSJSplit<cr>", desc = "Split" },
        },
    },
}
