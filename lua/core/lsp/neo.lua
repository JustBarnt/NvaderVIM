local M ={}
local config = require 'user.config'
local neodev = require 'neodev'
local neoconf = require 'neoconf'

M.instantiate = function()
    neodev.setup(config.neodev)
    neoconf.setup(config.neoconf)
end

return M
