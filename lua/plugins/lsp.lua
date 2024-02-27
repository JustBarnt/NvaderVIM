return {
    {
        "neovim/nvim-lspconfig",
        -- event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
            "folke/neoconf.nvim",
            "simrat39/inlay-hints.nvim",
            "b0o/schemastore.nvim",
            "stevearc/conform.nvim",
            {
                "pmizio/typescript-tools.nvim",
            },
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                config = function()
                    local install = require "mason-tool-installer"
                    local exist, config = pcall(require, "user.config")
                    local sources = exist and type(config) == "table" and config.ensure_installed.conform or {}
                    install.setup({
                        auto_update = true,
                        debounce_hours = 24,
                        ensure_installed = sources,
                    })
                end,
            },
        },
    },
}
