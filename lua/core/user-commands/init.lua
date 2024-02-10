local exist, config = pcall(require, 'user.config')
local commands = exist and type(config) == 'table' and config.user_commands or {}
local enabled = require 'core.utils'.enabled

if enabled(commands, 'format') then
    vim.api.nvim_create_user_command("LspFormat", function()
        require('conform').format({ async = true, lsp_fallback = false })
    end, { bang = true })
end

if enabled(commands, 'telescope_highlight_tags') then
    vim.api.nvim_create_user_command("TelescopeHighlights", function()
        require('telescope.builtin').highlights()
    end, {bang = true})
end
