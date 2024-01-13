local utils = require "core.utils"
return {
  "willothy/wezterm.nvim",
  event = "VeryLazy",
  enabled = vim.fn.executable "wezterm" == 1,
  opts = {},
  config = function(_, opts)
    require("wezterm").setup(utils.create_spec("wezterm", opts))
  end,
}
