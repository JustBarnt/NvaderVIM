return {
    "folke/noice.nvim",
    event = 'VeryLazy',
    dependencies = {
        {"MunifTanjim/nui.nvim"},
        {
            "rcarriga/nvim-notify",
            config = function()
                require 'core.plugins.notify'
            end,
        }
    },
    config = function()
        require 'core.plugins.noice'
    end,
}
