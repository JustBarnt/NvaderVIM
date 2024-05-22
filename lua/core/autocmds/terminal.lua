local set = vim.opt_local
local api = vim.api
local map = require("core.utils").map

api.nvim_create_autocmd("TermOpen", {
  group = api.nvim_create_augroup("nvadervim-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
  end,
})

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<localleader>st", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end, { desc = "Start Terminal" })
