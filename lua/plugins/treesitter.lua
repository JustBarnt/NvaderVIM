return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            { "nvim-treesitter/nvim-treesitter-textobjects" },
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },
}
