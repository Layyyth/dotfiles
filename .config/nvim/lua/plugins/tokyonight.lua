-- =============================================================================
-- Tokyo Night Theme Configuration
-- =============================================================================
require("tokyonight").setup({
  style = "night",          -- "night", "day", "storm", "moon", "dusk"
  light_style = "day",     -- The background style for the light theme
  transparent = false,      -- Don't use transparent background
  terminal_colors = true,  -- Define terminal colors
  styles = {
    comments = { italic = true, fg = "#565f89" },
    keywords = { italic = true, fg = "#bb9af7" },
    functions = { fg = "#7aa2f7" },
    variables = { fg = "#c0caf5" },
    -- For diagnostic colors
    diagnostic_error = { fg = "#f7768e" },
    diagnostic_warning = { fg = "#e0af68" },
    diagnostic_hint = { fg = "#7dcfff" },
    diagnostic_info = { fg = "#7aa2f7" },
  },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end,
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
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
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})

-- Set the colorscheme
vim.cmd("colorscheme tokyonight")
