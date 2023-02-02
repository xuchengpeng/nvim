return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    event = "UIEnter",
    config = function()
        if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 then
            vim.opt.shellcmdflag = "-c"
            vim.opt.shellquote = ""
            vim.opt.shellxquote = ""
        end

        require("toggleterm").setup({
            active = true,
            on_config_done = nil,
            open_mapping = [[<c-\>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true, -- whether or not the open mapping applies in insert mode
            direction = "float",
            close_on_exit = true, -- close the terminal window when the process exits
            shell = vim.o.shell, -- change the default shell
            float_opts = {
                border = "curved",
                winblend = 0,
            },
        })

        function _lazygit_toggle()
            local Terminal = require('toggleterm.terminal').Terminal
            local lazygit  = Terminal:new({
                cmd = "lazygit",
                hidden = true,
                direction = "float",
                float_opts = {
                    -- border = "none",
                },
                on_open = function(_)
                    vim.cmd "startinsert!"
                end,
                on_close = function(_) end,
                count = 99,
            })

            lazygit:toggle()
        end
    end
}
