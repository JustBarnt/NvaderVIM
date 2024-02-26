local map = require("core.utils").map
local builtin = require "telescope.builtin"
local telescope = require 'telescope'
local exists, user_config = pcall(require, 'user.config')
local config = exists and type(user_config) == 'table' and user_config.telescope or {}

telescope.setup(config)
telescope.load_extension('ui-select')

--Keys
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
map("n", "<leader>/", builtin.buffers, { desc = "Search Buffers" })
