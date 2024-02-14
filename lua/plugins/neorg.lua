return {
    "nvim-neorg/neorg",
    lazy = true,
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
}
