-- =============================================================================
-- Plugin Manager Configuration - lazy.nvim (Modern Version)
-- =============================================================================
-- Bootstrap lazy.nvim
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

-- Setup lazy.nvim
require("lazy").setup({
  -- ============================================
  -- Theme
  -- ============================================
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.tokyonight")
    end,
  },

  -- ============================================
  -- UI Enhancements
  -- ============================================
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.which-key")
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- ============================================
  -- File Explorer (VS Code sidebar)
  -- ============================================
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    config = function()
      require("plugins.neo-tree")
    end,
  },

  -- ============================================
  -- Fuzzy Finder (VS Code search)
  -- ============================================
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    config = function()
      require("plugins.telescope")
    end,
  },

  -- ============================================
  -- Syntax Highlighting (Treesitter)
  -- ============================================
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- ============================================
  -- LSP (Language Server Protocol) - Modern
  -- ============================================
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("plugins.mason")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },

  -- ============================================
  -- Autocomplete
  -- ============================================
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.cmp")
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-buffer",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-path",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "InsertEnter",
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    event = "InsertEnter",
    config = function()
      require("plugins.luasnip")
    end,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    event = "InsertEnter",
  },
  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  },

  -- ============================================
  -- AI Autocomplete (Copilot)
  -- ============================================
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_enabled = true
      vim.g.copilot_no_tab_map = true
    end,
  },

  -- ============================================
  -- LSP Signature
  -- ============================================
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        handler_opts = { border = "rounded" },
      })
    end,
  },

  -- ============================================
  -- Git Integration
  -- ============================================
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    config = function()
      require("plugins.neogit")
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.gitsigns")
    end,
  },

  -- ============================================
  -- Terminal
  -- ============================================
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "ToggleTermToggleAll" },
    version = "*",
    config = function()
      require("plugins.toggleterm")
    end,
  },

  -- ============================================
  -- Python Tools (Linters & Formatters)
  -- ============================================
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.null-ls")
    end,
  },

  -- ============================================
  -- Markdown
  -- ============================================
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
  },

  -- ============================================
  -- Quick fixes & utilities
  -- ============================================
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.todo-comments")
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    config = function()
      require("plugins.spectre")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },

  -- ============================================
  -- Project Management
  -- ============================================
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.project")
    end,
  },

  -- ============================================
  -- Misc
  -- ============================================
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },
}, {
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight" } },
  rocks = {
    enabled = false,
  },
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
