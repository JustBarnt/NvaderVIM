return {
    {
        "uga-rosa/ccc.nvim",
        event = "BufReadPre",
        config = function()
            local config = require("user.plugins.color-code").config
            require("ccc").setup(config)
        end,
    },
}
