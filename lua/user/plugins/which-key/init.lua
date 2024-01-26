local M = {}
local wk = require 'which-key'
local exist, user_config = pcall(require, 'user.config')
local setup = exist and type(user_config) == 'table' and user_config.which_key or {}

-- Registers
M.which_key = {
    setup = function()
        wk.setup(setup)
    end,
    register = wk.register,
}
return M
