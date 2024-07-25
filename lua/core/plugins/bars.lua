return {
  dir = vim.fn.stdpath("config") .. "/lua/custom_plugins/bars-N-lines.nvim",
  name = "bars",
  config = function()
    require("bars").setup()
    require("bars.colors").setup({})
  end,
}
