-- =============================================================================
-- Which Key Configuration (CORRECT format)
-- =============================================================================
local wk = require("which-key")

wk.setup({
  win = {
    border = "single",
    padding = { 1, 2, 1, 2 },
    winblend = 0,
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
})

-- CORRECT format: { key, { rhs, desc } } or { key, rhs, desc }
wk.register({
  -- Search
  { "<leader>r", { "<cmd>Telescope oldfiles<cr>", "Recent Files" } },
  { "<leader>f", group = "Telescope" },
  { "<leader>ff", { "<cmd>Telescope find_files<cr>", "Find Files" } },
  { "<leader>fg", { "<cmd>Telescope live_grep<cr>", "Live Grep" } },
  { "<leader>fb", { "<cmd>Telescope buffers<cr>", "Buffers" } },
  { "<leader>fh", { "<cmd>Telescope help_tags<cr>", "Help Tags" } },

  -- Git
  { "<leader>g", group = "Git" },
  { "<leader>gg", { "<cmd>Neogit<cr>", "Neogit" } },
  { "<leader>gc", { "<cmd>Neogit commit<cr>", "Commit" } },
  { "<leader>gp", { "<cmd>Git push<cr>", "Push" } },

  -- LSP
  { "<leader>l", group = "LSP" },
  { "<leader>la", { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" } },
  { "<leader>ld", { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" } },
  { "<leader>li", { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" } },
  { "<leader>lr", { "<cmd>lua vim.lsp.buf.references()<cr>", "References" } },
  { "<leader>ln", { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" } },

  -- File Explorer
  { "<leader>e", { "<cmd>Neotree toggle<cr>", "Toggle Explorer" } },
  { "<leader>o", { "<cmd>Neotree focus<cr>", "Focus Explorer" } },

  -- Terminal
  { "<leader>t", group = "Terminal" },
  { "<leader>tf", { "<cmd>ToggleTerm direction=float<cr>", "Float Terminal" } },
  { "<leader>th", { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal Terminal" } },
  { "<leader>tv", { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical Terminal" } },

  -- Buffers
  { "<leader>b", group = "Buffers" },
  { "<leader>bd", { "<cmd>bdelete<cr>", "Close Buffer" } },
  { "<leader>bo", { "<cmd>%bd|e#|bd#<cr>", "Close Other Buffers" } },

  -- Save/Quit
  { "<leader>w", { "<cmd>w<cr>", "Save" } },
  { "<leader>q", { "<cmd>q<cr>", "Quit" } },
  { "<leader>Q", { "<cmd>qa!<cr>", "Force Quit" } },
})
