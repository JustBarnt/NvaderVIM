local enabled = require("core.utils").enabled

vim.api.nvim_create_user_command("FastAction", function()
  local fa = require("fastaction")
  fa.code_action()
end, { bang = false, desc = "Activate Fast Actions" })

vim.api.nvim_create_user_command("FastActionRange", function()
  local fa = require("fastaction")
  fa.range_code_action()
end, { bang = false, desc = "Activate Fast Actions Within Visual Selectoin" })

vim.api.nvim_create_user_command("Q", function()
  vim.cmd([[:qall!]])
end, { bang = true, desc = "Quit All without Saving" })

vim.api.nvim_create_user_command("LspFormat", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { bang = false })
