local map = require 'core.utils'.map
local harpoon = require 'harpoon'
local conf = require 'telescope.config'.values

-- TODO: Handle user configuration
local exist, user_config = pcall(require, 'user.config')
local harpoon_config = exist and type(user_config) == 'table' and user_config.harpoon or {}

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require('telescope.pickers').new({}, {
        prompt_title = "⇁ Harpoon ↽",
        finder = require('telescope.finders').new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({})
    }):find()
end

harpoon:setup({harpoon_config})

local M = {}

M.keys = function()
    map('n', "<leader>ha", function() harpoon:list():append() end, { desc = "Harpoon Add" })
    map('n', "<leader>hl", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon List" })
end

return M
