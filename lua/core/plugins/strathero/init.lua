local utils = require "core.utils"

return {
  "willothy/strat-hero.nvim",
  cmd = "StratHero",
  opts = {},
  config = function(_, opts)
    require("strat-hero").setup(utils.create_spec("strat-hero", opts))
  end,
}
