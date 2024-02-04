return {
    "theprimeagen/vim-apm",
    config = function()
        require 'user.plugins.vim-apm'.setup()
    end,
    keys = function()
        require 'user.plugins.vim-apm'.keys()
    end,
}
