local presets = require "which-key.plugins.presets"
local wk = require "which-key"

wk.setup({ })

wk.register({
    ["<leader>"] = {
        name = "Map Leader",
        c = {
            name = "Code",
        },
        d = {
            name = "Directory",
        },
        f = {
            name = "Find",
        },
        h = {
            name = "Harpoon",
        },
        l = {
            name = "Lsp",
        },
        m = {
            name = "Miscellaneous",
        },
        t = {
            name = "Template",
        },
        x = {
            name = "Trouble"
        }
    },
    ["<leader>a"] = { "Actions Per Minute" },
    ["<leader>_"] = { "which_key_ignore" },
    ["<leader>s"] = { "Clear Search Highlights" },
    ["["] = { "Previous Text-Object" },
    ["]"] = { "Next Text-Object" },
    ["<c-w>"] = { "Window" },
    ["g"] = { "Go-To" },
    ["z"] = { "Folds / Center Cursor" },
})
