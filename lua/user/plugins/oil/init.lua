local M = {}
local oil = require "oil"
local actions = require "oil.actions"

M.config = {
    default_file_explorer = true,
    columns = {
        "icon",
        "size",
        "permissions",
    },
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ["g?"] = actions.show_help,
        ["<CR>"] = actions.select,
        ["<C-v>"] = actions.select_tab,
        ["<C-p>"] = actions.preview,
        ["<C-c"] = actions.close,
        ["<C-r>"] = actions.refresh,
        ["-"]  = actions.parent,
        ["_"]  = actions.open_cwd,
        ["`"]  = actions.cd,
        ["~"]  = actions.tcd,
        ["s"]  = actions.change_sort,
        ["gx"]  = actions.open_external,
        ["g."]  = actions.toggle_hidden,
        ["g\\"]  = actions.toggle_trash,
    },
    view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
            local hide = false
            local exclude = { ".git", ".gitignore", "node_modules", ".bin", "bin", "obj", ".obj", "build", ".svelte-kit" }
            for i = 1, #exclude do
                if name == exclude[i] then
                    hide = true
                end
            end

            return hide
        end,
    },
}

return M
