-- =============================================================================
-- ToggleTerm Configuration
-- =============================================================================
require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader>t]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = "1",
  start_in_insert = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.env.SHELL,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  winbar = {
    enabled = false,
    name_formatter = function(term)
      return term.name
    end,
  },
  -- Default terminal config for lazygit, python, etc.
  terminal_aliases = {
    lazygit = "lazygit",
    node = "node",
    python = "python3",
    ["python-venv"] = { "python3", args = { "-m", "venv", ".venv" } },
  },
  extras = {
    -- lazygit
    function()
      return {
        cmd = "lazygit",
        args = { "--log-file", string.format("%s/lazygit.log", vim.fn.stdpath("state")) },
      }
    end,
  },
})

-- Terminal keymaps
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- Apply terminal keymaps when terminal opens
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Terminal commands
vim.api.nvim_create_user_command("Lazygit", function()
  require("toggleterm").exec("lazygit", nil, nil, nil, "vertical")
end, {})

vim.api.nvim_create_user_command("Python", function()
  require("toggleterm").exec("python3", nil, nil, nil, "horizontal")
end, {})
