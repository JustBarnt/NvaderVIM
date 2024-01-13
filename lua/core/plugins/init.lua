local make_plugin_spec = require 'core.utils.tbl'.make_plugin_spec

local M = {}

local plugin_dir = vim.fn.stdpath("config") .. "/lua/core/plugins/"
local glob = vim.fn.glob(plugin_dir .. "*.lua", true, true)

for _, pathname in ipairs(glob) do
  local filename = vim.fn.fnamemodify(pathname, ":t:r")

  if filename ~= 'init' then
    local spec = require('core.plugins.' .. filename)
    make_plugin_spec(M, spec)
  end

end

return M
