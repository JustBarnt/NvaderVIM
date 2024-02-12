local M = {}
local text = ""

-- Override LSP diagnostics support if its supported.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = { severity_limit = "Warning" },
        underline = { severity_limit = "Warning" },
        virtual_text = false,
    }
)

vim.lsp.handlers["window/showMessage"] = require "core.lsp.message"

local on_list = function(options)
    vim.fn.setqflist({}, " ", options)
    vim.api.nvim_command "cfirst"
end

M.on_list = on_list
return M
