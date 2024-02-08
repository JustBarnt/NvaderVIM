return {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    config = function()
        require 'user.plugins.lualine'
    end,
}
