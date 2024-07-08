local has_autopairs, autopairs = pcall(require, "nvim-autopairs")

if not has_autopairs then
  error("Failed to load autopairs")
  return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "spectre_panel", "neo-tree" },
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

cmp.event:on("config_done", cmp_autopairs.on_confirm_done())
