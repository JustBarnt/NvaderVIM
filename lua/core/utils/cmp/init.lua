local cmp_utils = {}

cmp_utils.select_item_smart = function(dir, opts)
  ---@module cmp
  return function(fallback)
    opts = opts or { behavior = require("cmp").SelectBehavior.Select }
    fallback = opts.fallback or fallback
    if require("cmp").visible() then
      ---@diagnostic disable-next-line: invisible
      if require("cmp").core.view.custom_entries_view:is_direction_top_down() then
        ({ next = require("cmp").select_next_item, prev = require("cmp").select_prev_item })[dir](opts)
      else
        ({ prev = require("cmp").select_prev_item, next = require("cmp").select_next_item })[dir](opts)
      end
    else
      fallback()
    end
  end
end

cmp_utils.set_hl = function(r, g, b)
  local color = string.format("%02x%02x%02x", r, g, b)
  local group = "CmpColor" .. color
  local opts = { bg = "#" .. color }
  if vim.fn.hlID(group) < 1 then
    vim.api.nvim_set_hl(0, group, opts)
  end
  return group
end

return cmp_utils
