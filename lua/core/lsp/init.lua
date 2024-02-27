require "core.lsp.handlers"
local exist, config = pcall(require, "user.config")
local lsps = exist and type(config) == "table" and config.ensure_installed.mason_lspconfig or {}
local servers = exist and type(config) == "table" and config.servers or {}
local neodev = vim.F.npcall(require, "neodev")
local neoconf = vim.F.npcall(require, "neoconf")

if neodev then
    neodev.setup({
        library = {
            enabled = true,
            runtime = vim.env.VIMRUNTIME,
            plugins = vim.fn.stdpath "data" .. "\\lazy\\",
        },
        lspconfig = true,
        pathStrict = true,
    })
end

if neoconf then
    neoconf.setup({
        import = {
            vscode = false,
            coc = false,
            nlsp = false,
        },
    })
end

local lspconfig = vim.F.npcall(require, "lspconfig")

if not lspconfig then
    return
end

local autocmd = require("core.utils").autocmd
local map = require("core.utils").map
local autocmd_clear = vim.api.nvim_clear_autocmds
local inlays = require 'core.lsp.inlay'

local lsp_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-reference", { clear = true })

local lsp_attach = function(client, bufnr)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })

    map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbols" })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
    map("n", "gD", vim.lsp.buf.declaration, { desc = "Go-To Declaration" })
    map("n", "gT", vim.lsp.buf.type_definition, { desc = "Go-To Defintion" })
    map("n", "K", vim.lsp.buf.hover, { desc = "Peek Definition" })
    map("n", "<leader>lf", "<CMD>LspFormat<CR>", { desc = "LSP Format" })
    map("n", "<leader>lr", "<CMD>LspRestart<CR>", { desc = "LSP Restart" })
    map("n", "<leader>li", "<CMD>LspInfo<CR>", { desc = "LSP Info" })
    map("n", "<leader>ls", "<CMD>LspStart<CR>", { desc = "LSP Start" })
    map("n", "<leader>lk", "<CMD>LspStop<CR>", { desc = "LSP Stop" })

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    if client.server_capabilities.documentHighlightProvider then
        autocmd_clear({ group = augroup_highlight, buffer = bufnr })
        autocmd({ "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, bufnr })
        autocmd({ "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, bufnr })
    end

    if filetype == "cs" then
        map("n", "gd", function()
            require("omnisharp_extended").lsp_definitions()
            require("detour").Detour()
        end, { desc = "Go-To Definiton" })
    else
        map("n", "gd", function()
            vim.lsp.buf.definition({ reuse_win = true, on_list = require("core.lsp.handlers").on_list })
            require("detour").Detour()
        end, { desc = "Go-To Definition" })
    end


end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

-- Completion configuration
vim.tbl_deep_extend("force", updated_capabilities, require("cmp_nvim_lsp").default_capabilities())
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = lsps,
})

local setup_server = function(server, server_config)
    if not server_config then
        return
    end

    if type(server_config) ~= "table" then
        server_config = {}
    end

    server_config = vim.tbl_deep_extend("force", {
        on_init = lsp_init,
        on_attach = lsp_attach,
        capabilities = updated_capabilities,
    }, server_config)

    lspconfig[server].setup(server_config)
end

for server, server_config in pairs(servers) do
    setup_server(server, server_config)
end

require('typescript-tools').setup({
    settings = {
        code_lens = "all",
    }
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettier" },
        javascript = { "prettier" },
    },
})

return {
    on_init = lsp_init,
    on_attach = lsp_attach,
    capabilities = updated_capabilities,
}
