local neorg = require "neorg"
local neorg_callbacks = require "neorg.core.callbacks"

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.itero"] = {},
        -- ["core.ui.calendar"] = {},
        ["core.concealer"] = {
            config = {
                icon_preset = "varied",
                icons = {
                    code_block = {
                        conceal = true,
                        content_only = true,
                        highlight = "CursorLine",
                    },
                },
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    work = "~/CommSys/Work",
                    personal = "~/bwilliams/personal",
                },
            },
        },
        ["core.esupports.metagen"] = {
            config = {
                type = "auto",
            },
        },
    },
})
