return {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
}
