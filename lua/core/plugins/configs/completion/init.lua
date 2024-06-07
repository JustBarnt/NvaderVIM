local has_cmp, cmp = pcall(require, "cmp")
local has_lspkind, lspkind = pcall(require, "lspkind")
local has_luasnip, luasnip = pcall(require, "luasnip")

if not has_cmp and not has_lspkind and not has_luasnip then
  error("Failed to load cmp or one of its dependencies", vim.log.levels.ERROR)
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

local cmp_kinds = require("core.utils.icons").cmp_kinds

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
      border = "rounded", -- single|rounded|none
      -- custom colors
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
      side_padding = 0, -- padding at sides
      col_offset = -4, -- move floating box left or right
    },
    documentation = {
      border = "rounded", -- single|rounded|none
      -- custom colors
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      -- vscode like icons for cmp autocompletion
      local fmt = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
        before = tailwindcss_colorizer_cmp.formatter, -- prepend tailwindcss-colorizer
      })(entry, item)

      -- customize lspkind format
      local strings = vim.split(fmt.kind, "%s", { trimempty = true })

      -- strings[1] -> default icon
      -- strings[2] -> kind

      -- set different icon styles
      fmt.kind = " " .. (cmp_kinds[strings[2]] or "") -- concatenate icon based on kind

      -- append customized kind text
      fmt.kind = fmt.kind .. " " -- just an extra space at the end
      fmt.menu = strings[2] ~= nil and ("  " .. (strings[2] or "")) or ""

      return fmt
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
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }),
      { "i", "c" }
    ),

    -- Invoke Completion Menu
    ["<C-Space>"] = cmp.mapping.complete({}),

    ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true })),
  },
})

cmp.setup.cmdline({ "/", "?" }, {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
