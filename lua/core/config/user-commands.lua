local enabled = require("core.utils").enabled

if enabled("commands", "quit_all") then
  vim.api.nvim_create_user_command("Q", function()
    vim.cmd [[:qall!]]
  end, { bang = true, desc = "Quit All without Saving" })
end

if enabled("commands", "format") then
  vim.api.nvim_create_user_command("LspFormat", function()
    require("conform").format { async = true, lsp_fallback = true }
  end, { bang = false })
end
