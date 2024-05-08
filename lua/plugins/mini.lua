local utils = require("core.utils")

return {
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
}
