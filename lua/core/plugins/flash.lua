return {
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
  init = function()
    require("flash").toggle(false)
  end,
}
