local M = {}
local map = require 'core.utils'.map
local todo = require "todo-comments"

M.keys = function()
    map("n", "]t", function()
        todo.jump_next()
    end, { desc = "Next Todo"} )

    map("n", "[t", function()
        todo.jump_prev()
    end, { desc = "Previous Todo"} )
end

M.setup = function()
    todo.setup({})
end

return M
