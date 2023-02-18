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
}
