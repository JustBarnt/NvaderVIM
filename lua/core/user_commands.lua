local exist, config = pcall(require, 'user.config')
local commands = exist and type(config) == 'table' and config.user_commands or {}
local enabled = require 'core.utils'.enabled

if enabled(commands, 'format') then
    vim.api.nvim_create_user_command("LspFormat", function()
        require('conform').format({ async = true, lsp_fallback = false })
    end, { bang = true })
end

if enabled(commands, 'open_help_in_float') then
    vim.api.nvim_create_user_command("H", function (args)
        local file = args.args
        vim.cmd.h(file)
        local help_win = vim.api.nvim_get_current_win()

        local ok = require('detour').Detour()

        if ok then
            vim.api.nvim_win_close(help_win, false)
        end
    end, { nargs = 1})
end
