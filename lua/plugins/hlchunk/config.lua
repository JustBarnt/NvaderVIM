local M = {}
local utils = require "core.utils"
local colors = {
  chunk = utils.get_rbg_from_hl(vim.api.nvim_get_hl(0, { name = "@keyword" }).fg),
  line_num = utils.get_rbg_from_hl(vim.api.nvim_get_hl(0, { name = "Constant" }).fg),
}

M.config = {
  blank = { enable = false },
  chunk = { chars = { right_arrow = "─" }, style = colors.chunk },
  indent = { enable = false },
  line_num = { style = colors.line_num },
}
return M
