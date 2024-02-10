return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require "which-key"
        local exists, user_config = pcall(require, 'user.config')
        local config = exists and type(user_config) == "table" and user_config.which_key or {}

        wk.setup(config)
    end,
}
