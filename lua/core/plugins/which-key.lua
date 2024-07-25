return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    ---@class wk.Opts
    local opts = {
      preset = "modern",
      plugins = {
        marks = false,
        registers = false,
        spelling = {
          enabled = true,
          suggestions = 5,
        },
      },
      ---@type wk.Win.opts
      win = {
        title = false,
        width = 0.95,
        height = { min = 2, max = 10 },
        border = "rounded",
        padding = { 1, 1 },
        wo = {
          winblend = 10,
        },
      },
      disable = {
        ft = { "xml", "log" },
        bt = {},
      },
    }
  end,
}
