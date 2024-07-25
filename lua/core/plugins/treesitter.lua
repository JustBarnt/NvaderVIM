return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  dependencies = {
    "nushell/tree-sitter-nu",
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup({
          opts = {
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
          },
        })
      end,
    },
  },
  opts = {
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
  },
}
