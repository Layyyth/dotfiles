-- =============================================================================
-- Mason LSP Server Manager Configuration
-- =============================================================================
require("mason").setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "󰗱 ",
      package_pending = "󰗱 ",
      package_uninstalled = "󰗱 ",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
  pip = {
    upgrade_pip = false,
    install_args = {},
  },
})

-- Setup LSP servers
require("mason-lspconfig").setup({
  ensure_installed = {
    -- Python
    "pyright",
    "ruff",
    -- Web/JS
    "tsserver",
    -- Lua
    "lua_ls",
    -- Other
    "jsonls",
    "yamlls",
    "marksman",
  },
  automatic_installation = true,
})
