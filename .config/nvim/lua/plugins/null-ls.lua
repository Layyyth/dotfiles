-- =============================================================================
-- Null-ls (Linters & Formatters) Configuration
-- =============================================================================
local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormat", {})

local function format()
  vim.lsp.buf.format({ async = false })
end

local function format_on_save(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_clear_autocmds({
      group = augroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        format()
      end,
    })
  end
end

null_ls.setup({
  sources = {
    -- Python formatters
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt,
    -- Python linters
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.trail_space,
    -- Shell
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shellcheck,
  },
  diagnostics_format = "[#{c}] #{m} (#{s})",
  on_attach = function(client, bufnr)
    format_on_save(client, bufnr)
  end,
})
