return {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  keys = {
    { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>",     desc = "Toggle Breakpoint" },
    { "<leader>dc", "<cmd>lua require('dap').continue()<cr>",              desc = "Continue" },
    { "<leader>dd", "<cmd>lua require('osv').run_this()<cr>",              desc = "Launch Lua Debugger" },
    { "<leader>di", "<cmd>lua require('dap').step_into()<cr>",             desc = "Step Into" },
    { "<leader>do", "<cmd>lua require('dap').step_over()<cr>",             desc = "Step Over" },
    { "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>",             desc = "Repl" },
    { "<leader>ds", "<cmd>lua require('osv').launch({ port = 8086 })<cr>", desc = "Launch Lua Debugger Server" },
    { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>",              desc = "Dap UI" },
    { "<leader>dw", "<cmd>lua require('dap.ui.widgets').hover()<cr>",      desc = "Widgets" },
  },
  config = function()
    local dap = require("dap")
    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }
    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end
  end,
}
