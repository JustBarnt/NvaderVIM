return {
  "lewis6991/gitsigns.nvim",
  tag = "v0.9.0",
  event = "BufReadPre",
  opts = {
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┃" },
    },
  },
}
