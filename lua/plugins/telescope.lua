return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local map = require('core.utils').map
            local builtin = require('telescope.builtin')
            local config = require("user.plugins.telescope").config

            require('telescope').setup(config)

            --Keys
            map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
            map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
            map("n", "<leader>/", builtin.buffers, { desc = "Search Buffers" })
        end,
    },
}
