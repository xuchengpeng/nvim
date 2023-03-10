local M = {}

local mappings = {
  h = { "<cmd>nohlsearch<cr>", "No Highlight" },
  q = { "<cmd>confirm quit<cr>", "Quit" },
  z = { "<cmd>ZenMode<cr>", "Zen Mode" },
  b = {
    name = "+Buffer",
    c = { "<cmd>BufferLinePickClose<cr>", "Close Buffer" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
    p = { "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer" },
    s = { "<cmd>BufferLinePick<cr>", "Switch Buffer" },
  },
  c = {
    name = "+Coding",
    e = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
    j = { "<cmd>TSJJoin<cr>", "Join" },
    s = { "<cmd>TSJSplit<cr>", "Split" },
    o = { "<cmd>AerialToggle<cr>", "Outline" },
    x = {
      name = "+Trouble",
      x = { "<cmd>TroubleToggle<cr>", "Trouble" },
      r = { "<cmd>TroubleRefresh<cr>", "Refresh" },
      t = { "<cmd>TodoTrouble<cr>", "Todo (Trouble)" },
      T = { "<cmd>TodoTelescope<cr>", "Todo" },
    },
  },
  d = {
    name = "+Debug",
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
    d = { "<cmd>lua require('osv').run_this()<cr>", "Launch Lua Debugger" },
    i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
    r = { "<cmd>lua require('dap').repl.open()<cr>", "Repl" },
    s = { "<cmd>lua require('osv').launch({ port = 8086 })<cr>", "Launch Lua Debugger Server" },
    u = { "<cmd>lua require('dapui').toggle()<cr>", "Dap UI" },
    w = { "<cmd>lua require('dap.ui.widgets').hover()<cr>", "Widgets" },
  },
  f = {
    name = "+Telescope",
    b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Live Grep (Args)" },
    G = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recents Files" },
    s = { "<cmd>Telescope buffers<cr>", "Switch Buffers" },
    t = { "<cmd>Telescope<cr>", "Telescope" },
  },
  g = {
    name = "+Git",
    g = { "<cmd>Gitsigns<cr>", "Gitsigns" },
    b = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff This" },
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    n = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
    p = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
    P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
    S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
    R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
  },
  l = {
    name = "+LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
    f = { "<cmd>lua require('plugins.lsp').format()<cr>", "Format" },
    i = { "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
    n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
  },
  t = {
    name = "+Terminal",
    t = { "<cmd>ToggleTerm<cr>", "Terminal" },
    b = { "<cmd>lua require('plugins.toggleterm').toggle_term_cmd('btm')<cr>", "Bottom" },
    d = { "<cmd>lua require('plugins.toggleterm').toggle_term_cmd('gdu')<cr>", "Disk Usage" },
    g = { "<cmd>lua require('plugins.toggleterm').toggle_term_cmd('glow')<cr>", "Glow" },
    l = { "<cmd>lua require('plugins.toggleterm').toggle_term_cmd('lazygit')<cr>", "Lazygit" },
    p = { "<cmd>lua require('plugins.toggleterm').toggle_term_cmd('python')<cr>", "Python" },
  },
}

M.setup = function()
  local which_key = require("which-key")
  which_key.setup()
  which_key.register(mappings, { prefix = "<leader>" })
end

return M
