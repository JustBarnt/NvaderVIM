local utils = require "core.utils"

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      override = function(conf)
        conf.col = -1
        conf.row = 0
        return conf
      end
    },
    select = {
      get_config = function(opts)
        local themes = require "telescope.themes"
        local sorters = require "telescope.sorters"
        if opts.kind == "legendary.nvim" then
          return {
            telescope = themes.get_dropdown {
              sorter = sorters.fuzzy_with_index_bias {},
            },
          }
        elseif opts.kind == "codeaction" then
          return {
            telescope = themes.get_cursor { initial_mode = "normal" },
          }
        else
          return {
            telescope = themes.get_dropdown {},
          }
        end
      end,
    },
  },
  config = function(_, opts)
    require("dressing").setup(utils.create_spec("dressing", opts))
  end,
}
