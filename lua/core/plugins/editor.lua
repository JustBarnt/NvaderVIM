return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.edgy")
    end,
  },
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
    keys = {
      { "<leader>gn", "<CMD>GlobalNote<CR>", desc = "Open Global Note Pad" },
    },
    config = function()
      require("core.plugins.configs.global-note")
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.ccc")
    end,
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
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
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
    "MagicDuck/grug-far.nvim",
    config = function()
      require("core.plugins.configs.grug-far")
    end,
  },
  {
    "nguyenvukhang/nvim-toggler",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.nvim-toggler")
    end,
  },
}
