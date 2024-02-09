return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        --NOTE: Move into config files
        local map = require("core.utils").map
        local neogen = require "neogen"

        neogen.setup({
            snippet_engine = "luasnip",
        })

        map("n", "<leader>nf", function()
            neogen.generate({ type = "func" })
        end, { desc = "Generate Function Doc Types"})

        map("n", "<leader>nt", function()
            neogen.generate({ type = "type" })
        end, { desc = "Generate Type Doc Types"})

        map("n", "<leader>nc", function()
            neogen.generate({ type = "class" })
        end, { desc = "Generate Type Doc Types"})
    end,
}
