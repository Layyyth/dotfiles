-- =============================================================================
-- Bufferline Configuration (Tabs)
-- =============================================================================
require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diag)
      local icons = require("nvim-web-devicons")
      local this_buf = vim.api.nvim_get_current_buf()
      local diagnostics = vim.diagnostic.get(this_buf)
      local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }
      for _, d in ipairs(diagnostics) do
        counts[d.severity] = (counts[d.severity] or 0) + 1
      end
      local result = {}
      for severity, count in pairs(counts) do
        if count > 0 then
          table.insert(result, string.format("%s: %d", severity:sub(1, 1), count))
        end
      end
      return #result > 0 and " " .. table.concat(result, " ") or ""
    end,
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    diagnostics_color = {
      error = "DiagnosticError",
      warn = "DiagnosticWarn",
      info = "DiagnosticInfo",
      hint = "DiagnosticHint",
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlight = "Directory",
        text_align = "left",
      },
    },
    separator_style = "thin",
    indicator = {
      style = "icon",
      icon = "▎",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
  },
})
