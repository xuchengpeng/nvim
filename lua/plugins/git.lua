return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()

        local wk = require("which-key")
        wk.register({
            g = {
                name = "Git",
                g = { "<cmd>Gitsigns<cr>", "Gitsigns" },
                b = { "<cmd>Gitsigns blame_line<cr>", "blame_line" },
                d = { "<cmd>Gitsigns diffthis<cr>", "diffthis" },
                s = { "<cmd>Gitsigns stage_hunk<cr>", "stage_hunk" },
                r = { "<cmd>Gitsigns reset_hunk<cr>", "reset_hunk" },
                p = { "<cmd>Gitsigns preview_hunk<cr>", "preview_hunk" },
                u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "undo_stage_hunk" },
                S = { "<cmd>Gitsigns stage_buffer<cr>", "stage_buffer" },
                R = { "<cmd>Gitsigns reset_buffer<cr>", "reset_buffer" },
                t = {
                    name = "Toggle",
                    d = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle deleted" },
                    b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame" }
                }
            }
        }, { prefix = "<leader>" })
    end
}

