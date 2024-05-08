local M = {}

local on_list = function(options)
  vim.fn.setqflist({}, " ", options)
  vim.api.nvim_command("cfirst")
end

M.on_list = on_list
return M
