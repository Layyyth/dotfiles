-- =============================================================================
-- Tokyo Night Theme Configuration
-- VS Code-like dark theme
-- =============================================================================
require("tokyonight").setup({
  style = "night",
  transparent = false,
  terminal_colors = true,
})

-- Set the colorscheme
vim.cmd("colorscheme tokyonight")
