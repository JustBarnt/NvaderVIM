local api = vim.api

api.nvim_create_augroup("lualine_augroup", { clear = true })
api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
