-- =============================================================================
-- ToggleTerm Configuration (Terminal)
-- =============================================================================
require("toggleterm").setup({
  size = 10,
  open_mapping = [[<C-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  -- VS Code-like terminal settings
  -- Terminals that get opened when running these commands
  terminals = {
    float = {
      -- float terminal direction
      direction = "float",
    },
    horizontal = {
      direction = "horizontal",
      size = 10,
    },
    vertical = {
      direction = "vertical",
      size = 10,
    },
    -- This is for toggleterm
    toggle = function()
      local Terminal = require("toggleterm.terminal")
      local term = Terminal:new(vim.tbl_extend("force", {
        count = 1,
        direction = "float",
      }, {}))
      term:toggle()
    end,
  },
})

-- Terminal settings
vim.api.nvim_set_keymap("n", "<leader>tt", ":ToggleTerm direction=float name=float<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>th", ":ToggleTerm direction=horizontal name=horizontal<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tv", ":ToggleTerm direction=vertical name=vertical<CR>", { noremap = true, silent = true })
