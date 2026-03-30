-- =============================================================================
-- General Options
-- =============================================================================
local options = {

  -- UI
  background = "dark",
  cursorline = true,
  signcolumn = "yes",
  number = true,
  relativenumber = true,
  showmode = false,
  showcmd = true,
  cmdheight = 1,
  laststatus = 3,
  fillchars = { eob = " " },
  splitright = true,
  splitbelow = true,

  -- Editing
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  smartindent = true,
  wrap = false,
  linebreak = true,

  -- Search
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,

  -- Performance
  updatetime = 50,
  timeout = true,
  timeoutlen = 300,
  redrawtime = 1500,
  lazyredraw = false,

  -- Files
  backup = false,
  writebackup = false,
  swapfile = false,
  undofile = true,
  autoread = true,

  -- Folding
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,
  foldlevel = 99,

  -- Misc
  iskeyword = "-",
  mouse = "a",
  clipboard = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Set undodir and ensure undo directory exists
local undo_dir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undodir = undo_dir
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end
