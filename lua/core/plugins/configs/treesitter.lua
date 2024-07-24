local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "c_sharp",
    "go",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "regex",
    "svelte",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
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
      node_decremental = "grm",
    },
  },
})
