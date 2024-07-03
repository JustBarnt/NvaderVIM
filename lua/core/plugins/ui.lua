return {
  -- {
  --   dir = vim.fn.stdpath("config") .. "\\lua\\custom_plugins\\bars-N-lines.nvim",
  --   name = "bars",
  --   config = function()
  --     require("core.plugins.configs.bars")
  --   end,
  -- },
  {
    "willothy/nvim-cokeline",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.cokeline")
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    event = "UIEnter",
    config = function()
      require("core.plugins.configs.statuscol")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("core.plugins.configs.noice")
    end,
  },
  {
    "rasulomaroff/reactive.nvim",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.reactive")
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("core.plugins.configs.hlchunk")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "linrongbin16/lsp-progress.nvim",
      "abeldekat/harpoonline",
    },
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.lualine")
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPre",
    config = function()
      require("core.plugins.configs.illuminate")
    end,
  },
  {
    "carbon-steel/detour.nvim",
    cmd = { "Detour", "DetourCurrentWindow" },
  },
  {
    "lewis6991/gitsigns.nvim",
    tag = "v0.9.0",
    event = "BufReadPre",
    config = function()
      require("core.plugins.configs.gitsigns")
    end,
  },
  {
    "2kabhishek/nerdy.nvim",
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
}
