-- =============================================================================
-- Tokyo Night Theme Configuration
-- VS Code-like dark theme
-- =============================================================================
require("tokyonight").setup({
  style = "night",       -- night, storm, day, moon
  light_style = "day",
  transparent = false,   -- Enable transparent background
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help", "terminal", "packer" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
  on_colors = function(colors)
    colors.hint = "orange"
    colors.error = "#ff0000"
  end,
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_float,
      fg = c.fg,
    }
    hl.TelescopeBorder = {
      bg = c.bg_float,
      fg = c.bg_float,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_float,
      fg = c.bg_float,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_float,
      fg = c.bg_float,
    }
  end,
})

-- Set the colorscheme
vim.cmd("colorscheme tokyonight")
