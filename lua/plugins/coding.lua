local utils = require "core.utils"

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    enabled = utils.enabled("plugins", "nvim-autopairs"),
    opts = {
      disable_filetype = { "TelescopePrompt", "spectre_panel", "neo-tree" },
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(utils.create_spec("nvim-autopairs", opts))
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    enabled = utils.enabled("plugins", "Comment"),
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Toggle Comment Line Wise" },
      { "gb", mode = { "n", "v" }, desc = "Toggle Comment Block Wise" },
    },
    opts = function()
      local commentstring_avail, comment_string = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and comment_string and { pre_hook = comment_string.create_pre_hook() } or {}
    end,
    config = function(_, opts)
      require("Comment").setup(utils.create_spec("Comment", opts))
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    enabled = utils.enabled("plugins", "inc-rename"),
    command = "IncRename",
    opts = {
      -- hl_group = "Substitute",
      -- input_buffer_type = "dressing",
    },
    config = function(_, opts)
      require("inc_rename").setup(utils.create_spec("inc-rename", opts))
    end,
  },
  {
    "danymat/neogen",
    enabled = utils.enabled("plugins", "neogen"),
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Neogen",
    keys = function()
      local neogen = require "neogen"
      return {
        {
          "<leader>td",
          function()
            neogen.generate { snippet_engine = "luasnip" }
          end,
          desc = "Generate Docs from Snippet",
        },
      }
    end,
    opts = {
      snippet_engine = "luasnip",
    },
    config = function(_, opts)
      require("neogen").setup(utils.create_spec("neogen", opts))
    end,
  },
  {
    "myzel394/jsonfly.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "jsonfly"),
    keys = {
      { "<leader>sj", "<CMD>Telescope jsonfly<CR>", desc = "Open JSONFly", ft = { "json" } },
    },
  },
  {
    "justbarnt/nvim-cheatsh",
    enabled = utils.enabled("plugins", "nvim-cheatsh"),
    cmd = { "Cheat", "CheatClose", "CheatList" },
    opts = {
      cheatsh_url = "cht.sh/",
    },
    keys = {
      { "<leader>cs", "<CMD>CheatList<CR>", desc = "Search Cheat Sheets" },
    },
    config = function(_, opts)
      require("nvim-cheatsh").setup(utils.create_spec("nvim-cheatsh", opts))
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    enabled = utils.enabled("plugins", "nvim-surround"),
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      require("nvim-surround").setup(utils.create_spec("nvim-surround", opts))
    end,
  },
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "treesj"),
    opts = {},
    config = function(_, opts)
      require("treesj").setup(utils.create_spec("treesj", opts))
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    enabled = utils.enabled("plugins", "ts-error-translator"),
    ft = { "ts", "svelte" },
    event = "BufReadPre",
    opts = {},
  },
}
