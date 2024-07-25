local M = {}

M.cmdline_search = {
  type = { "/", "?" },
  opts = {
    formatting = {
      fields = { "abbr" },
    },
    sources = require("cmp").config.sources({
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
    mapping = require("cmp").mapping.preset.cmdline({
      ["<C-j>"] = require("cmp").mapping(
        require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Replace }),
        { "c" }
      ),
      ["<C-k>"] = require("cmp").mapping(
        require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Replace }),
        { "c" }
      ),
    }),
    sources = require("cmp").config.sources({
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

M.lspkind = require("core.utils.cmp.formatting")

return M
