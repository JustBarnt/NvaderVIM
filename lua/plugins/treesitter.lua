return {
    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.2",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            { "nvim-treesitter/nvim-treesitter-textobjects", commit = "dd0b203" },
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
                indent = {
                    enable = true,  
                },
                highlight = opts.Highlight,
                refactor = opts.Refactor,
                context_commentstring = require('ts_context_commentstring').setup({
                    enable_autocmd = false,
                }),
                textobjects = opts.Textobjects,
            })
            vim.treesitter.query.set("xml", "context", "")
            vim.treesitter.query.set("typescript", 'textobjects', "")
        end,
    },
}
