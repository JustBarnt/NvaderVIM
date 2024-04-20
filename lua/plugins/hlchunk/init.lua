local utils = require "core.utils"
return {
  "shellRaining/hlchunk.nvim",
  event = "UIEnter",
  enabled = utils.enabled("plugins", "hlchunk"),
  opts = function()
    return require("plugins.hlchunk.config").config
  end,
  config = function(_, opts)
    require("hlchunk").setup(utils.create_spec("hlchunk", opts))
  end,
}
