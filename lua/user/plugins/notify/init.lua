local M = {}
local notify = require 'notify'

M.setup = function()
    notify.setup({
        background_colour = "#000000",
        fps = 20,
        stages = 'static',
        render = 'compact',
        max_height = function()
            return math.floor(vim.o.lines * 0.5)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.45)
        end,
    })
end

return M
