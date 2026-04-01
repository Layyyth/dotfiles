-- =============================================================================
-- Keymaps - VS Code-like keybindings
-- =============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- ============================================
-- General
-- ============================================
keymap('i', 'jj', '<Esc>', opts)           -- Escape from insert mode
keymap('n', '<Esc>', ':noh<CR>', opts)      -- Clear search highlights

-- ============================================
-- Better window navigation
-- ============================================
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- ============================================
-- Move lines up/down (VS Code style with Alt)
-- ============================================
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- ============================================
-- Resize windows
-- ============================================
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- ============================================
-- Buffers (VS Code-like tabs)
-- ============================================
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<Leader>bd', ':bdelete<CR>', opts)          -- Close buffer
keymap('n', '<Leader>bo', ':%bd|e#|bd#<CR>', opts)      -- Close all other buffers

-- ============================================
-- Text formatting
-- ============================================
keymap('n', '<Leader>=', 'm`gT=zt`z', opts)              -- Format and re-center
keymap('v', '<Leader>gq', 'gq', opts)                    -- Format selected text

-- ============================================
-- Neotree (File Explorer)
-- ============================================
keymap('n', '<Leader>e', ':Neotree toggle<CR>', opts)
keymap('n', '<Leader>o', ':Neotree focus<CR>', opts)

-- ============================================
-- Telescope (Fuzzy Finder)
-- ============================================
keymap('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
keymap('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', opts)
keymap('n', '<Leader>fc', ':Telescope commands<CR>', opts)
keymap('n', '<Leader>fr', ':Telescope oldfiles<CR>', opts)
keymap('n', '<Leader>fp', ':Telescope projects<CR>', opts)

-- ============================================
-- Git (Neogit)
-- ============================================
keymap('n', '<Leader>gg', ':Neogit<CR>', opts)
keymap('n', '<Leader>gc', ':Neogit commit<CR>', opts)
keymap('n', '<Leader>gp', ':Git push<CR>', opts)

-- ============================================
-- LSP (Language Server Protocol)
-- ============================================
keymap('n', 'gd', vim.lsp.buf.definition, opts)           -- Go to definition
keymap('n', 'gD', vim.lsp.buf.declaration, opts)         -- Go to declaration
keymap('n', 'gi', vim.lsp.buf.implementation, opts)      -- Go to implementation
keymap('n', 'gr', vim.lsp.buf.references, opts)          -- Find references
keymap('n', 'K', vim.lsp.buf.hover, opts)                -- Hover info
keymap('n', '<Leader>rn', vim.lsp.buf.rename, opts)     -- Rename
keymap('n', '<Leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
keymap('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
keymap('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
keymap('n', '<Leader>wl', vim.lsp.buf.list_workspace_folders, opts)
keymap('n', '<Leader>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)

-- ============================================
-- ToggleTerm (Terminal)
-- ============================================
keymap('n', '<Leader>t', ':ToggleTerm<CR>', opts)
keymap('n', '<Leader>tf', ':ToggleTerm direction=float<CR>', opts)
keymap('n', '<Leader>th', ':ToggleTerm direction=horizontal<CR>', opts)
keymap('n', '<Leader>tv', ':ToggleTerm direction=vertical<CR>', opts)

-- ============================================
-- Quickfix
-- ============================================
keymap('n', '<Leader>qo', ':copen<CR>', opts)
keymap('n', '<Leader>qc', ':cclose<CR>', opts)
keymap('n', ']q', ':cnext<CR>', opts)
keymap('n', '[q', ':cprev<CR>', opts)

-- ============================================
-- AI Autocomplete (Copilot)
-- ============================================
keymap('i', '<C-l>', 'copilot#Accept("")', { silent = true, expr = true })
keymap('i', '<C-n>', 'copilot#Next()', { silent = true, expr = true })
keymap('i', '<C-p>', 'copilot#Previous()', { silent = true, expr = true })

-- ============================================
-- Save & Quit
-- ============================================
keymap('n', '<Leader>w', ':w<CR>', opts)
keymap('n', '<Leader>q', ':q<CR>', opts)
keymap('n', '<Leader>Q', ':qa!<CR>', opts)
keymap('n', '<Leader>wa', ':wa<CR>', opts)
keymap('n', '<Leader>qa', ':wa<CR>:qa<CR>', opts)

-- ============================================
-- LSP Signature (show function signatures)
-- ============================================
keymap('i', '<C-k>', function()
  require('lsp_signature').toggle_float()
end, opts)
