local utils = require("core.utils")

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
    "kylechui/nvim-surround",
    version = "*",
    enabled = utils.enabled("plugins", "nvim-surround"),
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      require("nvim-surround").setup(utils.create_spec("nvim-surround", opts))
    end,
  },
}
