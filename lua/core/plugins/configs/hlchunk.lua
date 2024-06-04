local has_chunk, hlchunk = pcall(require, "hlchunk")

if not has_chunk then
  error("Failed to load hl_chunk")
  return
end

---@module "hlchunk"
hlchunk.setup({
  chunk = {
    enable = true,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
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
})
