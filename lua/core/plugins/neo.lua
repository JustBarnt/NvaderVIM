return {
  {
    "folke/neodev.nvim",
    priority = 10000, -- Has to load before lsp is setup
    lazy = false,
    --[[config = function()
      local neodev = require 'neodev'
      neodev.setup({
        library = {
          enabled = true,
          runtime = vim.env.VIMRUNTIME,
          plugins = vim.fn.stdpath('data') .. "\\lazy\\"
        },
        lspconfig = true,
        pathStrict = true,

      })
    end]]
  },
  {
    "folke/neoconf.nvim",
    priority = 10000, -- Has to load before lsp is setup
    lazy = false,
    --[[config = function()
      local neoconf = require 'neoconf'
      neoconf.setup({
        import = {
          vscode = false,
          coc = false,
          nlsp = false
        }
      })
    end,]]
  }
}
