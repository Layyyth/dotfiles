-- =============================================================================
-- Treesitter Configuration (Syntax Highlighting)
-- =============================================================================
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if status_ok then
  treesitter.setup({
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "python",
      "javascript",
      "typescript",
      "json",
      "yaml",
      "html",
      "css",
      "rust",
      "go",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
end
