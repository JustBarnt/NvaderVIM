return {
  "RRethy/vim-illuminate",
  event = "BufReadPre",
  config = function()
    require("illuminate").configure({
      providers = {
        "regex",
        "treesitter",
        "lsp",
      },
    })
  end,
}
