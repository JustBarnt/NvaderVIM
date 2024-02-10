return {
   {
        "stevearc/oil.nvim",
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VimEnter",
        keys = function()
            local map = require("core.utils").map
            local oil = require("oil")
            map("n", "<leader>fe", oil.toggle_float, { desc = "Open Directory in Float"})
            map("n", "<leader>pv", oil.open, {desc = "Open Directory"})
        end,
        config = function()
            local config = require("user.plugins.oil").config
            require("oil").setup(config)
        end,
    },
}
