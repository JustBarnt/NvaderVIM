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

-- Override default completion settings
---@class cmp.ConfigSchema
M.cmp_setup = {
    cmp = {
        experimental = {
            ghost_text = true,
        },
        sources = require("cmp").config.sources({
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "path" },
            { name = "buffer", keyword_length = 5 },
        }),
    },
    cmp_cmdline = {
        type = ":",
        opts = {
            mapping = require("cmp").mapping.preset.cmdline(),
            sources = require("cmp").config.sources({
                { name = "cmdline" },
            }),
        },
    },
}

--Overwrite default installed formatters, lsps, parsers
M.ensure_installed = {
    conform = {
        "stylua",
        "prettier",
    },
    mason_lspconfig = {
        "bashls",
        "clangd",
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
        "tsserver",
        'yamlls'
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
        "php",
        "regex",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
    },
}

M.formatters = {
    lua = { "stylua" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
}

M.harpoon = {
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
}

M.which_key = {
    plugins = {
        marks = false,
        registers = false,
    },
    presets = {
        operators = false,
        motions = false,
        z = false,
        g = false,
    },
    motions = {
        counts = true,
    },
}

M.neoscroll = {
    respect_scrolloff = true,
}

M.neodev = {
    library = {
        enabled = true,
        runtime = vim.env.RUNTIME,
        plugins = vim.fn.stdpath('data') .. '\\lazy\\'
    },
    lspconfig = true,
    pathStrict = true
}

M.neoconf = {
    import = {
        vscode = false,
        coc = false,
        nlsp = false
    }
}

return M
