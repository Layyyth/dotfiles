-- =============================================================================
-- Telescope Fuzzy Finder Configuration
-- =============================================================================
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = " 󰈞 ",
    selection_caret = " 󰌾 ",
    path_display = { "smart", "truncate" },
    file_ignore_patterns = {
      ".git/",
      "node_modules/",
      "__pycache__/",
      "*.pyc",
      ".venv/",
      "venv/",
      ".env",
      "dist/",
      "build/",
      ".pytest_cache/",
      "%.jpg",
      "%.png",
      "%.jpeg",
      "%.bmp",
      "%.gif",
      "%.tiff",
      "%.svg",
      "%.ico",
      "%.woff",
      "%.woff2",
      "%.ttf",
      "%.eot",
    },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        width = 0.9,
        prompt_position = "top",
      },
    },
    sorting_strategy = "ascending",
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    file_sorter = require("telescope.sorters").get_fzy_file_sorter,
    generic_sorter = require("telescope.sorters").get_fzy_sorter,
    file_previewer_mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
      n = {
        ["q"] = actions.close,
      },
    },
    live_grep_mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      hidden = true,
    },
    live_grep = {
      theme = "ivy",
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
    },
    oldfiles = {
      theme = "dropdown",
      previewer = false,
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

-- Load telescope extensions
pcall(telescope.load_extension, "fzy_native")
pcall(telescope.load_extension, "projects")
