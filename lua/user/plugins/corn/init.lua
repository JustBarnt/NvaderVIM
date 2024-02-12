local M = {}

M.config = {
    scope = "file",
    border_style = "solid",
    on_toggle = function()
        vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
    end,
}

return M
