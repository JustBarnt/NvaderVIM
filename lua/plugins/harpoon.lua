return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = function()
        require 'core.plugins.harpoon'.keys()
    end,
    config = function()
        require 'core.plugins.harpoon'
    end,
}

