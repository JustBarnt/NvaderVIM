require 'core.keymaps'.Default_Keymaps()
require 'core.colorscheme'
require 'core.autocmds'

local exist, user_options = pcall(require, 'user.options')
local opts = exist and type(user_options) == 'table' and user_options.opts or {}

if opts then
  require 'core.utils'.vim_options(user_options)
end

-- Anything else to setup in here? Look for more `user.*` files? Like plugins, colorschemes, keymaps?
-- Keymaps would override if it finds conflicting keymap?
-- colorscheme would override if found key `set`
-- plugins 
-- Able to disable preinstalled as well as install new plugins
