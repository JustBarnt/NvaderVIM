-- Mapleader should be set as quick as possible. There is no reason to not set it at the very top of your initial init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = ","

if vim.g.vscode then
  require("core.keymaps")
  require("core.options")
  return
end

require("core")

if vim.fn.has("win32") == 1 then
  local ori_fnameescape = vim.fn.fnameescape
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.fn.fnameescape = function(...)
    local result = ori_fnameescape(...)
    return result:gsub("\\", "/")
  end
end

vim.diagnostic.config {
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  float = {
    border = "rounded",
    format = function(d)
      return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code)
    end,
  },
  underline = true,
}
