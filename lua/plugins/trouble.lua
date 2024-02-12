return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local map = require("core.utils").map
        local trouble = require "trouble"
        local config = require("user.plugins.trouble").config

        trouble.setup(config)

        --Keymaps
        map("n", "<leader>xx", function()
            require("trouble").toggle()
        end, { desc = "Trouble Toggle" })
        map("n", "<leader>xw", function()
            require("trouble").toggle("workspace_diagnostics")
        end, { desc = "Trouble Workspace Diagnostics" })
        map("n", "<leader>xd", function()
            require("trouble").toggle("document_diagnostics")
        end, { desc = "Trouble Document Diagnostics" })
        map("n", "<leader>xq", function()
            require("trouble").toggle("quickfix")
        end, { desc = "Trouble Quick Fix" })
        map("n", "<leader>xl", function()
            require("trouble").toggle("loclist")
        end, { desc = "Trouble Local List" })
        map("n", "gR", function()
            require("trouble").toggle("lsp_references")
        end, { desc = "LSP References" })
    end,
}
