return {
    "uga-rosa/ccc.nvim",
    event = "BufReadPre",
    config = function()
        require 'user.plugins.color-code'.setup()
    end,
}
