local cmp = require "cmp"
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

vim.opt.completeopt = { "menu", "menuone", "noselect" }

---@class cmp.ConfigSchema
local config = {
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }), { "i" }),
        ["<Tab>"] = cmp.config.disable,
    },
    -- Order sources are defined are the order they appear on the completion menu
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,

            -- copied from cmp-under, but I don't think I need the plugin for this.
            -- I might add some more of my own.
            function(entry1, entry2)
                local _, entry1_under = entry1.completion_item.label:find "^_+"
                local _, entry2_under = entry2.completion_item.label:find "^_+"
                entry1_under = entry1_under or 0
                entry2_under = entry2_under or 0
                if entry1_under > entry2_under then
                    return false
                elseif entry1_under < entry2_under then
                    return true
                end
            end,

            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    experimental = {
        ghost_text = true,
    },
    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "text",
            maxwidth = function()
                return math.floor(vim.o.columns * 0.45)
            end,
            menu = {
                nvim_lua = "Lua",
                nvim_lsp = "LSP",
                buffer = "Buffer",
                cmdline = "Cmdline",
                luasnip = "Snippet",
            },
        }),
    },
}

-- Setup autocompletion for LSP and others
cmp.setup(config)

-- Setup autocompletion for search
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "buffer" },
    }),
})

-- Setup autocompletion for cmdline
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "cmdline" },
    }),
    formatting = {
        fields = { "abbr", "kind" },
    },
})
