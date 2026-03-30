-- =============================================================================
-- DAP Configuration (Debug Adapter Protocol)
-- =============================================================================
local dap = require("dap")
local dapui = require("dapui")
local dapvt = require("nvim-dap-virtual-text")

-- Setup DAP UI
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 10,
      position = "bottom",
    },
  },
  controls = {
    element = "repl",
    icons = {
      pause = "⏸",
      play = "▶",
      run = "⏩",
      step_over = "⏭",
      step_into = "⏩",
      step_out = "⏮",
      terminate = "⏹",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "rounded",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  notifications = {
    enabled = true,
    timeout = 5,
  },
})

-- Setup virtual text
dapvt.setup({
  enabled = true,
  enabled_commands = true,
  highlight = "Comment",
  shown = true,
  only_levels = false,
})

-- Python debugging configuration
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch Python file",
    program = "${file}",
    pythonPath = function()
      return "/usr/bin/python3"
    end,
  },
  {
    type = "python",
    request = "attach",
    name = "Attach to Python process",
    connect = function()
      local host = vim.fn.input("Host: ", "127.0.0.1", "text")
      local port = tonumber(vim.fn.input("Port: ", "5678", "text"))
      return {
        host = host,
        port = port,
      }
    end,
    mode = "remote",
  },
}

-- C/C++ debugging configuration
dap.configurations.cpp = {
  {
    type = "codelldb",
    request = "launch",
    name = "Launch C/C++",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- Go debugging configuration
dap.configurations.go = {
  {
    type = "dlv",
    request = "launch",
    name = "Launch Go",
    program = "${file}",
    dlvToolPath = "/usr/bin/dlv",
  },
}

-- Keybindings for DAP
vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F6>", dap.pause, { desc = "DAP: Pause" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step out" })
vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })

-- Auto open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
