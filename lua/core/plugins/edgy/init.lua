local utils = require "core.utils"

return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    options = {
      left = { size = 30 },
      right = { size = 80 },
      top = { size = 30 },
      bottom = { size = 30 },
    },
    ---@type(Edgy.View.Opts|string)[]
    top = {},
    ---@type(Edgy.View.Opts|string)[]
    bottom = {
      {
        ft = "Trouble",
        size = { height = 0.4 },
      },
      { ft = "qf", title = "QuickFix" },
    },
    ---@type(Edgy.View.Opts|string)[]
    left = {},
    ---@type(Edgy.View.Opts|string)[]
    right = {
      { ft = "spectre_panel", size = { height = 0.4 } },
    },
  },
  config = function(_, opts)
    require("edgy").setup(utils.create_spec("edgy", opts))
  end,
}
