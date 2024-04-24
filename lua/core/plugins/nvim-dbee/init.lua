return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install "go"
  end,
  keys = {
    { "<leader>db", "<CMD>Dbee toggle<CR>", desc = "Toggle DB UI"}
  },
  config = function()
    local dbee = require 'dbee'
    local sources = require 'dbee.sources'
    dbee.setup({
      sources = {
        sources.FileSource:new(vim.fn.stdpath('state') .. '/dbee/persistence.json')
      },
      editor = {
        mappings = {
          { key = "<leader>E", mode = "v", action = "run_selection"},
          { key = "<leader>E", mode = "n", action = "run_file"},
        }
      }
    })
  end,
}
