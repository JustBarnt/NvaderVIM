local utils = require("core.utils")

return {
  {
    "axkirillov/hbac.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "hbac"),
    opts = {
      autoclose = true,
      threshold = 5,
    },
    config = function(_, opts)
      require("hbac").setup(utils.create_spec("hbac", opts))
    end,
  },
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "bufdelete"),
  },
  {
    "Bekaboo/deadcolumn.nvim",
    event = "BufReadPre",
    enabled = utils.enabled("plugins", "deadcolumn"),
    opts = {},
    config = function(_, opts)
      require("deadcolumn").setup(utils.create_spec("deadcolumn", opts))
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "flash"),
        -- stylua: ignore
        keys = {
            { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash"},
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c", "n" }, function() require("flash").toggle() end, desc = "Toggle Flash Search for ['/', '?'] " },
        },
    ---@type Flash.Config
    opts = {
      ---@type table<string, Flash.Config>
      modes = {
        char = {
          jump_labels = true,
        },
        treesitter = {
          search = { incremental = true },
        },
      },
    },
    config = function(_, opts)
      require("flash").setup(utils.create_spec("flash", opts))
      require("flash").toggle(false)
    end,
  },
  {
    "backdround/global-note.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "global-note"),
    opts = {
      filename = "global.md",
      directory = vim.fn.stdpath("data") .. "/global-note/",
      -- Floating window title.
      -- string or fun(): string
      title = "Todo: " .. os.date("%Y/%m/%d"),

      -- Ex command name.
      -- string
      command_name = "GlobalNote",

      -- A nvim_open_win config to show float window.
      -- table or fun(): table
      window_config = function()
        local window_height = vim.api.nvim_list_uis()[1].height
        local window_width = vim.api.nvim_list_uis()[1].width
        return {
          relative = "editor",
          border = "single",
          title = "Note",
          title_pos = "center",
          width = math.floor(0.7 * window_width),
          height = math.floor(0.85 * window_height),
          row = math.floor(0.05 * window_height),
          col = math.floor(0.15 * window_width),
        }
      end,
      -- Additional presets to create other global, project local, file local
      -- and other notes.
      -- { [name]: table } - tables there have the same fields as the current table.
      additional_presets = {},
    },
    config = function(_, opts)
      require("global-note").setup(utils.create_spec("global-note", opts))
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    enabled = utils.enabled("plugins", "nvim-highlight-colors"),
    event = "BufReadPre",
    opts = {
      render = "virtual",
      enabled_named_colors = true,
      enabled_tailwind = true,
    },
    config = function(_, opts)
      require("nvim-highlight-colors").setup(utils.create_spec("nvim-highlight-colors", opts))
    end,
  },
  {
    "tpope/vim-sleuth",
    enabled = utils.enabled("plugins", "vim-sleuth"),
  },
  {
    "folke/todo-comments.nvim",
    enabled = utils.enabled("plugins", "todo-comments"),
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>fc", "<CMD>TodoTelescope<CR>", desc = "Find Todo's" },
    },
    opts = {},
    config = function(_, opts)
      require("todo-comments").setup(utils.create_spec("todo-comments", opts))
    end,
  },
}
