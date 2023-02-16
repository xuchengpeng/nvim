return {
    {
        "goolord/alpha-nvim",
        lazy = true,
        event = "BufWinEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }

            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", "<cmd>ene <BAR> startinsert <CR>"),
                dashboard.button("f", "  > Find file", "<cmd>Telescope find_files<CR>"),
                dashboard.button("g", "  > Grep word", "<cmd>Telescope live_grep<CR>"),
                dashboard.button("r", "  > Recent", "<cmd>Telescope oldfiles<CR>"),
                dashboard.button("s", "  > Settings", "<cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
                dashboard.button("u", "  > Update plugins", "<cmd>Lazy update<CR>"),
                dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
            }

            alpha.setup(dashboard.opts)

            -- Disable folding on alpha buffer
            vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
        end
    },
    {
        "akinsho/bufferline.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "Explorer",
                            highlight = "Directory",
                            text_align = "left",
                        },
                    },
                },
            })
        end,
        keys = {
            { "<leader>b",  desc = "+Buffer" },
            { "<leader>bs", "<cmd>BufferLinePick<cr>",      desc = "Switch buffer" },
            { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Close buffer" },
            { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
            { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                extensions = {
                    "fzf",
                    "nvim-tree",
                    "toggleterm",
                },
            })
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        cmd = {
            "NvimTreeToggle",
            "NvimTreeFindFile",
            "NvimTreeCollapse",
            "NvimTreeRefresh",
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
        keys = {
            { "<leader>t",  desc = "+Tree" },
            { "<leader>tt", "<cmd>NvimTreeToggle<cr>",   desc = "Open or close the tree" },
            { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file" },
            { "<leader>tc", "<cmd>NvimTreeCollapse<cr>", desc = "Collapses tree recursively" },
            { "<leader>tr", "<cmd>NvimTreeRefresh<cr>",  desc = "Refresh the tree" },
        },
    },
}
