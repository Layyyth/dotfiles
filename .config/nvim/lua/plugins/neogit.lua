-- =============================================================================
-- Neogit Configuration
-- =============================================================================
local neogit = require("neogit")

neogit.setup({
  disable_commit = false,
  disable_builtin_blame = false,
  disable_context_highlighting = false,
  disable_insert_on_commit = "auto",
  disable_line_numbers = false,
  disable_signs = false,
  filewatcher = {
    enabled = true,
  },
  git_consistency = "preference",
  hide_unesco_changes = true,
  init_screen = {
    kind = "split",
  },
  integration = {
    telescope = true,
    fzf = false,
  },
  kind = "split",
  layout = {
    split = {
      vertical = false,
    },
  },
  commit_editor = {
    kind = "split",
  },
  popup = {
    kind = "split",
  },
  refresh_screen = true,
  signs = {
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  mappings = {
    -- stylua: ignore start
    -- stylua: ignore end
  },
})

-- Custom git commands
vim.api.nvim_create_user_command("Git", function()
  neogit.open()
end, {})

vim.api.nvim_create_user_command("GitCommit", function()
  neogit.commit()
end, {})

vim.api.nvim_create_user_command("GitPush", function()
  vim.fn.system("git push")
end, {})
