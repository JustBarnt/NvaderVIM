local M = {}
local apm = require 'vim-apm'
local map = require 'core.utils'.map

M.setup = function()
    apm:setup({
        reporter = {
            type = "memory"
        }
    })
    map('n', '<leader>apm', function() apm:toggle_monitor() end, { desc = "Vim Actions Per Minute"})
end

return M
