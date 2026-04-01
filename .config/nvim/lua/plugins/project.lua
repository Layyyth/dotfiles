-- =============================================================================
-- Project.nvim Configuration
-- =============================================================================
require("project_nvim").setup({
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = {
    ".git",
    ".vscode",
    ".venv",
    "venv",
    "env",
    "__pycache__",
    "pyproject.toml",
    "setup.py",
    "requirements.txt",
    "Cargo.toml",
    "package.json",
  },
  ignore_lsp = false,
  exclude_dirs = {
    "~/.cargo",
    "~/.local",
    "~/.cache",
  },
  scope_changing = {
    workspace = true,
  },
  show_branch = false,
  notification = true,
})

-- Load telescope project integration
pcall(require("telescope").load_extension, "projects")
