return {
    "ariel-frischer/bmessages.nvim",
    event = "CmdlineEnter",
    opts = function()
        local map = require("core.utils").map
        map("n", "<leader>sm", "<CMD>ShowMessageFloat<CR>", { desc = "Show Scratch Message Buffer" })
    end,
}
