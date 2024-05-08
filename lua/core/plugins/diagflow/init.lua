local utils = require("core.utils")

return {
  "dgagn/diagflow.nvim",
  event = "BufReadPre",
  opts = {},
  config = function(_, opts)
    require("diagflow").setup(utils.create_spec("diagflow", opts))
  end,
}
