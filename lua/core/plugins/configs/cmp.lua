local has_cmp, cmp = pcall(require, "cmp")
local has_lspkind, lspkind = pcall(require, "lspkind")

if not has_cmp and not has_lspkind then
  error("Failed to load cmp or one of its dependencies", vim.log.levels.ERROR)
  return
end

local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")
local comparators = require("cmp.config.compare")

---@class cmp.ConfigSchema
cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  completion = {
    autocomplete = {
      cmp.TriggerEvent.TextChanged,
      -- cmp.TriggerEvent.InsertEnter,
    },
    completeopt = "menu,menuone,noselect,popup",
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    expandable_indicator = true,
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind =
        lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50, before = tailwindcss_colorizer_cmp.formatter })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true })),
  },
  sources = {
    { name = "lazydev", group_index = 0 },
    {
      name = "nvim_lsp",
      entry_filter = function(entry, ctx)
        return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
      end,
    },
    { name = "luasnip" },
    { name = "path" },
    { name = "snippets" },
    { name = "buffer", keyword_length = 5, max_item_count = 4 },
  },
  sorting = {
    priority_weight = 10,
    comparators = {
      comparators.offset,
      comparators.scopes,
      comparators.exact,
      comparators.score,
      comparators.recently_used,
      comparators.kind,
      comparators.length,
      comparators.order,
    },
  },
  window = {
    completion = {
      border = "solid",
      winhighlight = "Normal:TelescopePromptNormal,FloatBorder:TelescopePromptNormal,Search:None",
      col_offset = -4,
      side_padding = 0,
    },
    documentation = {
      border = "solid",
      winhighlight = "Normal:TelescopePromptNormal,FloatBorder:TelescopePromptNormal,Search:None",
    },
  },
})

cmp.setup.cmdline({ "/", "?" }, {
  experimental = {
    ghost_text = false,
  },
  formatting = {
    fields = { "abbr" },
  },
  sources = {
    { name = "buffer" },
  },
  view = {
    entries = {
      name = "wildmenu",
      separator = " | ",
    },
  },
  window = {
    completion = {
      border = "Solid", -- single|rounded|none
      winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeNormal,Search:None",
      winblend = 0,
      col_offset = -4,
    },
  },
})

cmp.setup.cmdline({ ":" }, {
  formatting = { fields = { "abbr" } },
  mapping = cmp.mapping.preset.cmdline({
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }), { "c" }),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Replace }), { "c" }),
  }),
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
  window = {
    completion = {
      border = "solid",
      winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeNormal,Search:None",
      col_offset = -4,
      side_padding = 4,
      width = 60,
      row = 7,
      col = (vim.o.columns - 62) / 2,
    },
  },
  view = {
    entries = {
      name = "custom",
      follow_cursor = false,
      selection_order = "near_cursor",
    },
  },
})
