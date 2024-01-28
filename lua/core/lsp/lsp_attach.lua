local map = require("core.utils").map
local M = {}

local on_attach = function(_, bufnr)
    map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
    map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbols", buffer = bufnr })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions", buffer = bufnr })
    map("n", "gD", vim.lsp.buf.declaration, { desc = "Go-To Declaration", buffer = bufnr })
    map("n", "gT", vim.lsp.buf.type_definition, { desc = "Go-To Defintion", buffer = bufnr })
    map("n", "K", vim.lsp.buf.hover, { desc = "Peek Definition", buffer = bufnr })
    map("n", "<leader>gI", vim.lsp.buf.implementation)
    map("n", "<leader>rr", "LspRestart")
    map("n", "<leader>lf", "<CMD>LspFormat<CR>", { desc = "LSP Format", buffer = bufnr })
    map("n", "<leader>lr", "<CMD>LspRestart<CR>", { desc = "LSP Restart", buffer = bufnr })
    map("n", "<leader>li", "<CMD>LspInfo<CR>", { desc = "LSP Info", buffer = bufnr })
    map("n", "<leader>ls", "<CMD>LspStart<CR>", { desc = "LSP Start", buffer = bufnr })
    map("n", "<leader>lk", "<CMD>LspStop<CR>", { desc = "LSP Stop", buffer = bufnr })
    map("n", "gd", function()
        vim.lsp.buf.definition({
            reuse_window = true,
            on_list = function(options)
                vim.fn.setqflist({}, " ", options)
                vim.api.nvim_command "cfirst"
            end,
        })
    end, { desc = "Go-To ,buffer = bufnrDefinition", buffer = bufnr })

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
end

local rounded_border_handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.on_attach = on_attach
M.rounded_border_handlers = rounded_border_handlers
M.capabilities = capabilities

return M
