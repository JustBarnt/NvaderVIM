local rose_pine = require 'rose-pine'


rose_pine.setup({
  variant = "main",
  dark_variant = "main",
  bold_vert_split = true,
  disable_background = true,
  highlight_groups = {
    ColorColumn = { bg = "pine", blend = 15 },
    StatusLine = { fg = "iris", bg = "pine", blend = 10 },
    Search = { fg = "iris", bg = "subtle", blend = 40 },
    FloatBorder = { bg = "#1A1C33", blend = 50 },
    IncSearch = { fg = "iris", bg = "rose", blend = 40 },
  },
})

vim.cmd.colorscheme("rose-pine")
