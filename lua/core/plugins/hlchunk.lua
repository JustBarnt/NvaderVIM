return {
  "shellRaining/hlchunk.nvim",
  event = { "CursorHold", "CursorHoldI" },
  opts = {
    chunk = {
      enable = true,
      chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "╭",
        left_bottom = "╰",
        right_arrow = "─",
      },
    },
    indent = {
      enable = true,
      chars = {
        "│",
      },
      style = {
        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
      },
    },
    line_num = {
      enable = false,
    },
    blank = {
      enable = false,
    },
  },
}
