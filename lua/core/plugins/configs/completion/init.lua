local has_cmp, cmp = pcall(require, "cmp")
local has_lspkind, lspkind = pcall(require, "lspkind")
local has_luasnip, luasnip = pcall(require, "luasnip")

if not has_cmp and not has_lspkind and not has_luasnip then
  error("Failed to load cmp or one of its dependencies", vim.log.levels.ERROR)
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
lspkind.init({})

---@class cmp.ConfigSchema
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
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
    { name = "buffer", keyword_length = 5 },
  },
  completion = {
    autocomplete = {
      cmp.TriggerEvent.TextChanged,
      cmp.TriggerEvent.InsertEnter,
    },
    completeopt = "menu,menuone,noselect",
  },
  performance = {
    max_view_entries = 15,
  },
  experimental = {
    ghost_text = true,
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
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  mapping = {
    -- Go-To next and previous completions
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

    -- Scroll Docs
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    -- Close Completion Menu
    ["<C-e>"] = cmp.mapping.abort(),

    -- Confirm Selection
    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }), { "i", "c" }),
    -- Invoke Completion Menu
    ["<C-Space>"] = cmp.mapping.complete({}),

    ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true })),
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
      border = "none", -- single|rounded|none
      winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeNormal,Search:None",
      winblend = 0,
      col_offset = -4,
    },
  },
})

-- cmp.setup.cmdline(":", {
--   experimental = {
--     ghost_text = false,
--   },
--   formatting = {
--     fields = { "abbr" },
--   },
--   sources = {
--     { name = "cmdline" },
--     { name = "path" },
--   },
--   view = {
--     entries = {
--       name = "custom",
--       follow_cursor = false,
--       selection_order = "top_down",
--     },
--   },
--   window = {
--     completion = {
--       border = "none", -- single|rounded|none
--       winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeNormal,Search:None",
--       winblend = 0,
--       col_offset = -4,
--     },
--   },
-- })

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
