return {
  "axkirillov/hbac.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>pb",
      "<CMD>Hbac toggle_pin<CR>",
      desc = "Pin/Unpin Buffer",
    },
  },
  opts = {
    autoclose = true,
    threshold = 5,
  },
}
