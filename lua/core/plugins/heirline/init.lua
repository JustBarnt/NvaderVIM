local utils = require "core.utils"

return {
  "rebelot/heirline.nvim",
  dependencies = {
    "zeioth/heirline-components.nvim",
  },
  event = "VeryLazy",
  opts = function()
    local lib = require "heirline-components.all"

    return {
      opts = {
        disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
          local is_disabled = not require("heirline-components.buffer").is_valid(args.buf)
            or lib.condition.buffer_matches({
              buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
              filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
            }, args.buf)
          return is_disabled
        end,
      },
      tabline = {},
      winbar = {},
      statuscolumn = {
        init = function(self)
          self.bufnr = vim.api.nvim_get_current_buf()
        end,
        lib.component.foldcolumn(),
        lib.component.numbercolumn(),
        lib.component.signcolumn(),
      },
      statusline = {
        hl = { fg = "fg", bg = "bg" },
        lib.component.mode(),
        lib.component.git_branch(),
        lib.component.file_info(),
        lib.component.diagnostics(),
        lib.component.fill(),
        lib.component.lsp(),
        lib.component.nav(),
        lib.component.mode { surround = { separator = "right" } },
      },
    }
  end,
  config = function(_, opts)
    local heirline = require "heirline"
    local heirline_components = require "heirline-components.all"

    heirline_components.init.subscribe_to_events()
    heirline.load_colors(heirline_components.hl.get_colors())
    heirline.setup(utils.create_spec("heirline", opts))
  end,
}