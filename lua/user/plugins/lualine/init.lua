local lualine = require "lualine"
local components = require "user.plugins.lualine.lualine_components"
local moon = require("user.theme-colors").moon

lualine.setup({
    options = {
        --- @usage 'rose-pine' | 'rose-pine-alt'
        theme = "rose-pine",
        globalstatus = true,
        -- section_separators = { left = '', right = ''},
    },

    sections = {
        lualine_a = {
            "searchcount",
            {
                "mode",
                separator = { right = "" },
            },
            {
                "buffers",
                filetype_names = {
                    TelescopePrompt = "Telescope 󰭎",
                },
            },
        },
        lualine_b = {
            { "branch", icon = "" },
            "diff",
            "diagnostics",
        },
        lualine_c = {
            {
                "filename",
                path = 4,
                color = { fg = moon.surface, bg = moon.iris },
                separator = { right = "" },
            },
        },
        lualine_x = {
            "filetype",
        },
        lualine_z = {
            components.harpoon_component,
            "location",
        },
    },
})
