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
                dashboard.button("f", "  > Find files", "<cmd>Telescope find_files<CR>"),
                dashboard.button("g", "  > Grep word", "<cmd>Telescope live_grep<CR>"),
                dashboard.button("r", "  > Recent files", "<cmd>Telescope oldfiles<CR>"),
                dashboard.button("s", "  > Settings", "<cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
                dashboard.button("u", "  > Update plugins", "<cmd>Lazy update<CR>"),
                dashboard.button("q", "  > Quit NVIM", "<cmd>quit<CR>"),
            }

            alpha.setup(dashboard.opts)
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
                options = {
                    disabled_filetypes = { status_line = { "alpha" } },
                },
                extensions = {
                    "fzf",
                    "nvim-dap-ui",
                    "nvim-tree",
                    "quickfix",
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
            { "<leader>ct", "<cmd>NvimTreeToggle<cr>",   desc = "File tree" },
        },
    },
    {
        "folke/noice.nvim",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                debug = false,
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                },
            })
        end
    },
}
