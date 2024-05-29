local utils = require("core.utils")

return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      transparent = true,
      styles = {
        functions = { bold = true },
        keywords = { bold = true },
        -- floats = "transparent",
      },
      on_highlights = function(hl, c)
        local highlight_overrides = require("core.ui.tokyonight")
        highlight_overrides.overrides(hl, c)
      end,
      on_colors = function(_) end,
    },
    config = function(_, opts)
      require("tokyonight").setup(utils.create_spec("tokyonight", opts))
    end,
  },
}
