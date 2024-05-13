return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
