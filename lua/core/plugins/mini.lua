local mini_notify = require 'mini.notify'
local config = {}

config.notify = {
    lsp_progress = {
        enable = true,
        duration_last = 500
    },
    window = {
        config = {
            relative = "win",
            border = "rounded",
            anchor = "SE",
            row = vim.o.lines - 2,
            col = vim.o.columns - 1
        },
        winblend = 45
    }
}

mini_notify.setup(config.notify)
vim.notify = MiniNotify.make_notify({
    ERROR = { duration = 5000, hl_group = 'DiagnosticError' },
    WARN  = { duration = 2500, hl_group = 'DiagnosticWarn' },
    INFO  = { duration = 2500, hl_group = 'DiagnosticInfo' },
    DEBUG = { duration = 0, hl_group = 'DiagnosticHint' },
    TRACE = { duration = 0, hl_group = 'DiagnosticOk' },
    OFF   = { duration = 0, hl_group = 'MiniNotifyNormal' },
})

vim.notify("Testing")

local M = {}

return M

