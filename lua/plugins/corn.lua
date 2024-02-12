return {
    {
        "RaafatTurki/corn.nvim",
        enabled = false,
        config = function()
            local map = require("core.utils").map
            local config = require("user.plugins.corn").config
            require("corn").setup(config)
            

            -- Keys
            map("n", "<leader>cd", "<CMD>Corn toggle<CR>", { desc = "Toggle Corner Diagnostics" })
            map("n", "<leader>cs", "<CMD>Corn scope_cycle<CR>", { desc = "Cycle Scope Types" })
        end,
    },
}
