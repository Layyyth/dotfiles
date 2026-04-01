-- =============================================================================
-- Todo Comments Configuration
-- =============================================================================
require("todo-comments").setup({
  signs = true,
  keywords = {
    FIX = {
      icon = "󰍷 ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = {
      icon = "󰍷 ",
      color = "info",
      alt = { "TODO" },
    },
    HACK = {
      icon = "󰍷 ",
      color = "warning",
      alt = { "HACK" },
    },
    WARN = {
      icon = "󰍷 ",
      color = "warning",
      alt = { "WARN", "WARNING" },
    },
    PERF = {
      icon = "󰍷 ",
      color = "perf",
      alt = { "PERF", "OPTIM", "PERFORMANCE", "OPTIMIZE" },
    },
    NOTE = {
      icon = "󰍷 ",
      color = "hint",
      alt = { "NOTE", "INFO" },
    },
    TEST = {
      icon = "󰍷 ",
      color = "test",
      alt = { "TEST", "TESTS", "TESTING" },
    },
  },
  merge_keywords = true,
  highlight = {
    multiline = true,
    multiline_pattern = "^.",
    before = "",
    after = "󰍷",
    exclude = {},
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    perf = { "DiagnosticHint", "#F59E0B" },
    test = { "DiagnosticHint", "#8B5CF6" },
  },
  search = {
    command = "rg",
    args = {
      "--hidden",
      "--glob=!**/.git/*",
      "--glob=!**/node_modules/*",
      "--glob=!**/.venv/*",
      "--glob=!**/venv/*",
      "--glob=!**/__pycache__/*",
      "--glob=!**/dist/*",
      "--glob=!**/build/*",
      "--glob=!**/*.pyc",
      "-i",
      "TODO|FIXME|HACK|WARN|PERF|NOTE|TEST",
    },
    pattern = [[\b(TODO|FIXME|HACK|WARN|PERF|NOTE|TEST)\b]],
  },
})
