-- Bootstrap Lazy
-- Creating our lazy install dir, then creating the git clone call
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
---@class LazySpec
-- TODO: For integrating VSCODE support to load only plugins it needs
--       https://github.com/isaksamsten/nvim-config/blob/e6eac29e17df6a2314f109d74952331cb52b2a00/lua/config/lazy.lua#L13
local plugins_spec = { { import = "core.plugins" }, { import = "plugins" } }

---@class LazyConfig
local opts = {
  dev = {
    path = "~/nvim-plugins/",
    fallback = true,
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  pkg = {
    enabled = true,
    sources = {
      "lazy",
      "rockspec",
    },
  },
  performance = {
    rtp = {
      disable_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

-- Setting up lazy specs
lazy.setup(plugins_spec, opts)

vim.notify = require("notify")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("core.user.options")
    require("core.user.keymaps")
    require("core.user.autocmds")
    require("core.user.user-commands")
  end,
})

-- From https://github.com/willothy/nvim-config/blob/b0a59463c6e6cb29ecb0d68dd102807bef3db0fb/init.lua#L11
-- Loading shada is SLOW, so we're going to load it manually,
-- after UI-enter so it doesn't block startup.
local shada = vim.o.shada
vim.o.shada = ""
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.o.shada = shada
    pcall(vim.cmd.rshada, { bang = true })
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  float = {
    border = "rounded",
    format = function(d)
      return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code)
    end,
  },
  underline = true,
  jump = {
    float = true,
  },
})
