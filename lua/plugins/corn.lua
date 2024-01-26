return {
    {
        "RaafatTurki/corn.nvim",
        keys = function()
            require("user.plugins.corn").keys()
        end,
        config = function()
            require("user.plugins.corn").setup()
        end,
    },
}
