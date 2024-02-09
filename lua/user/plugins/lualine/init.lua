local lualine = require "lualine"
local components = require "user.plugins.lualine.lualine_components"
local main = require("user.theme-colors").main
local moon = require("user.theme-colors").moon
local dawn = require("user.theme-colors").dawn

lualine.setup({
    options = {
        --- @usage 'rose-pine' | 'rose-pine-alt'
        theme = "rose-pine",
        globalstatus = true,
        -- section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {
            {
                "buffers",
                hide_filename_extension = true,
                filetype_names = {
                    TelescopePrompt = "Telescope 󰭎",
                },
                use_mode_colors = true,
                symbols = {
                    modified = " ●", -- Text to show when the buffer is modified
                    alternate_file = "#", -- Text to show to identify the alternate file
                    directory = "", -- Text to show when the buffer is a directory
                },
            },
        },
        lualine_b = {
            {
                "branch",
                icon = "",
                color = { fg = moon.base, bg = moon.love },
                separator = { right = "" },
            },
            {
                "diff",
                color = { fg = moon.base, bg = moon.highlight_high },
                separator = { right = "" },
            },
            {
                "diagnostics",
                sources = { "nvim_lsp", "nvim_diagnostic" },
                sections = { "error", "warn", "info" },
                color = { fg = moon.base, bg = moon.highlight_med },
                separator = { right = "" },
                always_visible = true,
            },
            {
                components.harpoon_component,
                color = { fg = moon.text, bg = moon.highlight_low },
                separator = { right = "" },
            },
        },
        lualine_c = {
            {
                "searchcount",
                color = { fg = moon.text, bg = moon.iris },
                separator = { right = "" },
            },
        },
        lualine_x = {
            {
                "datetime",
                icon = "",
                style = "%H:%M",
                color = { fg = moon.text, bg = moon.highlight_med },
                separator = { left = "" },
            },
        },
        lualine_y = {
            {
                "filetype",
                colored = false,
                color = { fg = moon.text, bg = moon.highlight_high },
                separator = { left = "" },
            },
        },
        lualine_z = {
            {
                "location",
                icon = "",
                color = { fg = moon.base, bg = moon.love },
                separator = { left = "" },
            },
            {
                "mode",
                icon = "",
                separator = { left = "" },
            },
        },
    },
})
