local utils = require("core.utils")

return {
  {
    "uga-rosa/ccc.nvim",
    enabled = utils.enabled("plugins", "ccc"),
    cmd = { "CccPick", "CccConvert" },
    keys = {
      { "<leader>cp", "<CMD>CccPick<CR>", desc = "Open Color Picker" },
      { "<leader>cc", "<CMD>CccConvert<CR>", desc = "Convert Color Under Cursor" },
    },
    opts = {
      highlighter = {
        auto_enable = false,
        lsp = false,
      },
    },
    config = function(_, opts)
      require("ccc").setup(utils.create_spec("ccc", opts))
    end,
  },
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
    "mvllow/modes.nvim",
    event = "BufReadPre",
    tag = "v0.2.0",
    opts = function()
      local get_hl = vim.api.nvim_get_hl

      return {
        colors = {
          delete = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.error" }).fg),
          copy = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.warning" }).fg),
          insert = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.todo" }).fg),
          visual = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.info" }).fg),
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.15,

        -- Enable cursor highlights
        set_cursor = false,

        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,

        -- Enable line number highlights to match cursorline
        set_number = true,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { "NvimTree", "TelescopePrompt" },
      }
    end,
    config = function(_, opts)
      require("modes").setup(utils.create_spec("modes", opts))
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
