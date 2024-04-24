local utils = require "core.utils"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = { "bash", "c", "cmake", "cpp", "c_sharp", "go", "html", "javascript", "json", "jsonc", "lua", "markdown", "markdown_inline", "php", "regex", "svelte", "sql", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml", "svelte", "php", "ctp" },
      },
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm"
        }
      },
    },
    config = function(_, opts)
      local ts = require "nvim-treesitter.configs"
      ts.setup(utils.create_spec("nvim-treesitter", opts))
    end,
  },
}
