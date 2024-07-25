local M = {}

local cmp = require("cmp")

M.cmdline_search = {
  type = { "/", "?" },
  opts = {
    formatting = {
      fields = { "abbr" },
    },
    sources = cmp.config.sources({
      {
        { name = "buffer" },
      },
    }),
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
  },
}

M.cmdline = {
  type = { ":" },
  opts = {
    formatting = { fields = { "abbr" } },
    mapping = cmp.mapping.preset.cmdline({
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }), { "c" }),
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Replace }), { "c" }),
    }),
    sources = cmp.config.sources({
      { name = "cmdline" },
      { name = "path" },
    }),
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
  },
}

return M
