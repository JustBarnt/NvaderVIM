local noice = require 'noice'
local exist, user_config = pcall(require, 'user.config')
local pkg = exist and type(user_config) == 'table' and user_config.noice or {}
-- TODO: Use vim.tbl_deep_extend to merge configs together

noice.setup({
})
