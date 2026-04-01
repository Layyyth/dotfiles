-- =============================================================================
-- LSP Signature Configuration
-- =============================================================================
require("lsp_signature").setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
  hint_enable = true,
  hint_prefix = "󰊕 ",
  hint_scheme = "String",
  floating_window = true,
  fix_pos = false,
  hover = false,
  shutdown_echo = true,
  trigger_on_empty_char = true,
  select_signature_key = "<C-k>",
  load_wireframe = true,
  padding = "  ",
  toggle_key = "<C-k>",
  toggle_key_flip_floaty_style = false,
  select_signature = false,
  moved = {
    ":Tree",
    ":Neotree",
    "view :",
    "NvimTree",
    "packer",
    "toggleterm",
    "Trouble",
    "dapui",
    " Outline",
  },
  signature = {
    -- LSP signature for Python
    python = {
      enable = true,
      hint = {
        enable = true,
        virtual = false,
      },
    },
  },
})
