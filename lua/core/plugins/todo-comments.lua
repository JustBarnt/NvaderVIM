local todo = require "todo-comments"
local map = require 'core.utils'.map
local M = {}

local keys = function()
    map("n", "]t", function()
        todo.jump_next()
    end, { desc = "Next Todo"} )

    map("n", "[t", function()
        todo.jump_prev()
    end, { desc = "Previous Todo"} )
end

local setup = function()

    todo.setup({})
end

M.keys = keys
M.setup = setup

return M
