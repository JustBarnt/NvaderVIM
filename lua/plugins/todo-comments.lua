return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local map = require("core.utils").map
        local todo = require 'todo-comments'
        todo.setup({})

        -- Keys
        map("n", "]t", function()
            todo.jump_next()
        end, { desc = "Next Todo" })

        map("n", "[t", function()
            todo.jump_prev()
        end, { desc = "Previous Todo" })
    end,
}
