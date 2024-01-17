local exist, config = pcall(require, 'user.config')
local lsps = exist and type(config) == 'table' and config.ensure_installed.mason_lspconfig or {}
local servers = exist and type(config) == 'table' and config.servers or {}
local neodev = vim.F.npcall(require, 'neodev')
local neoconf = vim.F.npcall(require, 'neoconf')

if neodev then
    neodev.setup({
        library = {
            enabled = true,
            runtime = vim.env.VIMRUNTIME,
            plugins = vim.fn.stdpath("data") .. "\\lazy\\"
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
        }
    })
end

local lspconfig = vim.F.npcall(require, 'lspconfig')

if not lspconfig then
    return
end

local autocmd = require 'core.utils'.autocmd
local autocmd_clear = vim.api.nvim_clear_autocmds

local lsp_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-reference", { clear = true })

local lsp_attach = function(client, bufnr)
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    require 'core.keymaps'.Lsp()

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    if client.server_capabilities.documentHighlightProvider then
        autocmd_clear { group = augroup_highlight, buffer = bufnr }
        autocmd { "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, bufnr }
        autocmd { "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, bufnr }
    end

    if filetype == 'typescript' or filetype == 'lua' then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

-- Completion configuration
vim.tbl_deep_extend("force", updated_capabilities, require("cmp_nvim_lsp").default_capabilities())
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = lsps
})

local setup_server = function(server, server_config)
    if not server_config then
        return
    end

    if type(server_config) ~= 'table' then
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

require("conform").setup{
    formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
    }
}

return {
    on_init = lsp_init,
    on_attach = lsp_attach,
    capabilities = updated_capabilities
}
