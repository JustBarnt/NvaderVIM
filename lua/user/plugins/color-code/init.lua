local M = {}
vim.opt.termguicolors = true

---@class ccc.config
M.config = {
    highlighter = {
        auto_enable = true,
        lsp = true,
        excludes = { "xml", "txt"},
        max_byte = 512 * 1024,
        update_insert = true,
    }
}

return M
