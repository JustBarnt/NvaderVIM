return {
    {
        "RaafatTurki/corn.nvim",
        config = function()
            local map = require("core.utils").map
            require('corn').setup({})

            -- Keys
            map("n", "<leader>ct", "<CMD>CornToggle<CR>", { desc = "Toggle Corner Diagnostics" })
            map("n", "<leader>cs", "<CMD>CornScopeCycle<CR>", { desc = "Cycle Scope Types" })
        end,
    },
}
