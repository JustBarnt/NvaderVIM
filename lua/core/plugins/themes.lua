return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("core.plugins.configs.themes.tokyonight")
    end,
  },
}
