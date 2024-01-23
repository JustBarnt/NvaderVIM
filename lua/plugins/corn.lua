return {
    {
        "RaafatTurki/corn.nvim",
        keys = function()
            require("core.plugins.corn").keys()
        end,
        config = function()
            require("core.plugins.corn").setup()
        end,
    },
}
