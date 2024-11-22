
return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",   -- Core DAP plugin
    "theHamsta/nvim-dap-virtual-text", -- Optional: Adds virtual text for inline variable values
  },
  keys = {
    { "<F5>", ":lua require'dap'.continue()<CR>", desc = "Continue/Start Debugging" },
    { "<F10>", ":lua require'dap'.step_over()<CR>", desc = "Step Over" },
    { "<F11>", ":lua require'dap'.step_into()<CR>", desc = "Step Into" },
    { "<F12>", ":lua require'dap'.step_out()<CR>", desc = "Step Out" },
    { "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
    { "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Conditional Breakpoint" },
    { "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Log Point" },
    { "<Leader>dr", ":lua require'dap'.repl.toggle()<CR>", desc = "Toggle REPL" },
    { "<Leader>dl", ":lua require'dap'.run_last()<CR>", desc = "Run Last Debugger" },
    { "<Leader>du", ":lua require'dapui'.toggle()<CR>", desc = "Toggle DAP UI" },
  },
  config = function()
    -- DAP UI setup
    require("dapui").setup({
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        -- Use these mappings to control UI elements
        expand = { "o", "<CR>", "<2-LeftMouse>" },
        open = "O",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 40, -- Width of the window in columns
          position = "left", -- Can be "left" or "right"
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 10, -- Height of the window
          position = "bottom", -- Can be "bottom" or "top"
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5, -- Proportional to screen size
        border = "single", -- Border style
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil, -- Set to nil for no maximum
      },
    })

    -- Automatically open/close dap-ui when debugging starts/ends
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = false,  -- Disable commands related to virtual text
      highlight_changed_variables = true,  -- Only highlight changed variables
      highlight_new_as_changed = true,     -- Treat new variables as changed
      show_stop_reason = true,             -- Show the reason the debugger stopped
      commented = false,                   -- Do not comment virtual text
      virt_text_pos = 'eol',               -- Display virtual text at the end of the line
    })
    -- DAP Virtual Text for inline variable values
    -- require("nvim-dap-virtual-text").setup({
    --   enabled = true,      -- Enable this plugin (the default)
    --   highlight_changed_variables = true, -- Highlight when variables change
    --   highlight_new_as_changed = true, -- Treat new variables as changed
    -- })
  end
}

