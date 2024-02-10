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

M.autocmds = {
    --TODO: Add keybind that disables and enables this
    disable_auto_comment = false,
    help_in_float = true,
    highlight_yank = true,
    cursor_line = true,
    cursor_line_control = true,
    trailing_whitespace = false,
}


--Overwrite default installed formatters, lsps, parsers
M.ensure_installed = {
    conform = {
        "stylua",
        "prettier"
    },
    mason_lspconfig = {
        "bashls",
        "cssls",
        "clangd",
        "emmet_language_server",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "marksman",
        "omnisharp",
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
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "regex",
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
    svelte = require 'core.lsp.servers.svelte',
    cssls = true,
    omnisharp = require('core.lsp.servers.omnisharp'),
    lua_ls = require("core.lsp.servers.lua_ls"),
    intelephense = require("core.lsp.servers.intelephense"),
    jsonls = require("core.lsp.servers.jsonls"),
    clangd = require("core.lsp.servers.clangd"),
    powershell_es = require('core.lsp.servers.powershell_es'),
    emmet_language_server = require('core.lsp.servers.emmet_language_server'),
    tailwindcss = true, --require 'core.lsp.servers.tailwindcss',
    tsserver = require("core.lsp.servers.tsserver"),
}

M.formatters = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" }
}

M.harpoon = {
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    }
}

M.which_key = {
    plugins = {
        marks = false,
    },
    presets = {
        operators = false,
        motions = false,
        z = false,
        g = false,
    },
    motions = {
        counts = true
    }
}

M.neoscroll = {
    respect_scrolloff = true,
}

return M
