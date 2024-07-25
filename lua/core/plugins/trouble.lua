return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>xx", "<CMD>Trouble<CR>", desc = "Trouble Toggle" },
    { "<leader>xd", "<CMD>Trouble diagnostics<CR>", desc = "Trouble Document Diagnostics" },
    { "<leader>xq", "<CMD>Trouble quickfix<CR>", desc = "Trouble Quick Fix" },
    { "<leader>xl", "<CMD>Trouble loclist<CR>", desc = "Trouble Local List" },
    {
      "<leader>o",
      "<CMD>Trouble symbols toggle pinned=false results.win.relative=true results.win.position=right<CR>",
      desc = "Document Sybmols (Trouble)",
    },
  },
  opts = {},
}
