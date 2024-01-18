if not pcall(require, 'telescope') then
    return
end

local map = require 'core.utils'.map
local telescope = require 'telescope'
local actions = require 'telescope.actions'





local M = {}

M.telescope = {
    keys = function()
        local builtin = require 'telescope.builtin'

        map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
        map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    end,
    setup = function()
        telescope.setup({
            defaults = require 'core.telescope.fused_layout'.fused_layout,
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                            ["<C-q>"] = actions.close
                        },

                    }
                },
                find_files = {
                    find_command = vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil
                }
            }
        })
    end,
}

M.file_browser = {
    keys = function()
    end,
    setup = function()
    end,
}

return M

