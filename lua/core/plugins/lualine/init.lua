local utils = require "core.utils"
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "abeldekat/harpoonline",
    version = "*",
  },
  enabled = false,
  event = "ColorScheme",
  opts = function()
    local components = require "plugins.components.lualine_components"
    local harpoonline = require "harpoonline"
    harpoonline.setup {
      on_update = function()
        require("lualine").refresh()
      end,
    }

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = " ",
            separator = { right = "" },
          },
        },
        lualine_b = {
          {
            "filename",
            file_statue = true,
            path = 4,
            symbols = {
              modified = "",
              read_only = "",
              unnamed = "󰂾",
              newfile = "",
            },
            separator = { right = "" },
          },
          {
            "branch",
            icon = "",
            separator = { right = "" },
          },
        },
        lualine_c = {
          harpoonline.format,
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp", "nvim_diagnostic" },
            sections = { "error", "warn" },
            always_visible = true,
            separator = { left = "" },
          },
        },
        lualine_y = {
          {
            components.pomodoro_component,
          },
        },
        lualine_z = {
          {
            "location",
            icon = "",
            separator = { left = "" },
          },
          {
            "filetype",
            colored = false,
            separator = { left = "" },
          },
        },
      },
    }
  end,

  config = function(_, opts)
    require("lualine").setup(utils.create_spec("lualine", opts))
  end,
}
