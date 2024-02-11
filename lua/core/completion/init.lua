local cmp = require "cmp"
local types = require "cmp.types"
local luasnip = require "luasnip"
local lspkind = require "lspkind"
local compare = require("core.completion.comparators").compare
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
            cmp.config.compare.recently_used,
            cmp.config.compare.order,
            cmp.config.compare.kind,
            compare(types.lsp.CompletionItemKind.Keyword),
            compare(types.lsp.CompletionItemKind.Snippet),
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
        { name = "nvim_lsp", priority = 1 },
        { name = "nvim_lua", priority = 2 },
    }, {
        { name = "path", priority = 1 },
        { name = "nerdfont", priority = 2 },
        { name = "luasnip", priority = 3 },
        { name = "buffer", keyword_length = 5, priority = 3 },
    }, {
        { name = "neorg" },
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
                nerdfont = "Icon",
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
