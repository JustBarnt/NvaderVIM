return {
    "theprimeagen/vim-apm",
    config = function()
        require 'core.plugins.vim-apm'
    end,
    keys = function()
        require 'core.plugins.vim-apm'.keys()
    end,
}
