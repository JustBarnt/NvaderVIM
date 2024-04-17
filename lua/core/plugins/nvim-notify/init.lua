local utils = require 'core.utils'
return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "NotifyBackground",
      fps = 60,
      render = "wrapped-compact",
      stages = "fade",
      timeout = 2500,
    },
    config = function(_, opts)
      require("notify").setup(utils.create_spec("notify", opts))
    end,
  },
}
