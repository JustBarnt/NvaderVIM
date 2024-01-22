local wk = require 'which-key'
local exist, user_config = pcall(require, 'user.config')
local setup = exist and type(user_config) == 'table' and user_config.which_key or {}
wk.setup(setup)

-- Registers

