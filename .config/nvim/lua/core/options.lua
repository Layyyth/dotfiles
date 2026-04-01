-- =============================================================================
-- Core Options - General Neovim Settings
-- =============================================================================

local opt = vim.opt

-- ============================================
-- General
-- ============================================
opt.mouse = 'a'                    -- Enable mouse support
opt.clipboard = 'unnamedplus'     -- Use system clipboard
opt.swapfile = false              -- Don't create swap files
opt.backup = false                -- Don't create backups
opt.writebackup = false           -- Don't create backup before writing
opt.undofile = true               -- Enable persistent undo
opt.undodir = vim.fn.stdpath('data') .. '/undo'
opt.updatetime = 300              -- Swap file update interval
opt.timeout = true                -- Enable timeout for keymaps
opt.timeoutlen = 300              -- Time in ms for keymaps
opt.redrawtime = 1500             -- Time for redraws

-- ============================================
-- UI
-- ============================================
opt.number = true                 -- Show line numbers
opt.relativenumber = true         -- Show relative line numbers
opt.cursorline = true             -- Highlight current line
opt.signcolumn = 'auto'           -- Show signs column
opt.colorcolumn = '88'            -- Show color column at 88
opt.scrolloff = 8                -- Lines to keep above/below cursor
opt.sidescrolloff = 8             -- Columns to keep left/right
opt.termguicolors = true          -- Enable true color
opt.showmode = false              -- Don't show mode (statusline shows it)
opt.showcmd = true                -- Show command in bottom bar
opt.cmdheight = 1                 -- Command line height
opt.pumheight = 10                -- Popup menu height
opt.conceallevel = 0              -- Don't hide conceal items
opt.foldlevel = 99               -- All folds open
opt.foldmethod = 'expr'           -- Fold based on expression
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.fillchars = { eob = ' ' }     -- Fill empty buffer lines
opt.hidden = true                 -- Enable hidden buffers

-- ============================================
-- Search
-- ============================================
opt.ignorecase = true             -- Ignore case in search
opt.smartcase = true              -- Smart case search
opt.hlsearch = true               -- Highlight search results
opt.incsearch = true              -- Incremental search

-- ============================================
-- Indentation
-- ============================================
opt.expandtab = true             -- Expand tabs to spaces
opt.shiftwidth = 4                -- Indent width
opt.tabstop = 4                   -- Tab width
opt.softtabstop = 4               -- Soft tab width
opt.smartindent = true            -- Smart indent
opt.wrap = false                  -- Don't wrap lines

-- ============================================
-- Completion
-- ============================================
opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- ============================================
-- Splits
-- ============================================
opt.splitright = true              -- Open splits to the right
opt.splitbelow = true              -- Open splits below

-- ============================================
-- Wild Menu
-- ============================================
opt.wildmenu = true               -- Enable wild menu
opt.wildmode = { 'longest:full', 'full' }
opt.wildignore = '*.o,*.obj,*.pyc,*.class,*.swp,*.bak'

-- ============================================
-- Performance
-- ============================================
opt.lazyredraw = false            -- Don't lazy redraw
opt.synmaxcol = 240               -- Max columns for syntax

-- ============================================
-- Python specific
-- ============================================
vim.g.python_python_bin = 'python3'
