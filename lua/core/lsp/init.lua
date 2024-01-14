local installed = require 'core.utils'.installed

local modules = {
    lspzero = installed('lsp-zero'),
    neoconf = installed('neoconf'),
    neodev = installed('neodev'),
    mason = installed('mason'),
    mason_lspconfig = installed('mason-lspconfig')
}

for module, found in ipairs(modules) do
    print("Setting up LSP configuration...")
    if not found then
        print("Unable to find " .. modules[module] .. " cannot continue [LSP] setup")
        return
    end
end

local lsp = require 'lsp-zero'
local mason = require 'mason'
local lspconfig = require 'lspconfig'
local mason_lspconfig = require 'mason-lspconfig'
local neoconf = require 'neoconf'
local neodev = require 'neodev'
local settings = require 'core.lsp.lsp-settings'

local exist, config = pcall(require, 'user.config')
local lsps = exist and type(config) == 'table' and config.ensure_installed.mason_lspconfig or {}
local servers = exist and type(config) == 'table' and config.servers or {}

neoconf.setup({
    import = {
        vscode = false,
        coc = false,
        nlsp = false,
    }
})

neodev.setup({
    library = {
        enabled = true,
        runtime = vim.env.VIMRUNTIME,
        plugins = vim.fn.stdpath("data") .. "\\lazy\\"
    },
    lspconfig = true,
    pathStrict = true,
})

lsp.on_attach(function(client, bufnr)
    settings.on_attach(client, bufnr)
end)

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = lsps,
})

local setup_servers = function(server, server_config)
    if not server_config then
        print("[ERROR]: Config missing for: " .. server)
        return
    end

    if type(server_config) ~= "table" then
        server_config = {}
    end

    lspconfig[server].setup(server_config)
end

for server, server_config in pairs(servers) do
    setup_servers(server, server_config)
end

