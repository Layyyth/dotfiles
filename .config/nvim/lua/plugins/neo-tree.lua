-- =============================================================================
-- Neo-tree File Explorer - Minimal Config
-- =============================================================================
require("neo-tree").setup({
  close_if_last_window = false,
  enable_git_status = true,
  enable_diagnostics = true,
  window = {
    position = "left",
    width = 45,
  },
  default_source = "filesystem",
  sources = { "filesystem", "buffers", "git_status" },
  filesystem = {
    filtered_items = { hide_hidden = false },
  },
})
