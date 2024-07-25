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
      end,
    },
    select = {
      get_config = function(opts)
        local themes = require("telescope.themes")
        local sorters = require("telescope.sorters")
        if opts.kind == "legendary.nvim" then
          return {
            telescope = themes.get_dropdown({
              sorter = sorters.fuzzy_with_index_bias({}),
            }),
          }
        else
          return {
            telescope = themes.get_dropdown({}),
          }
        end
      end,
    },
  },
}
