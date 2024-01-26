local M = {}
local ccc = require 'ccc'
local mapping = ccc.mapping
vim.opt.termguicolors = true

---@class ccc.config
local opts = {
    highlighter = {
        auto_enable = true,
        lsp = true,
        excludes = { "xml", "txt"},
        max_byte = 512 * 1024,
        update_insert = true,
    }
}

M.setup = function()
    ccc.setup(opts)
end

return M
