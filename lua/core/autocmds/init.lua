local utils = require "core.utils"

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    require "core.options"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    vim.cmd[[setlocal shiftwidth=2]]
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function(event)
    vim.b.minialign_disable = true
    vim.b.minicursorword_disable = true
    vim.b.miniindentscope_disable = true
    vim.b.minimisc_disable = true
    vim.b.minimove_disable = true
    vim.b.minioperators_disable = true
    vim.b.minipairs_disable = true
    vim.b.minisplitjoin_disable = true
    vim.b.minisurround_disable = true
  end,
})
