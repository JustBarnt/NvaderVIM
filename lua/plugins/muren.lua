return {
    {
        'AckslD/muren.nvim',
        keys = function()
            require 'core.plugins.muren'.keys()
        end,
        config = function()
            require 'core.plugins.muren'
        end,
    }
}
