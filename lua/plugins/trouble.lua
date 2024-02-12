return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local map = require 'core.utils'.map
        local trouble = require 'trouble'
        local config = require 'user.plugins.trouble'.config

        trouble.setup(config)
    end,
}
