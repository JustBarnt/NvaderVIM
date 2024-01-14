return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require 'nvim-treesitter.install'.update({ with_sync = true })()
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            if not pcall(require, 'nvim-treesitter') then
                return
            end

            local opts = require 'core.treesitter'
            local treesitter = require 'nvim-treesitter.configs'
            local exist, config = pcall(require, 'user.config')
            local parsers = exist and type(config) == 'table' and config.ensure_installed.parsers or {}

            treesitter.setup({
                ensure_installed = parsers,
                highlight = opts.Highlight,
                refactor = opts.Refactor,
                context_commentstring = require('ts_context_commentstring').setup({
                    enable_autocmd = false,
                }),
                textobjects = opts.Textobjects,
            })

            vim.treesitter.query.set("javascript", "context", "")
            vim.treesitter.query.set("typescript", "context", "")
            vim.treesitter.query.set("lua", "context", "")
            vim.treesitter.query.set("xml", "context", "")
        end,
    },
}
