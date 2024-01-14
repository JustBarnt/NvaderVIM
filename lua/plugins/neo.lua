return {
    {
        "folke/neodev.nvim",
        priority = 10000, -- Has to load before lsp is setup
        lazy = false,
    },
    {
        "folke/neoconf.nvim",
        priority = 10000, -- Has to load before lsp is setup
        lazy = false,
    }
}
