if not pcall(require, "telescope") then
    return
end

local map = require("core.utils").map
local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local theme = require "telescope.themes"
local fb_actions = require "telescope._extensions.file_browser.actions"
local fb = require("telescope").extensions.file_browser

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
                defaults = require("core.telescope.fused_layout").fused_layout,
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                                ["<C-q>"] = actions.close,
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
    file_browser = {
        keys = function()
            map("n", "<leader>fb", function()
                fb.file_browser({ path = "%:p:h", select_buffer = true })
            end, { desc = "File Browser" })
        end,
        setup = function()
            telescope.setup({
                extensions = {
                    file_browser = {
                        grouped = true,
                        hide_parent_dir = true,
                        hijack_netrw = true,
                        initial_mode = "normal",
                        mappings = {
                            ["i"] = {
                                ["<C-c>"] = fb_actions.create,
                                ["<S-CR>"] = fb_actions.create_from_prompt,
                                ["<C-r>"] = fb_actions.rename,
                                ["<C-m>"] = fb_actions.move,
                                ["<C-y>"] = fb_actions.copy,
                                ["<C-d>"] = fb_actions.remove,
                                ["<CR>"] = actions.select_default,
                                ["<C-g>"] = fb_actions.goto_parent_dir,
                                ["<C-e>"] = fb_actions.goto_home_dir,
                                ["<C-w>"] = fb_actions.goto_cwd,
                                ["<C-t>"] = fb_actions.change_cwd,
                                ["<C-f>"] = fb_actions.toggle_browser,
                                ["<C-h>"] = fb_actions.toggle_hidden,
                                ["<C-s>"] = fb_actions.toggle_all,
                                ["<bs>"] = fb_actions.backspace,
                            },
                            ["n"] = {
                                ["c"] = fb_actions.create,
                                ["r"] = fb_actions.rename,
                                ["m"] = fb_actions.move,
                                ["y"] = fb_actions.copy,
                                ["d"] = fb_actions.remove,
                                ["o"] = actions.select_default,
                                ["g"] = fb_actions.goto_parent_dir,
                                ["e"] = fb_actions.goto_home_dir,
                                ["w"] = fb_actions.goto_cwd,
                                ["t"] = fb_actions.change_cwd,
                                ["f"] = fb_actions.toggle_browser,
                                ["h"] = fb_actions.toggle_hidden,
                                ["s"] = fb_actions.toggle_all,
                                ["<bs>"] = fb_actions.backspace,
                            },
                        },
                    },
                },
            })
            telescope.load_extension "file_browser"
        end,
    }
}

return M
