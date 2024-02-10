return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local config = require("user.plugins.gitsigns").config
            require("gitsigns").setup(config)
        end,
    },
}
