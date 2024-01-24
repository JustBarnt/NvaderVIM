local M = {}

M.rounded_border_handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textdocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { bordeer = "rounded" }),
}

return M
