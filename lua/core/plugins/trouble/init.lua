local utils = require("core.utils")

return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  branch = "main",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>xx", "<CMD>Trouble<CR>", desc = "Trouble Toggle" },
    { "<leader>xd", "<CMD>Trouble diagnostics<CR>", desc = "Trouble Document Diagnostics" },
    { "<leader>xq", "<CMD>Trouble quickfix<CR>", desc = "Trouble Quick Fix" },
    { "<leader>xl", "<CMD>Trouble loclist<CR>", desc = "Trouble Local List" },
    {
      "<leader>o",
      "<CMD>Trouble symbols toggle pinned=false results.win.relative=true results.win.position=right<CR>",
      desc = "Document Sybmols (Trouble)",
    },
  },
  ---@class trouble.Config
  opts = {
    ---@type trouble.Window.opts
    win = {},
    ---@type trouble.Window.opts
    preview = {},
    ---@type table<string, string|trouble.Action>
    keys = {},
    ---@type table<string, trouble.Mode>
    modes = {},
  },
  config = function(_, opts)
    require("trouble").setup(utils.create_spec("trouble", opts))
  end,
}
