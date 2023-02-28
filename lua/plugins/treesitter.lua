return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cmake",
                    "cpp",
                    "help",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "regex",
                    "vim",
                },
                sync_install = false,
                auto_install = false,
                highlight = {
                    enable = true,
                }
            })
        end,
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = true,
        event = { "BufReadPre" },
        config = true,
    },
}
