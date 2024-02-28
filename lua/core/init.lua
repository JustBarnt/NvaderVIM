-- Load Base Keymaps
require("core.keymaps").Default()

-- Bootstrapping Lazy
require 'core.lazy'

-- Bootstrap Config
require 'core.options'
require 'core.whichkey'
require 'core.completion'
-- require 'core.lsp'
require 'core.treesitter'
require 'core.telescope'
require 'core.neorg'
require "core.colorscheme"
require "core.autocmds"
require "core.user-commands"
