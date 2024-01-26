local gitsigns = require 'gitsigns'
local M = {}


M.setup = function()
    gitsigns.setup({
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        current_line_blame = true,
    })
end

return M
