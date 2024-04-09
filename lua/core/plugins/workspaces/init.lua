local utils = require "core.utils"

return {
  "natecraddock/workspaces.nvim",
  cmd = {
    "WorkspacesAdd",
    "WorkspacesList",
    "WorkspacesOpen",
    "WorkspacesAddDir",
    "WorkspacesRemove",
    "WorkspacesRename",
    "WorkspacesSyncDirs",
  },
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
  config = function(_, opts)
    require("workspaces").setup(utils.create_spec("workspaces", opts))
    require("telescope").load_extension "workspaces"
    utils.map("n", "<leader>sd", "<CMD>Telescope workspaces<CR>", { desc = "Search Workspaces" })
  end,
}
