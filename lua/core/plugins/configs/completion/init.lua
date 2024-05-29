local has_cmp, cmp = pcall(require, "cmp")
local has_lspkind, lspkind = pcall(require, "lspkind")
local has_luasnip, luasnip = pcall(require("luasnip"))

if not has_cmp and not has_lspkind and not has_luasnip then
  error("Failed to load cmp or one of its dependencies", vim.log.levels.ERROR)
  return
end

local types = require("cmp.types")

local hide_text_entries = function(entry, _)
  return types.lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
lspkind.init {}

---@class cmp.ConfigSchema
cmp.setup {
  sources = {
    { name = "nvim_lsp", entry_filter = hide_text_entries },
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
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None",
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  mapping = {
    -- Go-To next and previous completions
    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },

    -- Scroll Docs
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    -- Close Completion Menu
    ["<C-e>"] = cmp.mapping.abort(),

    -- Confirm Selection
    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm { behavior = cmp.SelectBehavior.Replace, select = true }, { "i" }),

    -- Invoke Completion Menu
    ["<C-Space>"] = cmp.mapping.complete {},

    -- Jump to Next and Previous Snippet expansions
    ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip and luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if luasnip and luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }), -- Select Completion Item
    ["<CR>"] = cmp.mapping(cmp.mapping.confirm { behavior = cmp.SelectBehavior.Replace, select = true }),
  },
}

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
