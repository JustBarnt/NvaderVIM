return {
    {
        'AckslD/muren.nvim',
        keys = function()
            require 'user.plugins.muren'.keys()
        end,
        config = function()
            require 'user.plugins.muren'.setup()
        end,
    }
}
