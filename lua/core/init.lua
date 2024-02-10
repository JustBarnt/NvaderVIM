-- Load Base Keymaps
require("core.keymaps").Default()

-- Bootstrap Lazy
require "core.lazy"

-- Bootstrap Config
require 'core.options'
require 'core.lsp'
require 'core.completion'
require 'core.treesitter'
require 'core.telescope'
require "core.colorscheme"
require "core.autocmds"
require "core.user-commands"
