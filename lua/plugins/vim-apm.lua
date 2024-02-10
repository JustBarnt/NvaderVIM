return {
    "theprimeagen/vim-apm",
    config = function()
        local map = require("core.utils").map
        local config = require("user.plugins.vim-apm").config
        local apm = require 'vim-apm'
        apm:setup(config)

        -- Keys
        map("n", "<leader>apm", function()
            apm:toggle_monitor()
        end, { desc = "Vim Actions Per Minute" })
    end,
}
