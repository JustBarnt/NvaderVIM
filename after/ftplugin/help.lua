local enabled = require("core.utils").enabled
local exists, user_config = pcall(require, "user.core")
local commands = exists and type(user_config) == "table" and user_config.commands or {}

-- Open help files only in a float
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function(event)
        local filetype = vim.bo[event.buf].filetype


        if event.file:match("doc") ~= nil then
            -- Only run if the filetype is a help file
            if filetype == "help" or filetype == "markdown" then
                -- Get the newly opened help window
                -- and attempt to open a Detour() float
                local help_win = vim.api.nvim_get_current_win()
                local ok = require("detour").Detour()

                -- If we successfully create a float of the help file
                -- Close the split
                if ok then
                    vim.api.nvim_win_close(help_win, false)
                end
            end
        end
    end,
})
