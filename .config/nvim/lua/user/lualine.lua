-- =============================================================================
-- Lualine Configuration (VS Code-like status bar)
-- =============================================================================
require("lualine").setup({
  options = {
    theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    globalstatus = true,
    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
      {
        "filetype",
        icon_only = true,
      },
      {
        "filename",
        path = 1,
        symbols = {
          modified = " ●",
          readonly = "",
          unnamed = "[No Name]",
        },
      },
    },
    lualine_x = {
      {
        function()
          return " LSP"
        end,
      },
    },
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    },
  },
  extensions = { "nvim-tree" },
})
