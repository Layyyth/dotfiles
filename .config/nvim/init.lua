-- =============================================================================
-- Layth's Neovim Configuration
-- VS Code-like experience with modern plugins
-- =============================================================================

-- Set leader keys before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable true colors early
vim.opt.termguicolors = true

-- =============================================================================
-- Package Manager Setup (lazy.nvim)
-- =============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- Plugin Configuration
-- =============================================================================
require("lazy").setup({
  -- =============================================================================
  -- Theme (Tokyo Night - VS Code-like dark theme)
  -- =============================================================================
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  -- =============================================================================
  -- UI Components (Statusline, Bufferline, File Tree)
  -- =============================================================================
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree.lua" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- =============================================================================
  -- Autocomplete
  -- =============================================================================
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- =============================================================================
  -- Utilities
  -- =============================================================================
  {
    "windwp/nvim-autopairs",
  },
  {
    "norcalli/nvim-colorizer.lua",
  },
  {
    "lewis6991/gitsigns.nvim",
  },

  -- =============================================================================
  -- LSP Support (for C, Go, Python, FastAPI)
  -- =============================================================================
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "nvim-neotest/nvim-nio",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
}, {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrwPlugin",
      },
    },
  },
})

-- =============================================================================
-- General Settings
-- =============================================================================
require("user.options")
require("user.keybindings")

-- Load plugin configs
require("user.tree")
require("user.lualine")
require("user.bufferline")
require("user.cmp")
require("user.autopairs")
require("user.colorizer")
require("user.gitsigns")
require("user.lsp")
require("user.dap")
require("user.snippets")

-- Apply theme manually after everything loads
vim.cmd("colorscheme tokyonight")

-- Print welcome message
vim.defer_fn(function()
  vim.cmd("echo '🚀 Neovim loaded with VS Code-like setup!'")
end, 1000)
