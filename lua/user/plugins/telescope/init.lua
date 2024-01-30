if not pcall(require, "telescope") then
    return
end

local map = require("core.utils").map
local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local theme = require "telescope.themes"
local trouble = require "trouble.providers.telescope"
local fused_layout = require('core.telescope.fused_layout').fused_layout

local M = {}

M.setup = {
    telescope = {
        keys = function()
            map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
            map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
            map("n", "<leader>/", builtin.buffers, { desc = "Search Buffers" })
        end,
        setup = function()
            telescope.setup({
                defaults = {
                    -- pickers = fused_layout,
                    mappings = {
                        i = { ["<c-t>"] = trouble.open_with_trouble },
                        n = { ["<c-t>"] = trouble.open_with_trouble },
                    },
                },
                pickers = {
                    --[[ layout_strategy = fused_layout.layout_strategy,
                    layout_config = fused_layout.layout_config,
                    create_layout = fused_layout.create_layout, ]]
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                                ["<c-q>"] = actions.close,
                            },
                        },
                    },
                    find_files = {
                        find_command = vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
                    },
                },
            })
        end,
    },
}

return M
