local utils = require "core.utils"

return {
  "mbbill/undotree",
  event = "BufReadPre",
  opts = {},
  config = function(_, opts)
    if vim.g.loaded_undotree == 1 then
      vim.g.undotree_WindowLayout = 2
      if vim.fn.has "win32" == 1 then
        vim.g.undotree_DiffCommand = "FC"
      end
    end
  end,
}
