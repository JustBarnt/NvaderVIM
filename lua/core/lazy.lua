-- Setup Lazy
-- Creating our lazy install dir, then creating the git clone call
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Appending lazy to our runtime, for lazy magic
vim.opt.rtp:prepend(lazypath)

-- Setting up lazy specs
require("lazy").setup('plugins', {
  --[[dev = {
    path = "~/projects/nvim",
    patterns = { "nvim" },
    fallback = true,
  },]]
  ui = {
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    }
  },
  performance = {
    rtp = {
      disable_plugins = {
        "matchit",
        "matchparan",
        "netrwPlugin",
        "zipPlugin",
      },
    },
  },
})

require 'core.options'
require 'profile'
