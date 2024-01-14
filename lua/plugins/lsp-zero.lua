return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- Snippets
      "L3MON4D3/LuaSnip",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        local install = require 'mason-tool-installer'
        local exist, config = pcall(require, 'user.config')
        local sources = exist and type(config) == 'table' and config.ensure_installed.conform or {}
        install.setup({
            auto_update = true,
            debounce_hours = 24,
            ensure_installed = sources,
        })
    end,
  },
  "simrat39/inlay-hints.nvim",
  "b0o/schemastore.nvim",
  {
    "stevearc/conform.nvim",
    config = function()
        local conform = require 'conform'
        local exist, config = pcall(require, 'user.config')
        local formatters = exist and type(config) == 'table' and config.formatters or {}

        conform.setup({
            formatters_by_ft = formatters,
        })
    end,
  }
}
