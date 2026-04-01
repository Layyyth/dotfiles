-- =============================================================================
-- ToggleTerm Configuration (Terminal)
-- =============================================================================
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "vertical",
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
})

-- Terminal sizes
vim.api.nvim_set_keymap("n", "<C-n>", ":ToggleTerm direction=vertical size=50<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", ":ToggleTerm direction=horizontal size=15<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":ToggleTerm direction=float size=30<CR>", { noremap = true, silent = true })

-- Also add terminal escape to go to normal mode in terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
