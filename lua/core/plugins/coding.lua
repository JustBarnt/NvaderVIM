return {
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.garbage-day")
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    config = function()
      require("core.plugins.configs.lazydev")
    end,
  },
  {
    "Bilal2453/luvit-meta",
    lazy = true,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    config = function()
      require("core.plugins.configs.completion")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Toggle Comment Line Wise" },
      { "gb", mode = { "n", "v" }, desc = "Toggle Comment Block Wise" },
    },
    opts = function()
      local commentstring_avail, comment_string = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and comment_string and { pre_hook = comment_string.create_pre_hook() } or {}
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      require("core.plugins.configs.dap")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("core.plugins.configs.autopairs")
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    command = "IncRename",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash"},
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c", "n" }, function() require("flash").toggle() end, desc = "Toggle Flash Search for ['/', '?'] " },
    },
    config = function()
      require("core.plugins.configs.flash")
    end,
  },
}
