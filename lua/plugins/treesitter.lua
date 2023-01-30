return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"c", "cpp", "python", "lua", "vim", "help"},
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                disable = {"help"}
            }
        })
    end,
    build = ":TSUpdate"
}
