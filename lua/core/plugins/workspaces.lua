return {
  "natecraddock/workspaces.nvim",
  opts = {
    path = vim.fn.stdpath("data") .. "/workspaces",
    cd_type = "global",
    hooks = {
      add = {},
      remove = {},
      rename = {},
      open_pre = {},
      open = { "Telescope find_files" },
    },
  },
  keys = {
    { "<leader>sd", "<CMD>Telescope workspaces<CR>", { desc = "Search Workspaces" } },
  },
}
