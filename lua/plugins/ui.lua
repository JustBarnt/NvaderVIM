local utils = require("core.utils")

return {
  {
    "carbon-steel/detour.nvim",
    cmd = { "Detour", "DetourCurrentWindow" },
    enabled = utils.enabled("plugins", "detour"),
  },
  {
    "lewis6991/gitsigns.nvim",
    tag = "v0.7",
    enabled = utils.enabled("plugins", "gitsigns"),
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "|" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "|" },
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(utils.create_spec("gitsigns", opts))
    end,
  },
  {
    "2kabhishek/nerdy.nvim",
    enabled = utils.enabled("plugins", "nerdy"),
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
} ---@type LazySpec[]
