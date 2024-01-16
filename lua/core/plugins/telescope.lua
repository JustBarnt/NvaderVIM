if not pcall(require, 'telescope') then
    return
end

local map = require 'core.utils'.map
local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup({
    pickers = {
        buffers ={
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                }
            }
        }
    }
})

local M = {}

M.keymaps = function()
    local builtin = require 'telescope.builtin'

    map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
end

return M
