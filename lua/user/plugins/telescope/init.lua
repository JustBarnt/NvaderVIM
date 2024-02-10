local actions = require "telescope.actions"
local trouble = require "trouble.providers.telescope"

local M = {}

M.config = {
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
    },
    pickers = {
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
}

return M
