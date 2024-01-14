local M = {}

-- NOTE: Config is for enabling and disabling item.
-- TODO: Create object for colorscheme override
-- TODO: Add options override here as well.
-- Delete all options that are currently default as well, it tech debt and uneccessary
M.user_options = {
    opt = {
        -- Editor / Command options
        number = true,
        relativenumber = true,
        scrolloff = 10, -- Amount of lines below curor
        pumblend = 17,
    },
}

M.ensure_installed = {
    conform = {
        "stylua",
        "prettier"
    },
    mason_lspconfig = {
        "bashls",
        "clangd",
        "cmake",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "marksman",
        "powershell_es",
        "svelte",
        "tailwindcss",
        "taplo",
        "tsserver"
    },
    parsers = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "c_sharp",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml"
    }
}

M.servers = {
    bashls = true,
    html = true,
    cmake = true,
    svelte = true,
    cssls = true,
    lua_ls = require("core.lsp.servers.lua_ls"),
    intelephense = require("core.lsp.servers.intelephense"),
    jsonls = require("core.lsp.servers.jsonls"),
    clangd = require("core.lsp.servers.clangd"),
    powershell_es = require('core.lsp.servers.powershell_es'),
    emmet_language_server = require('core.lsp.servers.emmet'),
    tsserver = require("core.lsp.servers.tsserver"),
}

M.formatters = {
    lua = { "stylua" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier"}
}

return M
