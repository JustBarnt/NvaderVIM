return {
    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.2",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            { "nvim-treesitter/nvim-treesitter-textobjects", commit = "dd0b203" },
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },
}
