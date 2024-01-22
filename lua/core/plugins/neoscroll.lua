local neoscroll = require 'neoscroll'
local exist, user_config = pcall(require, 'user.config')
local setup = exist and type(user_config) == 'table' and user_config.neoscroll or {}

neoscroll.setup(setup)
