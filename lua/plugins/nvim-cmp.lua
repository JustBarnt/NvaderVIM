return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            local ok, _ = pcall(require, "lspkind")
            if not ok then
                vim.notify_once("Failed to load lskind", vim.log.levels.ERROR)
                return
            end

            vim.opt.completeopt = { "menu", "menuone", "noselect" }

            local cmp = require "cmp"
            local config = require("core.completion").config

            cmp.setup(config)
            cmp.setup.cmdline(":", {
                mapping = require("cmp").mapping.preset.cmdline(),
                sources = require("cmp").config.sources({
                    { name = "cmdline" },
                }),
                formatting = {
                    fields = { "abbr", "kind" },
                },
            })
        end,
        dependencies = {
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
        },
    },
    { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
}
