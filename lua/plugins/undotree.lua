return {
    "mbbill/undotree",
    config = function()
        local map = require 'core.utils'.map
        map('n', '<leader>u', vim.cmd.UndotreeToggle, {desc = "Undo Tree"})
    end,
}
