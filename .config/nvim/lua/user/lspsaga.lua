-- =============================================================================
-- Lspsaga Configuration (LSP UI Enhancements)
-- =============================================================================
require("lspsaga").setup({
  ui = {
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type: single, double, rounded, solid, shadow
    border = "rounded",
    -- winblend = 0,
    -- expand = "normal",
    -- reverse = false,
    -- show研发的
    mappings = {
      -- -> string | table
      -- quit = "q",
      -- jump = { "<CR>", "o" },
      -- expand_or_jump = { "<CR>" },
      -- close = { "q", "<Esc>" },
      -- enter = "<CR>",
      -- cancel = "<C-c>", "<Esc>",
    },
  },
  -- symbol in lightbulb (virtual text)
  lightbulb = {
    enable = true,
    sign = false,
    virtual_text = "💡",
    sign_priority = 40,
  },
  -- symbol in outline
  outline = {
    auto_close = true,
    max_height = 15,
    minimap = true,
    keys = {
      jump = "o",
      expand_and_jump = "<CR>",
      close = { "q", "<Esc>" },
    },
  },
  -- symbol in callHierarchy
  callhierarchy = {
    show_detail = false,
    keys = {
      expand_or_jump = "<CR>",
      visit = "t",
      jump = "o",
      quit = "q",
    },
  },
  -- symbol in statusbar
  statusline = {
    enable = false,
    reset = true,
    show = true,
    icon = "⚡",
    -- loader_pattern: true | false
    -- The pattern is: "⚡ loading"
    -- It supports strings
    -- loader_pattern = "",
  },
  -- symbol in breadcrumb
  breadcrumb = {
    enable = true,
    sign = true,
    icon = "»",
    -- symbol in diagnostic
    -- sign = false,
    -- text = { hi= "" }
  },
  -- symbol in diagnostic
  diagnostic = {
    show = true,
    on_dir = true,
    on_insert = false,
    show_code_actions = true,
    -- virtual text
    virtual_text = false,
    -- showDiagnostic = false,
    signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    },
    -- showDiagnostic = false,
    -- The query to search
    -- jump to diagnostic
    -- keys = {
    --   exec_action = "o",
    --   term = "<CR>",
    --   close = "q",
    --   quit = "esc",
    --   jump = { "gr", "gt" },
    -- },
  },
  -- definitions
  definition = {
    -- width, height
    width = 40,
    height = 10,
    -- keys
    keys = {
      edit = "<C-o>",
      vsplit = "<C-v>",
      split = "<C-x>",
      tabnew = "<C-t>",
      quit = "q",
    },
    -- ui
    -- border type: single, double, rounded, solid, shadow
    border = "rounded",
    -- winblend = 0,
  },
  -- references
  references = {
    enable = true,
    -- use a tree for it
    -- tree = false,
    show_definition = false,
    -- keys
    keys = {
      -- usage: string | table
      -- exec_action = "o"
      quit = "q",
    },
  },
  -- rename
  rename = {
    -- assign keys
    -- keys = {
    --   quit = "q"
    -- }
  },
  -- format
  format = {
    -- how to show result
    use = true,
    -- wait ms
    silence = false,
  },
  -- incoming/outgoing calls
  incoming_calls = {
    enable = true,
    -- virtual text
    virtual_text = false,
  },
  outgoing_calls = {
    enable = true,
    -- virtual text
    virtual_text = false,
  },
})
