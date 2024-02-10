local neorg = require "neorg"
local neorg_callbacks = require "neorg.core.callbacks"

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.itero"] = {},
        -- ["core.ui.calendar"] = {},
        ["core.concealer"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes/personal",
                    work = "~/notes/work",
                    time_sheets = "~/CommSys/Neorg/timesheets",
                },
            },
        },
    },
})
