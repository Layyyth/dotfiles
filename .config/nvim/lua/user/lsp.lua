-- =============================================================================
-- LSP Configuration (C, Go, Python, FastAPI)
-- Full LSP support for Neovim 0.10+
-- =============================================================================

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Diagnostic config
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Keybindings for LSP
local buf_map = function(bufnr, mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    buffer = bufnr,
    desc = desc,
    noremap = true,
    silent = true,
  })
end

-- LSP attach handler
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    -- Common LSP keybindings
    buf_map(bufnr, "n", "gd", vim.lsp.buf.definition, "Go to definition")
    buf_map(bufnr, "n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    buf_map(bufnr, "n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    buf_map(bufnr, "n", "gr", vim.lsp.buf.references, "Go to references")
    buf_map(bufnr, "n", "K", vim.lsp.buf.hover, "Hover")
    buf_map(bufnr, "n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    buf_map(bufnr, "n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    buf_map(bufnr, "n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    buf_map(bufnr, "n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
  end,
})

-- Mason setup - for installing LSP servers
require("mason").setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

-- Use mason-lspconfig for automatic LSP setup
require("mason-lspconfig").setup({
  ensure_installed = {
    -- Languages
    "clangd",       -- C/C++
    "gopls",        -- Go
    "pyright",      -- Python
    "lua_ls",       -- Lua
    "rust_analyzer",-- Rust
    "tsserver",     -- TypeScript/JavaScript
    "html",         -- HTML
    "jsonls",       -- JSON
    "tailwindcss",  -- Tailwind CSS
    "prismals",     -- Prisma
    "yaml",         -- YAML
    "dockerls",     -- Docker
  },
  automatic_installation = true,
})

-- Print LSP ready
vim.defer_fn(function()
  print("🔬 LSP ready! Run :Mason to install/manage LSP servers")
end, 2000)
