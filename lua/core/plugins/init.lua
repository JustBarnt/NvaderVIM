local UI = {
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
    "DNLHC/glance.nvim",
    event = "BufEnter",
    config = function()
      require("core.plugins.configs.glance")
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
    tag = "v0.7",
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

local EDITOR = {
  {
    "axkirillov/hbac.nvim",
    event = "VeryLazy",
    opts = {
      autoclose = true,
      threshold = 5,
    },
    config = function()
      require("core.plugins.configs.hbac")
    end,
  },
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
  },
  {
    "Bekaboo/deadcolumn.nvim",
    event = "BufReadPre",
  },
  {
    "backdround/global-note.nvim",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.global-note")
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    enabled = false,
    event = "BufReadPre",
    opts = {
      render = "virtual",
    },
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>fc", "<CMD>TodoTelescope<CR>", desc = "Find Todo's" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "andrew-george/telescope-themes",
      "d00h/telescope-any",
      { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    },
    config = function()
      require("core.plugins.configs.telescope")
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufEnter",
    config = true,
  },
  {
    "cbochs/grapple.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "Grapple" },
    keys = {
      { "<leader>ha", "<CMD>Grapple toggle<CR>", desc = "Tag Current File" },
      { "<leader>he", "<CMD>Grapple toggle_tags<CR>", desc = "Toggle Tags Menu" },
      { "<leader>1", "<CMD>Grapple select index=1<CR>", desc = "Select Tag 1" },
      { "<leader>2", "<CMD>Grapple select index=2<CR>", desc = "Select Tag 2" },
      { "<leader>3", "<CMD>Grapple select index=3<CR>", desc = "Select Tag 3" },
      { "<leader>4", "<CMD>Grapple select index=4<CR>", desc = "Select Tag 4" },
      { "<leader>hn", "<CMD>Grapple cycle_tags next<CR>", desc = "Go-To Next Tag" },
      { "<leader>hp", "<CMD>Grapple cycle_tags prev<CR>", desc = "Go-To Previous Tag" },
    },
    dependencies = {
      {
        "cbochs/portal.nvim",
        cmd = { "Portal" },
        keys = {
          { "<leader>Hn", "<CMD>Portal grapple forward<CR>", desc = "Portal Grapple Next" },
          { "<leader>Hp", "<CMD>Portal grapple backward<CR>", desc = "Portal Grapple Next" },
        },
      },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("core.plugins.configs.grapple")
    end,
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
    config = function(_, opts)
      require("core.plugins.configs.flash")
    end,
  },
}

local CODING = {
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
    },
    config = function()
      require("core.plugins.configs.completion")
    end,
  },
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
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
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "InsertEnter",
  },
}

local THEMES = {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("core.plugins.configs.themes.tokyonight")
    end,
  },
}

return { UI, EDITOR, CODING, THEMES }
