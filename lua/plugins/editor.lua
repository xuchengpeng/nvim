return {
  {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 200,
        filetypes_denylist = {
          "fugitive",
          "alpha",
          "NvimTree",
          "lazy",
          "lspsagaoutline",
          "neogitstatus",
          "Trouble",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "TelescopePrompt",
        },
      })
    end,
  },
  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false },
    keys = {
      { "<leader>cj", "<cmd>TSJJoin<cr>", desc = "Join" },
      { "<leader>cs", "<cmd>TSJSplit<cr>", desc = "Split" },
    },
  },
}
