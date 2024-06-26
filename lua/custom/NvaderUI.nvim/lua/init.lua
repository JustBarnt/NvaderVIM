local ui = {}
local statuscolumn = require("statuscol.statuscol")

ui.default_config = {
  disabled = {
    filetypes = { "help", "lazy", "TelescopePrompt" },
    buftypes = { "terminal", "nofile" },
  },
  statuscol = {
    enabled = true,
    setup_defaults = true,
    components = {
      {
        name = "number",
        type = "hybrid",
      },
      {
        name = "gap",
        style = " "
      },
      {
        name = "border",
        style = "│",
      },
      {
        name = "gap",
      },
    },
  },
}

ui.buf_check = function(buffer, config)
  local cfg = {}

  if vim.tbl_contains(config.disabled.filetypes or {}, vim.bo[buffer].filetype) then
    goto validated
  end

  if vim.tbl_contains(config.disabled.buftypes or {}, vim.bo[buffer].buftype) then
    goto validated
  end

  cfg = config.default
  ::validated::

  statuscolumn.init(buffer, cfg.statuscol)
end


-- Plugin setup
--- @param user_config table
ui.setup = function(user_config)
  local merged_config = vim.tbl_deep_extend("keep", ui.default_config, user_config or {})

  vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" },{
    pattern = "*",
    callback = function(data)
      local buffer = data.buf
      ui.buf_check(buffer, merged_config)
    end
  })
end

return ui
