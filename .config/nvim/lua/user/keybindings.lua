-- =============================================================================
-- VS Code-like Keybindings
-- =============================================================================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =============================================================================
-- General VS Code-like Shortcuts
-- =============================================================================

-- Save & Close
keymap("n", "<C-s>", ":w<CR>", opts)           -- Save
keymap("n", "<C-w>", ":bd<CR>", opts)          -- Close buffer
keymap("n", "<C-q>", ":q<CR>", opts)           -- Quit

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move lines up/down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Better indenting in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- =============================================================================
-- Nvim Tree (File Explorer)
-- =============================================================================
keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)                    -- Toggle tree
keymap("n", "<C-r>", ":NvimTreeFocus<CR>", opts)                     -- Focus tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)                 -- Toggle tree

-- =============================================================================
-- Bufferline (Tabs)
-- =============================================================================
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)              -- Previous tab
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)                -- Next tab
keymap("n", "<leader>bd", ":Bdelete!<CR>", opts)                       -- Close buffer
keymap("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opts)            -- Close left tabs
keymap("n", "<leader>bl", ":BufferLineCloseRight<CR>", opts)           -- Close right tabs

-- =============================================================================
-- Misc
-- =============================================================================
-- Format document
keymap("n", "<leader>f", ":Format<CR>", opts)

-- =============================================================================
-- Language-Specific Keybindings (C, Go, Python, FastAPI)
-- =============================================================================

-- Python / FastAPI
keymap("n", "<leader>rp", ":!python3 %<CR>", opts)           -- Run Python file
keymap("n", "<leader>py", ":!python3 -m ", opts)               -- Run Python module
keymap("n", "<leader>fr", ":!fastapi dev %<CR>", opts)         -- Run FastAPI dev server
keymap("n", "<leader>ut", ":!python3 -m pytest -v<CR>", opts)  -- Run pytest

-- Go
keymap("n", "<leader>rg", ":!go run .<CR>", opts)              -- Run Go file
keymap("n", "<leader>gb", ":!go build .<CR>", opts)            -- Build Go
keymap("n", "<leader>gt", ":!go test ./...<CR>", opts)         -- Run Go tests

-- C / C++
keymap("n", "<leader>rc", ":!gcc % -o %:r && %:r<CR>", opts)    -- Compile & Run C
keymap("n", "<leader>rcpp", ":!g++ % -o %:r && %:r<CR>", opts) -- Compile & Run C++

-- Mason (LSP server management)
keymap("n", "<leader>mm", ":Mason<CR>", opts)                  -- Open Mason
keymap("n", "<leader>mi", ":MasonInstall ", opts)              -- Install LSP
keymap("n", "<leader>mu", ":MasonUpdateAll<CR>", opts)         -- Update LSPs
