-- =============================================================================
-- Spectre (Search & Replace) Configuration
-- =============================================================================
require("spectre").setup({
  mapping = {
    ["send_to_qf"] = {
      map = "Q",
      cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
      desc = "send to quickfix",
    },
    ["replace_cmd"] = {
      map = "<C-p>",
      cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
      desc = "replace command",
    },
    ["show_result"] = {
      map = "r",
      cmd = "<cmd>lua require('spectre.actions').show_result()<CR>",
      desc = "show result",
    },
    ["run_current_search"] = {
      map = "<leader>r",
      cmd = "<cmd>lua require('spectre.actions').run_current_search()<CR>",
      desc = "run current search",
    },
    ["change_view"] = {
      map = "v",
      cmd = "<cmd>lua require('spectre.actions').change_view()<CR>",
      desc = "change result view",
    },
    ["change_replace_sensitivity"] = {
      map = "I",
      cmd = "<cmd>lua require('spectre.actions').change_replace_sensitivity()<CR>",
      desc = "change sensitivity",
    },
    ["toggle_live_update"] = {
      map = "u",
      cmd = "<cmd>lua require('spectre.actions').toggle_live_update()<CR>",
      desc = "toggle live update",
    },
    ["toggle_ignore_case"] = {
      map = "i",
      cmd = "<cmd>lua require('spectre.actions').toggle_ignore_case()<CR>",
      desc = "toggle ignore case",
    },
    ["toggle_ignore_hidden"] = {
      map = "h",
      cmd = "<cmd>lua require('spectre.actions').toggle_ignore_hidden()<CR>",
      desc = "toggle ignore hidden",
    },
    ["navigate_next"] = {
      map = "<leader>N",
      cmd = "<cmd>lua require('spectre.actions').navigate({next=true})<CR>",
      desc = "navigate next result",
    },
    ["navigate_prev"] = {
      map = "<leader>n",
      cmd = "<cmd>lua require('spectre.actions').navigate({next=false})<CR>",
      desc = "navigate prev result",
    },
  },
})
