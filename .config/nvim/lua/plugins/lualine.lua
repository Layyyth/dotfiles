-- =============================================================================
-- Lualine Status Bar Configuration
-- ==============================================================================
local lualine = require("lualine")

-- Helper function for lazy loading
local function lazy_load(module)
  return function()
    require(module)
  end
end

-- Config
lualine.setup({
  options = {
    theme = "tokyonight",
    component_separators = { left = " ", right = " " },
    section_separators = { left = " ", right = " " },
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
          error = "E ",
          warn = "W ",
          info = "I ",
          hint = "H ",
        },
      },
      {
        "filename",
        path = 1,
        symbols = {
          modified = " ●",
          readonly = " 󰌾 ",
          unnamed = "[No Name]",
        },
      },
    },
    lualine_x = {
      {
        function()
          local msg = "No LSP"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
      },
      {
        function()
          local current_mode = vim.api.nvim_get_mode().mode
          return current_mode:upper()
        end,
        color = function()
          local mode_color = {
            n = "lualine_a_normal",
            i = "lualine_a_insert",
            v = "lualine_a_visual",
            V = "lualine_a_visual",
            ["\22"] = "lualine_a_visual",
            c = "lualine_a_command",
            no = "lualine_a_normal",
            s = "lualine_a_insert",
            ["\19"] = "lualine_a_visual",
            ic = "lualine_a_insert",
          }
          return mode_color[current_mode] or "lualine_a_normal"
        end,
      },
      {
        function()
          local s = require("nvim-spectre").open()
          if s then
            return "Spectre"
          end
          return ""
        end,
        cond = lazy_load("nvim-spectre"),
      },
    },
    lualine_y = {
      { "filetype", icon_only = true },
      {
        function()
          local line = vim.fn.line("$")
          local col = vim.fn.col("$")
          return string.format("%d:%d", line, col)
        end,
        icon = " 󰉋",
      },
    },
    lualine_z = {
      { "location" },
      {
        "progress",
        icon = " 󰕾",
      },
    },
  },
  extensions = { "nvim-tree", "telescope" },
})
