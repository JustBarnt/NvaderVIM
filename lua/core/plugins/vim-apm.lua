local apm = require 'vim-apm'
local map = require 'core.utils'.map

apm:setup({})

local M = {}

M.keys = function()
    map('n', '<leader>apm', function() apm:toggle_monitor() end, { desc = "Vim Actions Per Minute"})
end

return M

