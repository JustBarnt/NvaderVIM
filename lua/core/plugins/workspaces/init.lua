local utils = require "core.utils"

return {
  "natecraddock/workspaces.nvim",
  opts = {
    path = vim.fn.stdpath "data" .. "/workspaces",
    cd_type = "global",
    hooks = {
      add = {},
      remove = {},
      rename = {},
      open_pre = {},
      open = { "Neotree show", "Telescope find_files" },
    },
  },
  keys = {
    {"<leader>sd", "<CMD>Telescope workspaces<CR>", { desc = "Search Workspaces"}}
  },
  config = function(_, opts)
    require("workspaces").setup(utils.create_spec("workspaces", opts))
  end,
}
