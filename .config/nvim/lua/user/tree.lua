-- =============================================================================
-- Nvim Tree Configuration (File Explorer)
-- =============================================================================
require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  view = {
    width = 35,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    indent_width = 2,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          untracked = "★",
        },
      },
    },
  },
  actions = {
    use_system_clipboard = true,
  },
  filters = {
    custom = { "*.swp", "*.bak" },
  },
})
