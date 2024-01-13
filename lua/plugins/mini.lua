local utils = require "core.utils"

return {
  {
    "echasnovski/mini.align",
    enabled = utils.enabled("plugins", "mini.align"),
    event = "BufEnter",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.align").setup(utils.create_spec("mini.align", opts))
    end,
  },
  {
    "echasnovski/mini.cursorword",
    enabled = utils.enabled("plugins", "mini.cursorword"),
    event = "CursorHold",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.cursorword").setup(utils.create_spec("mini.cursorword", opts))
    end,
  },
  {
    "echasnovski/mini.misc",
    enabled = utils.enabled("plugins", "mini.misc"),
    event = "BufEnter",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.misc").setup(utils.create_spec("mini.misc", opts))
    end,
  },
  {
    "echasnovski/mini.operators",
    enabled = utils.enabled("plugins", "mini.operators"),
    event = "BufEnter",
    version = "*",
    opts = {},
    config = function(_, opts)
      require("mini.operators").setup(utils.create_spec("mini.operators", opts))
    end,
  },
}
