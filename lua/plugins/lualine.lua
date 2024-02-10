return {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    config = function()
        local config = require("user.plugins.lualine").config
        require("lualine").setup(config)
    end,
}
